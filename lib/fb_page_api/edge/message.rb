module FbPageApi
  module Edge
    class Message < Base
      def edge_name
        'messages'
      end

      def request_fields
        ['from', 'id', 'to']
      end
    end
  end
end
