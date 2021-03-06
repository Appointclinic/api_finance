class Api::V1::OutgoingsController < Api::ApiController
  before_action :set_outgoing, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /outgoings
  def index
    @incomings = CashAccount.current_opened_accounting(@current_user.current_company_unity).outgoings

    render json: @outgoings
  end

  # GET /outgoings/1
  def show
    render json: @outgoing
  end

  # POST /outgoings
  def create
    @outgoing = Outgoing.new(outgoing_params)

    if @outgoing.save
      render json: @outgoing, status: :created
    else
      render json: @outgoing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outgoings/1
  def update
    if @outgoing.update(outgoing_params)
      render json: @outgoing
    else
      render json: @outgoing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outgoings/1
  def destroy
    @outgoing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outgoing
      @outgoing = Outgoing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def outgoing_params
      params.require(:outgoing).permit(:client_name, :cash_account_id, :client_identification, :value, :expense, :observations, :description, :bank_account_id, :kind, :split, :repeat, :repeat_period, :repeat_occurrency, :upfront_payment, :split_quantity, :due_date, :paid, :paid_at)
    end
end
