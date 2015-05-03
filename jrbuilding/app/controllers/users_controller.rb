class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
  	@user = User.new
    authorize! :create, @user
  end

  def create 
  	@user = User.new(user_params)
  	respond_to do |format|
      if @user.save
        format.html { redirect_to action: "index", notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    if params[:search].present?
      @users = User.near(params[:search], 50, :order => :distance)
    else
      @users = User.all
    end
  end

  # GET /users/1
  # GET /userss/1.json
  def show
    redirect_to action: "index"
  end

  def edit
    authorize! :update, @user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private

	  # Use callbacks to share common setup or constraints between actions.
	  def set_user
          @user = User.find(params[:id])
       rescue ActiveRecord::RecordNotFound  
          redirect_to root_url
       return
	  end

	    # Never trust parameters from the scary internet, only allow the white list through.
	  def user_params
	      params.require(:user).permit(:email, :password, :password_confirmation, :description, :avatar, :mlease, :expadd, :admin)
	  end


end
