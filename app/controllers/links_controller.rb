class LinksController < ApplicationController
  before_action :authenticate_user!
  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def create
    link = Link.new(slug: params[:slug],
                       target_url: params[:target_url],
                       user_id: current_user.id)
      if link.save
        Visit.create(link_id: link.id, ip_address: request.remote_ip)
      else
        raise ActionController::RoutingError.new('Not Found')
      end
    redirect_to "/links"
  end

  def show
    @link = Link.find_by(id: params[:id], user_id: current_user.id)
  end

  def edit
    @link = Link.find_by(id: params[:id])
  end

  def update
    link = @link = Link.find_by(id: params[:id])
    link.update(slug: params[:slug],
                       target_url: params[:target_url]
      )
  end

  def destroy 
    link = @link = Link.find_by(id: params[:id], user_id: current_user.id)
    link.delete
  end
end
