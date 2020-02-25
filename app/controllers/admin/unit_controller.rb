class Admin::UnitController < ApplicationController

    layout 'element/adminMain'

    def index
        @units = Unit.all
        @get_carts = Cart.all     
    end

    def new
        @new = Unit.new
    end

    def create
        @unit = Unit.new(unit_params)
        if @unit.save
            redirect_to admin_unit_index_path
        end
    end

    def edit
        @edit = Unit.find(params[:id])
    end

    def update
        @unit = Unit.find(params[:id])
        if @unit.update(unit_params)
            redirect_to admin_unit_index_path
        end
    end

    def destroy
        @unit = Unit.find(params[:id])
        if @unit.delete
            redirect_to admin_unit_index_path
        end
        
    end

    private
    def unit_params
        params.require(:unit).permit(:name, :category_id)
    end

end
