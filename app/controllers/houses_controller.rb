class HousesController < ApplicationController
  before_action :set_house, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error :not_found, :house_not_found
  end

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
    @house.house_status = "available"

    if @house.save
      render :show, status: :created, location: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    if @house.update(house_params)
      render :show, status: :ok, location: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:address, :province, :description, :house_owner, :house_status, :renting_price)
    end
end
