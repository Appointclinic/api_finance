class BusinessSubstoresController < ApplicationController
  before_action :set_business_substore, only: [:show, :update, :destroy]

  # GET /business_substores
  def index
    @business_substores = BusinessSubstore.all

    render json: @business_substores
  end

  # GET /business_substores/1
  def show
    render json: @business_substore
  end

  # POST /business_substores
  def create
    @business_substore = BusinessSubstore.new(business_substore_params)

    if @business_substore.save
      render json: @business_substore, status: :created, location: @business_substore
    else
      render json: @business_substore.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /business_substores/1
  def update
    if @business_substore.update(business_substore_params)
      render json: @business_substore
    else
      render json: @business_substore.errors, status: :unprocessable_entity
    end
  end

  # DELETE /business_substores/1
  def destroy
    @business_substore.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_substore
      @business_substore = BusinessSubstore.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_substore_params
      params.require(:business_substore).permit(:name, :business_id)
    end
end
