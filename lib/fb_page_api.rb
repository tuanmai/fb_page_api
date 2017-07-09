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

  def labels(options = {})
    FbPageApi::Edge::AdminLabel.new(options)
  end

  def admin_notes(options = {})
    FbPageApi::Edge::AdminNote.new(options)
  end

  def conversations(options = {})
    FbPageApi::Edge::Conversation.new(options)
  end

  def users(options = {})
    FbPageApi::Edge::User.new(options)
  end

  def messages(conversation_id, options = {})
    FbPageApi::Edge::Message.new(options.merge({ parent_id: conversation_id }))
  end

  def label_users(label_id, options = {})
    FbPageApi::Edge::LabelUser.new(options.merge({ parent_id: label_id })) 
  end
end
