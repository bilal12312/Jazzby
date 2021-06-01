class CustomersController < ApplicationController
	def index
    @customers = Customer.all
  end
	def show
 		@customer = Customer.find(params[:id])
	
	end

	def new
		 @customer = Customer.new
  end

  def edit
  @customer = Customer.find(params[:id])
end

 def create
 	 @article = Product.find(params[:Product_id])
  @customer = Customer.new(customer_params)
  authorize @customer
 
  if @customer.save
    redirect_to @customer
  else
    render 'new'
  end
end

def update
  @customer = Customer.find(params[:id])
  authorize @customer
  if @customer.update(customer_params)
    redirect_to @customer
  else
    render 'edit'
  end
end

def destroy
    @customer = Customer.find(params[:id])
    
    if  authorize @customer
      flash[:error] = "First name should not be blank.n"
    end
    @customer.destroy
 
    redirect_to customers_path
  end
 
private
  def customer_params
    params.require(:customer).permit(:name, :price)
  end
end
