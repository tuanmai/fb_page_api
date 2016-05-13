module FbPageApi
  module Edge
    class User < Base
      def request_fields
        ['name', 'id']
      end
    end
  end
end
