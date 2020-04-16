class SubsidiariesController < ApplicationController
  
  def index
    @subsidiaries = Subsidiary.all
  end

  
  def new 
    @subsidiary = Subsidiary.new
  end
  
  def create
    @subsidiary = Subsidiary.new(params_subsidiary)
    if @subsidiary.save
      redirect_to @subsidiary
    else
      render :new
    end    
  end  
  

  def show
    @subsidiary = set_subsidiary
  end


  def edit
    set_subsidiary
  end
  
  def update
    set_subsidiary
    if @subsidiary.update(params_subsidiary)
      redirect_to @subsidiary
    else
      render :edit
    end    
  end
  
  def destroy
    set_subsidiary
    @subsidiary.destroy
    redirect_to subsidiaries_path
  end  

  
  private

  def set_subsidiary
    @subsidiary = Subsidiary.find(params[:id])
  end
  
  def params_subsidiary
    params.require(:subsidiary).permit(:name, :cnpj, :address)

  end  

end  