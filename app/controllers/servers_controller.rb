class ServersController < ApplicationController

  def show
    @server = Server.find(params[:id])
  end

  def index
    @servers = Server.all
  end

end
