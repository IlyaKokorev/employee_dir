class PositionsController < ApplicationController
  before_action :set_position, only: %i[show edit update destroy]
  after_action :verify_authorized, except: %i[show index]

  # GET /positions
  def index
    @positions = Position.all
  end

  # GET /positions/1
  def show
  end

  # GET /positions/new
  def new
    @position = Position.new

    authorize @position
  end

  # GET /positions/1/edit
  def edit
    authorize @position
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    authorize @position

    if @position.save
      redirect_to @position, success: t('controllers.positions.save')
    else
      render :new, warning: t('controllers.positions.not_save')
    end
  end

  # PATCH/PUT /positions/1
  def update
    authorize @position

    if @position.update(position_params)
      redirect_to @position, success: t('controllers.positions.update')
    else
      render :edit
    end
  end

  # DELETE /positions/1
  def destroy
    authorize @position

    @position.destroy
    redirect_to positions_url, success: t('controllers.positions.delete')
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def position_params
    params.require(:position).permit(:name)
  end
end
