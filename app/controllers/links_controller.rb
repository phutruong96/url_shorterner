class LinksController < ApplicationController
  def show
    @link = Link.find_by_shorter_url(params[:shorter_url])
    if @link.nil?
      flash[:error] = 'Page Not Found'
      redirect_to root_path
    else
      @link.update_attribute(:clicked, @link.clicked + 1)
      redirect_to @link.url
    end
  end
end
