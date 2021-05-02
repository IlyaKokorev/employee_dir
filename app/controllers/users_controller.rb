class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_users.xlsx"'
      }
    end
  end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new

    authorize @user
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    authorize @user

    set_admin(params)

    if @user.save
      redirect_to @user, success: t('controllers.users.save')
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    authorize @user

    set_admin(params)

    if @user.update(user_params)
      redirect_to @user, success: t('controllers.users.update')
    else
      render :edit, warning: t('controllers.users.not_update')
    end
  end

  # DELETE /users/1
  def destroy
    authorize @user

    @user.destroy
    redirect_to users_url, success: t('controllers.users.destroy')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:surname, :name,
                                 :patronymic, :date_employment,
                                 :phone, :login,
                                 :password, :email,
                                 :position_id)
  end

  def set_admin(params)
    case params[:admin]
    when "1"
      @user.add_role :admin
    when "0"
      @user.remove_role(:admin)
    end
  end
end
