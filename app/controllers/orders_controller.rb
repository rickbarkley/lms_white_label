class OrdersController < ApplicationController
  
  #before_filter :get_course
  
    def new
        @course = Course.find(params[:course_id])
        @order = @course.orders.new
        
    end
    def show
        
        @order = Order.find(params[:id])
    end
    def index
        #@user = User.find(params[:id])
    	  if params[:search]
            @orders = Order.search(params[:search]).paginate(:page => params[:page], :per_page => 5)       
          else
        @orders = Order.paginate(:page => params[:page], :per_page => 5)
        end
    	
        @course = Course.all
        @title = "Available Classes"
    end
    
    def create
        
        @order = Order.new(params[:order])
        if @order.save_with_payment
            redirect_to @order, :notice => "Thank you for your purchase!  Enjoy your Class!"
            else
            render :new
        end
    end
    
    # GET /courses/1/edit
    def edit
        @order = Order.find(params[:id])
    end
    
    # PUT /courses/1
    # PUT /courses/1.json
    def update
        @order = Order.find(params[:id])
        
        respond_to do |format|
            if @order.update_attributes(params[:order])
                format.html { redirect_to @order, notice: 'Course was successfully updated.' }
                format.json { head :no_content }
                else
                format.html { render action: "edit" }
                format.json { render json: @order.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /courses/1
    # DELETE /courses/1.json
    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        
        respond_to do |format|
            format.html { redirect_to orders_url }
            format.json { head :no_content }
        end
    end
    
    #def get_course
     # @course = Course.find(params[:course_id])
#end
end


