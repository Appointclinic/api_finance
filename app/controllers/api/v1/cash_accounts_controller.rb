class CashAccountsController < ApplicationController
  before_action :set_cash_account, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /cash_accounts
  def index
    @cash_accounts = CashAccount.all

    render json: @cash_accounts
  end

  # GET /cash_accounts/1
  def show
    render json: @cash_account
  end

  # POST /cash_accounts
  def create
    @cash_account = CashAccount.new(cash_account_params)

    if @cash_account.save
      render json: @cash_account, status: :created, location: @cash_account
    else
      render json: @cash_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cash_accounts/1
  def update
    if @cash_account.update(cash_account_params)
      render json: @cash_account
    else
      render json: @cash_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cash_accounts/1
  def destroy
    @cash_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_account
      @cash_account = CashAccount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cash_account_params
      params.require(:cash_account).permit(:company_unity_id, :enclosing, :responsible, :total_registered)
    end
end
