class Api::V1::LinksController < ApiController
  # GET /v1/links
  before_action :authenticate

  def index
    render json: current_user.links
  end

  # POST /v1/links
  def create
    link = current_user.links.new(url: params[:url])
    if link.save
      render json: link
    else
      render json: { error: link.errors.full_messages.join(', ') }
    end
  end
end
