class Api::V1::CompaniesController < Api::ApiController
  before_action :set_company, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /companies
  def index
    @companies = Company.current_user_company(current_user)

    render json: @companies
  end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.permit(:name, :tax_id)
    end
end
