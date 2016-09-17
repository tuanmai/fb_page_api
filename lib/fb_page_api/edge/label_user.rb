module FbPageApi
  module Edge
    class LabelUser < Base
      def edge_name
        'users'
      end

      def request_fields
        ['id', 'name']
      end
    end
  end
end
