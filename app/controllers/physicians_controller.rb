class PhysiciansController < ApplicationController

def index
    @physicians = Physician.all
  end

  def new
    @physician = Physician.new  
  end
  def create
    @physician = Physician.new(physicians_params)
    if @physician.save
      redirect_to @physician
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @physician = Physician.find(params[:id])
  end

  private

  def physicians_params
    params.require(:physician).permit(:name)
  end

end
