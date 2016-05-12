require 'spec_helper'

describe FbPageApi::Config do
  subject { FbPageApi::Config }

  describe 'default config' do
    it 'responds to api_version and api_endpoint' do
      expect(subject).to respond_to(:api_endpoint)
      expect(subject).to respond_to(:api_version)
      expect(subject).to respond_to(:page_id)
      expect(subject.api_version).to eq 'v2.6'
    end
  end
end
