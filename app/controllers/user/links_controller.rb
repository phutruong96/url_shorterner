class User::LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: %i[show edit update destroy]
  before_action :validate_owner, only: %i[show edit update destroy]

  def create
    link = current_user.links.new(link_params)
    if link.save
      redirect_to user_link_path(link)
    else
      flash[:error] = link.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

  def update
    if @link.update(link_params)
      redirect_to user_link_path(@link)
    else
      flash[:error] = @link.errors.full_messages.join(', ')
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if @link.destroy
      flash[:success] = 'Deleted link successfully'
      redirect_to user_links_path
    else
      flash[:error] = @link.errors.full_messages.join(', ')
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def set_link
    @link = Link.find params[:id]
  end

  def validate_owner
    return if AuthService.link_owner?(@link, current_user)
    flash[:error] = "You don't have permission to access this page"
    redirect_to root_path
  end
end
