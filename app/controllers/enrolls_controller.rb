class EnrollsController < ApplicationController
    before_filter :authenticate_user!
  # GET /enrolls
  # GET /enrolls.json
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
      	  if params[:search]
              @enrolls = Enroll.search(params[:search]).paginate(:page => params[:page], :per_page => 5)       
            else
          @enrolls = Enroll.paginate(:page => params[:page], :per_page => 5)
          end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enrolls }
    end
  end

  # GET /enrolls/1
  # GET /enrolls/1.json
  def show
      @course = Course.all
    @enroll = Enroll.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enroll }
    end
  end

  # GET /enrolls/new
  # GET /enrolls/new.json
  def new
    authorize! :new, @user, :message => 'Not authorized as an administrator.'
    @enroll = Enroll.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enroll }
    end
  end

  # GET /enrolls/1/edit
  def edit
    authorize! :edit, @user, :message => 'Not authorized as an administrator.'
    @enroll = Enroll.find(params[:id])
  end

  # POST /enrolls
  # POST /enrolls.json
  def create
    @enroll = Enroll.new(params[:enroll])

    respond_to do |format|
      if @enroll.save
        format.html { redirect_to @enroll, notice: 'Enroll was successfully created.' }
        format.json { render json: @enroll, status: :created, location: @enroll }
      else
        format.html { render action: "new" }
        format.json { render json: @enroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enrolls/1
  # PUT /enrolls/1.json
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @enroll = Enroll.find(params[:id])

    respond_to do |format|
      if @enroll.update_attributes(params[:enroll])
        format.html { redirect_to @enroll, notice: 'Enroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolls/1
  # DELETE /enrolls/1.json
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    @enroll = Enroll.find(params[:id])
    @enroll.destroy

    respond_to do |format|
      format.html { redirect_to enrolls_url }
      format.json { head :no_content }
    end
  end
end
