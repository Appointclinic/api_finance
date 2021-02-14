class Api::V1::DashboardController < ApplicationController
  before_action :authenticate_user!
  
  # GET /dashboard
  def index
    @incomings = Incoming.all
    @newInc = OpenStruct.new
    @incomings.each do |key, value|
      @newInc.flag = 'pt'
      @newInc.id = key.id
      @newInc.cash_account_id = key.cash_account_id
      @newInc.parent_id = key.parent_id
      @newInc.client_name = key.client_name
      @newInc.client_identification = key.client_identification
      @newInc.value = key.value
      @newInc.observations = key.observations
      @newInc.description = key.description
      @newInc.bank_account_id = key.bank_account_id
      @newInc.kind = key.kind
      @newInc.split = key.split
      @newInc.repeat = key.repeat
      @newInc.repeat_period = key.repeat_period
      @newInc.repeat_occurrency = key.repeat_occurrency
      @newInc.upfront_payment = key.upfront_payment
      @newInc.split_quantity = key.split_quantity
      @newInc.due_date = key.due_date
      @newInc.paid = key.paid
      @newInc.paid_at = key.paid_at
      @newInc.created_at = key.created_at
      @newInc.updated_at = key.updated_at
    end

    puts @newInc

    
    # @outgoings = Outgoing.all
    # @bank_statements = @outgoings + @incomings


    render json: @incomings
  end
end
