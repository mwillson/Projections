class ProjectionsController < ApplicationController

  before_filter :signed_in_user, only: [:new, :create, :destroy]
  # before_filter :correct_user, only: [:new, :create, :destroy]

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

  def show
    @projection = Projection.find(params[:id])
  end

  def index
    @projections = Projection.all
  end
 
  def destroy
  end

end
