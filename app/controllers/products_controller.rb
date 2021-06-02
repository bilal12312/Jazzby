class ProductsController < ApplicationController
	http_basic_authenticate_with name: "bilal", password: "123", except: [:index, :show]

	 def index
    @products = Product.all
  end
	def show
 		@product = Product.find(params[:id])
	
	end

	def new
		 @product = Product.new
  end

  def edit

  @product = Product.find(params[:id])
  authorize @product
end

 def create
  @product = Product.new(product_params)
  authorize @product
 
  if @product.save
    redirect_to @product
  else
    render 'new'
  end
end

def update
  @product = Product.find(params[:id])
  authorize @product
  if @product.update(product_params)
    redirect_to @product
  else
    render 'edit'
  end
end

def destroy
    @product = Product.find(params[:id])
    
    if  authorize @product
      flash[:error] = "First name should not be blank.n"
    end
    @product.destroy
 
    redirect_to products_path
  end
 
private
  def product_params
    params.require(:product).permit(:name, :price ,:image)
  end
end


