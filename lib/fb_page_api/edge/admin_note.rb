module FbPageApi
  module Edge
    class AdminNote < Base
      def edge_name
        'admin_notes'
      end

      def request_fields
        ['body', 'from', 'id', 'user']
      end
    end
  end
end
