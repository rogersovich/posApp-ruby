class Admin::CartController < ApplicationController

    layout 'element/adminMain'

    def index
        @carts = Cart.all
        @get_carts = Cart.all     
    end

    def new
        @new = Cart.new
    end

    def create
        @cart = Cart.new(cart_params)
        if @cart.save
            redirect_to admin_cart_index_path
        end
    end

    def edit
        @edit = Cart.find(params[:id])
    end

    def update
        @cart = Cart.find(params[:id])
        product = Product.where(id: @cart.product_id).take

        product.update(stok: (product.stok + @cart.qty) - cart_params[:qty].to_i )
        

        # abort product.inspect
        if @cart.update(cart_params)
            redirect_to admin_cart_index_path
        end

    end

    def destroy
        @cart = Cart.find(params[:id])
        @product = Product.where(id: @cart.product_id).take

        @product.update(stok: @product.stok + @cart.qty)
    

        if @cart.delete
            redirect_to admin_cart_index_path
        end
        
    end

    private
    def cart_params
        params.require(:cart).permit(:qty, :product_id)
    end

end
