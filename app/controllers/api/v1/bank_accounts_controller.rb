class Api::V1::BankAccountsController < Api::ApiController
  before_action :set_bank_account, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /bank_accounts
  def index
    @bank_accounts = current_user.current_company_unity.bank_accounts

    render json: @bank_accounts
  end

  # GET /incomings/1
  def show
    render json: @bank_account
  end

  # POST /bank_accounts
  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      render json: @bank_account, status: :created
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bank_accounts/1
  def update
    if @bank_account.update(bank_account_params)
      render json: @bank_account
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bank_accounts/1
  def destroy
    @bank_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bank_account_params
      params.require(:bank_account).permit(:name, :company_unity_id, :initial_value)
    end
end
