class ProjectionsController < ApplicationController

  before_filter :signed_in_user

  def new
    @projection = Projection.new
  end

  def create
    @projection = current_user.projections.build(params[:projection])
    if @projection.save
      flash[:success] = "Projection submitted!"
      redirect_to root_path
    else
      render 'new'
    end
  end
 
  def destroy
  end

end
