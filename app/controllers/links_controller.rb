class LinksController <  ApplicationController
  respond_to :html, :js

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)

  end

  def redirect
    @link = Link.find_real_link(params[:bitly_link])
    redirect_to @link.real_link
  end

private

  def link_params
    params.require(:link).permit(:real_link)
  end
end