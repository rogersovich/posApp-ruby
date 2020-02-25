class Admin::ProductController < ApplicationController

    layout 'element/adminMain'

    def index
        @products = Product.all
        @get_carts = Cart.all     
    end

    def pesen
        @params = params[:pesen]
        tampung = []
        
        @params.each do |s|
            
            
            @product = Product.find(s)
            tampung.push(@product)
            
        end

        @tampung = tampung
    end

    def order

        @params = params[:pesen]
        
        @params.each do |n, m|
            
            @product = Product.find(m[:id])
            @cart = Cart.where(product_id: m[:id]).first
            
            # abort @cart.inspect

            if @cart == nil
                Cart.new(qty: m[:qty], product_id: m[:id]).save
            else
                @change = @cart.qty + m[:qty].to_i
                @cart.update(qty: @change)
            end
            
            @change = @product.stok - m[:qty].to_i
            @product.update(stok: @change)

        end

        redirect_to admin_product_index_path
        
    end

    def new
        @new = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to admin_product_index_path
        end
    end


    def edit
        @edit = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to admin_product_index_path
        end
    end

    def destroy
        @product = Product.find(params[:id])
        if @product.delete
            redirect_to admin_product_index_path
        end
    end

    private
    def product_params
        params.require(:product).permit(:name, :harga, :stok, :category_id, :unit_id)
    end

    def cart_params
        
        params.require(:cart).permit(:qty, :product_id)
        
    end

end
