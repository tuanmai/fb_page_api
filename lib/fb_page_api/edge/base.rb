module FbPageApi
  module Edge
    class Base
      attr_accessor :parent_id, :page_after, :page_before

      def initialize(parent_id = Config.page_id)
        self.parent_id = parent_id
      end

      def collection(*args)
        options = args.extract_options!
        @collection = []
        begin
          rs = http_request(:get, api_endpoint, query: body_params(options))
          data = rs.parsed_response['data']
          if data.present?
            @collection = @collection | data
            self.page_after = rs.parsed_response['paging']['cursors']['after']
          end
        end while data.present?
        @collection
      end

      def get(object_id)
        http_request(:get, object_api_endpoint(object_id), query: body_params(options))
      end

      def delete(object_id)
        http_request(:delete, object_api_endpoint(object_id), query: body_params(options))
      end

      def create(*args)
        options = args.extract_options!
        http_request(:post, api_endpoint, query: body_params(options))
      end

      private
      def edge_name
        raise 'Please override this method in inherit class'
      end

      def http_request(method, *args)
        rs = HTTParty.send(method, *args)
        if rs.code != 200
          raise rs.parsed_response['error']['message']
        end
        rs
      end

      def api_endpoint
        "#{Config.api_endpoint}/#{self.parent_id}/#{edge_name}"
      end

      def object_api_endpoint(object_id)
        "#{Config.api_endpoint}/#{object_id}"
      end

      def body_params(params = {})
        params
          .merge(auth_params)
          .merge(paginate_params)
          .merge(field_params)
      end

      def auth_params
        {
          access_token: Config.page_access_token
        }
      end

      def field_params
        {
          fields: request_fields.join(',')
        }
      end

      def paginate_params
        if self.page_after.present?
          {
            limit: 1000,
            after: self.page_after
          }
        else
          {
            limit: 1000,
          }
        end
      end

      def request_fields
        ['id']
      end
    end
  end
end
