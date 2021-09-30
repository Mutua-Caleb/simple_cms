class PublicController < ApplicationController

  layout 'public'


  def index
  end

  def show
    @page = Page.visible.where(:pemalink => params[:permalink]).first 
    if @page.nil?
      redirect_to(root_path)
    else 
      
    end
  end
end
