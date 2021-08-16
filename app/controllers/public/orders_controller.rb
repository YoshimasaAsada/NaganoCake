class Public::OrdersController < ApplicationController
    before_action :ensure_cart_items, only: [:confirm, :create, :new]
    def new
        @order = Order.new
        @address = Address.new
        @addresses = current_end_user.addresses.all
    end
    
    def confirm
        params[:order][:payment_method] = params[:order][:payment_method].to_i
        @order = Order.new(order_params)
        @order.end_user_id = current_end_user.id
        @order.shipping = 800
        @cart_items = current_end_user.cart_items
        @order.billing_amount = 0
        @cart_items.each do |cart_item|
            @order.billing_amount += cart_item.item.add_tax_price * cart_item.amount
        end
        if  params[:order][:address_option] == "0"
            @order.address = current_end_user.address
            @order.name = current_end_user.last_name + current_end_user.first_name
            @order.postal_code = current_end_user.postal_code
        elsif params[:order][:address_option] == "1"
            @order.address = Address.find(params[:order][:address_id]).address
            @order.name = Address.find(params[:order][:address_id]).name
            @order.postal_code = Address.find(params[:order][:address_id]).postal_code
        elsif params[:order][:address_option] == "2"
            @address = Address.new(address_params)
            @address.end_user_id = current_end_user.id
            @address.postal_code = params[:order][:postal_code]
            @address.address = params[:order][:address]
            @address.name = params[:order][:name]
            if @address.save
                @order.address = @address.address
                @order.name = @address.name
                @order.postal_code = @address.postal_code
            else
                render :new
            end
        end
    end
    
    def create
        @order = Order.new(order_params)
        @order.end_user_id = current_end_user.id
        @order.save
        @cart_items = current_end_user.cart_items
        @cart_items.each do |cart_item|
            @order_detail = OrderDetail.new
            @order_detail.item_id = cart_item.item.id
            @order_detail.order_id = @order.id
            @order_detail.price = cart_item.item.price
            @order_detail.amount = cart_item.amount
            @order_detail.save
        end
        @cart_items.destroy_all
        redirect_to orders_compleat_path
    end
    
    def index
        @orders = current_end_user.orders
    end
    
    def compleat
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
    private
    
      def ensure_cart_items
        unless current_end_user.cart_items.present?
            redirect_to cart_items_path
        end
      end

      def order_params
        params.require(:order).permit(:end_user_id, :postal_code, :address, :name, :shipping, :billing_amount, :payment_method, :status)
      end
      
      def address_params
        params.require(:order).permit(:end_user_id, :postal_code, :address, :name)
      end
end


