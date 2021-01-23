class Api::V1::CompanyUnitiesController < ApplicationController
  before_action :set_company_unity, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /company_unities
  def index
    @company_unities = CompanyUnity.all

    render json: @company_unities
  end

  # GET /company_unities/1
  def show
    render json: @company_unity
  end

  # POST /company_unities
  def create
    @company_unity = CompanyUnity.new(company_unities_params)

    if @company_unity.save
      render json: @company_unity, status: :created, location: @company_unity
    else
      render json: @company_unity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_unities/1
  def update
    if @company_unity.update(company_unitie_params)
      render json: @company_unity
    else
      render json: @company_unity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /company_unities/1
  def destroy
    @company_unity.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_unity
      @company_unity = CompanyUnity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_unities_params
      params.permit(:name, :business_id)
    end
end
