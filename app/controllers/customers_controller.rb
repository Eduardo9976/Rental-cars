class CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end

  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params_customer)
    if @customer.save
      redirect_to @customer
    else 
      render :new
    end
  end
  
  def show
    @customer = set_customers
  end   

  def edit 
    set_customers
  end
  
  def update
    @customer = set_customers
    if @customer.update(params_customer)
      redirect_to @customer
    else
      render :edit
    end
  end

  def destroy
    set_customers
    @customer.destroy
    redirect_to customers_path
  end
  
  
  private
  def set_customers
    @customer = Customer.find(params[:id])
  end 
  def params_customer
    params.require(:customer).permit(:name, :cpf, :email)
  end 
end