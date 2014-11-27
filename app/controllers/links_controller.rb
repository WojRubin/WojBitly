class LinksController <  ApplicationController
  respond_to :js, :html
 
  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
    
    if @link.save
      respond_with @link   
    else 
      respond_with { }
      format.html { redirect_to '/', :error => "Could not save link" }
    end
  end

  def redirect
    @link = Link.find_real_link(params[:bitly_link])
    redirect_to "http://#{@link.real_link}"
  end

private

  def link_params
    params.require(:link).permit(:real_link)
  end
end