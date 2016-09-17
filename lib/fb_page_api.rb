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

  def messages(conversation_id)
    FbPageApi::Edge::Message.new(conversation_id)
  end

  def label_users(label_id)
    FbPageApi::Edge::LabelUser.new(label_id)
  end
end
