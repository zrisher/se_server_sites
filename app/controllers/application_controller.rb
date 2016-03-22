class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ZanoboRails::Caching::Cacheable
  include ZanoboRails::Crawlable::ServesMetatags
  include HasClan

  helper ZanoboRails::Contentful::FaviconHelper
  helper ZanoboRails::Crawlable::MetaTagsHelper
end
