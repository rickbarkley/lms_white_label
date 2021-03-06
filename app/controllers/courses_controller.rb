class CoursesController < ApplicationController
    before_filter :authenticate_user!
    #before_filter :admin_user,   :only => [:destroy, :create, :edit, :update]
    # GET /courses
    # GET /courses.json
    def index
        if params[:search]
            @courses = Course.search(params[:search]).paginate(:page => params[:page], :per_page => 5)       
          else
        @courses = Course.paginate(:page => params[:page], :per_page => 5)
        end
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @courses }
            
        end
    end
    
    # GET /courses/1
    # GET /courses/1.json
    def show
        @course = Course.find(params[:id])
        
        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @course }
        end
    end
    
    # GET /courses/new
    # GET /courses/new.json
    def new
      authorize! :new, @user, :message => 'Not authorized as an administrator.'
        @course = Course.new
        @video = Video.new
        #1.times do
            video = @course.videos.build
            
            respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @course }
            #end
        end
    end
    
    # GET /courses/1/edit
    def edit
        @course = Course.find(params[:id])
    end
    
    # POST /courses
    # POST /courses.json
    def create
      authorize! :create, @user, :message => 'Not authorized as an administrator.'
        @course = Course.new(params[:course])
        
        respond_to do |format|
            if @course.save
                format.html { redirect_to @course, notice: 'Course was successfully created.' }
                format.json { render json: @course, status: :created, location: @course }
                else
                format.html { render action: "new" }
                format.json { render json: @course.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # PUT /courses/1
    # PUT /courses/1.json
    def update
      authorize! :update, @user, :message => 'Not authorized as an administrator.'
        @course = Course.find(params[:id])
        
        respond_to do |format|
            if @course.update_attributes(params[:course])
                format.html { redirect_to @course, notice: 'Course was successfully updated.' }
                format.json { head :no_content }
                else
                format.html { render action: "edit" }
                format.json { render json: @course.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # DELETE /courses/1
    # DELETE /courses/1.json
    def destroy
      authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
        @course = Course.find(params[:id])
        @course.destroy
        
        respond_to do |format|
            format.html { redirect_to courses_url }
            format.json { head :no_content }
        end
    end
end
