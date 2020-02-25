class Admin::OrderController < ApplicationController

    layout 'element/adminMain'

    def payment
        @carts = Cart.all
        @get_carts = Cart.all
        @proses = Order.new
    end

    def proses

        request = params
        carts = Cart.all

        code = Order.select(:code).max
        char = 'OR'
        if code == nil
            noUrut = 1
        else
                     
        end

        if noUrut.to_s.length == 1
            code = "#{char}000#{noUrut}"    
        elsif noUrut.to_s.length == 2
            code = "#{char}00#{noUrut}0"
        elsif noUrut.to_s.length == 3
            code = "#{char}0#{noUrut}00"
        else
            code = "#{char}#{noUrut}000"
        end

        date = Date.today.to_s
        kembalian = request[:bayar].to_i - request[:total].to_i 
        
        
        Order.new(
            code: code,
            tanggal: date,
            total_harga: request[:total].to_i,
            total_bayar: request[:bayar].to_i,
            kembalian: kembalian ,
        ).save

        order = Order.last
        
        carts.each do |c|
            
            OrderDetail.new(
                product_id: c[:product_id],
                order_id: order.id
            ).save

        end

        Cart.delete_all
        
        redirect_to admin_cart_index_path

    end

end
