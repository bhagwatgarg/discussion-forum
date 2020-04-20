class UserpostsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_userpost, only: [:show, :edit, :update, :destroy]

  # GET /userposts
  # GET /userposts.json
  # GET /userposts/1
  # GET /userposts/1.json
  def show
  end

  # GET /userposts/new
  def new
    @userpost = Userpost.new
  end

  # GET /userposts/1/edit
  def edit
  end

  # POST /userposts
  # POST /userposts.json
  def create
    @userpost = Userpost.new(userpost_params)
    @userpost.user_id=session[:user_id]
    respond_to do |format|
      if @userpost.save
        format.html { redirect_to root_path, notice: 'Userpost was successfully created.' }
        format.json { render :show, status: :created, location: @userpost }
      else
        format.html { render :new }
        format.json { render json: @userpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userposts/1
  # PATCH/PUT /userposts/1.json
  def update
    respond_to do |format|
      if @userpost.update(userpost_params)
        format.html { redirect_to view_profile_path, notice: 'Userpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @userpost }
      else
        format.html { render :edit }
        format.json { render json: @userpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userposts/1
  # DELETE /userposts/1.json
  def destroy
    @userpost.destroy
    respond_to do |format|
      format.html { redirect_to view_profile_path, notice: 'Userpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userpost
      @userpost = @user.userposts.find(params[:id])
    end
    def set_user
      @user = User.find(session[:user_id])
    end
    # Only allow a list of trusted parameters through.
    def userpost_params
      params.require(:userpost).permit(:title, :content)
    end
end
