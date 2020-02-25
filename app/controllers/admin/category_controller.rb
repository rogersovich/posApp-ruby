class Admin::CategoryController < ApplicationController

    layout 'element/adminMain'


    def index
        @categories = Category.all
        @get_carts = Cart.all     
    end

    def new
        @new = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to admin_category_index_path
        end
    end

    def edit
        @edit = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            redirect_to admin_category_index_path
        end
    end

    def destroy
        @category = Category.find(params[:id])
        if @category.delete
            redirect_to admin_category_index_path
        end
        
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

end
