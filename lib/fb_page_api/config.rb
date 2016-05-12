module FbPageApi
  module Config
    extend self

    mattr_accessor :page_id, :page_access_token, :api_version

    @@host = 'https://graph.facebook.com/'
    @@api_version = 'v2.6'

    def api_endpoint
      "#{@@host}#{@@api_version}"
    end
  end
end
