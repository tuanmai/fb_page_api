require "active_support/all"
require "fb_page_api/version"
require "fb_page_api/config"
require "fb_page_api/edge/all"

module FbPageApi
  extend self

  def configure
    yield(FbPageApi::Config) if block_given?
    FbPageApi::Config
  end

  def labels
    FbPageApi::Edge::AdminLabel.new
  end

  def admin_notes
    FbPageApi::Edge::AdminNote.new
  end

  def conversations
    FbPageApi::Edge::Conversation.new
  end

  def users
    FbPageApi::Edge::User.new
  end
end
