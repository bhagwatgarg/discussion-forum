class SessionsController < ApplicationController
  #before_action :set_session, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_authentication
  # GET /sessions
  # GET /sessions.json
  # GET /sessions/1
  # GET /sessions/1.json
  # GET /sessions/new
  def new
    @session = Session.new
    if session[:user_id]
      redirect_to root_path
      return
    end
  end

  # GET /sessions/1/edit

  # POST /sessions
  # POST /sessions.json
  def create
    @user=User.find_by(username: session_params[:username])
    if @user
      if @user.authenticate(session_params[:password])
        session[:user_id]=@user.id
        redirect_to root_path, notice: "Login Successful"
        return
      else
        redirect_to login_path, alert: "Password Incorrect"
        return
      end
    else
      redirect_to login_path, alert: "Username Incorrect"
      return
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    reset_session
    redirect_to login_path, notice: "Logout Successful"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:username, :password)
    end
end
