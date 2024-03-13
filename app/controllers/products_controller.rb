class ProductsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :show, :index]
  
    def index
      @products = Product.all
    end
  
    def edit
      @product = Product.find(params[:id])
    end
  
    def new
        @product = Product.new
    end
  
    def create
        @product = Product.new(product_params)
        @product.created_by = current_user
      
        if @product.save
          redirect_to products_path(@product), notice: 'Product was successfully created.'
        else
          render :new
        end
    end  
  
    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to products_path(@product), notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path, notice: 'Product was successfully destroyed.'
    end
  
    private
  
    def product_params
      params.require(:product).permit(:price, :title, :date, :description)
    end
  end
  