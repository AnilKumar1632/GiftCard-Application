class OrdersController < ApplicationController
    def index
        @orders = Order.all
        render "index"
    end

    def adminhistory
        @orders = Order.all  
        render "adminhistory"
    end

    def orderhistory
        @orders = Order.all
    end

    def report
        render "report"
    end

    
    def create
        firstname = params[:firstname]
        lastname = params[:lastname]
        cardvalue = params[:cardvalue]
        commission = 0.05 * cardvalue.to_f
        date = Date.today
        fullname = firstname + lastname
        userid = params[:userid]
        invoice_number = SecureRandom.random_number(10000);
    
        while (true)
            if !Order.find_by(:id => invoice_number)
                break
            else
                invoice_number = SecureRandom.random_number(10000)
            end
        end
    
        invoice_number = "GF#{invoice_number}"
            
        Order.create(
            :orderid => invoice_number,
            :delivery_status=>"OUT FOR DELIVERY",
            :recipient_name => fullname,
            :card_value => cardvalue,
            :commission => commission,
            :ordered_date => date,
            :user_id => userid
        ) 
           render "orderhistory"
        end

        def edit
            id = params[:id]
            @order = Order.find_by(:orderid => id)
        end

        def update
            id=params[:id]
            @order = Order.find_by(:orderid => id)
            @order.update(:delivery_status =>  params[:order][:delivery_status])            
            redirect_to adminhistory_path
        end
end
