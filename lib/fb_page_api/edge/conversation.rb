module FbPageApi
  module Edge
    class Conversation < Base
      def edge_name
        'conversations'
      end

      def request_fields
        ['link', 'id']
      end
    end
  end
end
