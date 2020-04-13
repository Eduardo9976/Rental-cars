class CarcategoriesController < ApplicationController

  def index
    @carcategories = Carcategory.all
  end
  
  def new
    @carcategory = Carcategory.new
  end 
  
  
  def create 
    @carcategory = Carcategory.new(params_carcategory)
    if @carcategory.save
      redirect_to @carcategory
    else
      render :new
    end     
  end
  
  def show
    @carcategory = set_carcategory
  end


  private

  def params_carcategory
    params.require(:carcategory).permit(:name, :dialyrate, :insurance, :thirdinsurance)
  end
  
  def set_carcategory
    @carcategory = Carcategory.find(params[:id])
  end    
end  