class CustomersController < ApplicationController
  before_action :set_customers, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @customers = Customer.all
  end

  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params_customer)
    if @customer.save
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to @customer
    else 
      render :new
    end
  end
  
  def show
    
  end   

  def edit 
    
  end
  
  def update
    if @customer.update(params_customer)
      flash[:notice] = 'Salvo com sucesso'
      redirect_to @customer
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  def search 
    @customers = Customer.where(cpf: params[:q])
    render :index
  end  
  
  
  private
  def set_customers
    @customer = Customer.find(params[:id])
  end 
  def params_customer
    params.require(:customer).permit(:name, :cpf, :email)
  end 
end