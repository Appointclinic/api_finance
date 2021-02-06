class Api::V1::IncomingsController < ApplicationController
  before_action :set_incoming, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /incomings
  def index
    @incomings = Incoming.all

    render json: @incomings
  end

  # GET /incomings/1
  def show
    render json: @incoming
  end

  # POST /incomings
  def create
    @incoming = Incoming.new(incoming_params)

    if @incoming.save
      render json: @incoming, status: :created
    else
      render json: @incoming.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incomings/1
  def update
    if @incoming.update(incoming_params)
      render json: @incoming
    else
      render json: @incoming.errors, status: :unprocessable_entity
    end
  end

  # DELETE /incomings/1
  def destroy
    @incoming.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incoming
      @incoming = Incoming.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def incoming_params
      params.require(:incoming).permit(:cash_account_id, :parent_id, :client_name, :client_identification, :value, :observations, :description, :bank_account_id_id, :kind, :split, :repeat, :repeat_period, :repeat_occurrency, :upfront_payment, :split_quantity, :due_date, :paid, :paid_at)
    end
end
