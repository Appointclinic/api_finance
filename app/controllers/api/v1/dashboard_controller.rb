class Api::V1::DashboardController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboard
  def index
    cash_account = CashAccount.current_opened_accounting(@current_user.current_company_unity)

    @incomings = Incoming.open(cash_account)
    @outgoings = Outgoing.open(cash_account)

    @incomings = @incomings.map{ |incoming| {transaction_type: 'incoming', data: JSON.parse(incoming.to_json)} }
    @outgoings = @outgoings.map{ |outgoing| {transaction_type: 'outgoing', data: JSON.parse(outgoing.to_json)} }

    @transactions = @incomings + @outgoings
    @transactions.sort_by{ |t| t[:data][:created_at] }

    # authorize! :index, cash_account
    render json: @transactions
  end
end
