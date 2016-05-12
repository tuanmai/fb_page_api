require 'spec_helper'

describe FbPageApi do
  subject { FbPageApi }
  it 'has a version number' do
    expect(FbPageApi::VERSION).not_to be nil
  end

  describe 'configure' do
    it 'responds to config' do
      expect(subject).to respond_to(:configure)
    end

    it 'yield Config if block given' do
      expect{ |b| subject.configure(&b) }.to yield_control
    end

    it 'returns Config' do
      expect(subject.configure).to be_a(FbPageApi::Config)
    end

    it 'updates config data' do
      expect {
        subject.configure do |config|
          config.api_version = 'v2.4'
        end
      }.to change(FbPageApi::Config, :api_version)
    end

     it { is_expected.to respond_to(:labels) }
     it { is_expected.to respond_to(:admin_notes) }
  end
end
