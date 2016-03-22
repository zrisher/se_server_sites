class ServersController < ApplicationController
  helper MarkdownHelper

  before_action :find_server, only:
    [:show, :rules, :settings, :mods, :roadmap, :map]

  def index
    @servers = Server.all
  end

  def show
  end

  def rules
  end

  def settings
  end

  def mods
  end

  def roadmap
  end

  def map
  end

  private
  def find_server
    @server = Server.find(params[:id])
  end

end
