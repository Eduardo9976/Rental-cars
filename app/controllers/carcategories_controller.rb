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

  def edit
    @carcategory = set_carcategory
  end
  def update
    set_carcategory
    if @carcategory.update(params_carcategory)
      redirect_to @carcategory
    else
      render :edit
    end  
  end
  
  def destroy  
    set_carcategory
    @carcategory.destroy
    redirect_to carcategories_path
  end  


  private

  def params_carcategory
    params.require(:carcategory).permit(:name, :dialyrate, :insurance, :thirdinsurance)
  end
  
  def set_carcategory
    @carcategory = Carcategory.find(params[:id])
  end    
end  