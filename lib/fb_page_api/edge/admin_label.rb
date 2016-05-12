module FbPageApi
  module Edge
    class AdminLabel < Base
      def edge_name
        'labels'
      end

      def request_fields
        ['users', 'name']
      end
    end
  end
end
