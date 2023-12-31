class CustomersController < ApplicationController
  before_action :set_customer, only: %i[edit update destroy]
  before_action :set_customer_select_options, only: %i[new edit create update]

  # GET /customers or /customers.json
  def index
    @customers = Customer.order(:name)
  end

  # GET /customers/1 or /customers/1.json
  def show
    @customer = Customer.includes(:customer_versions).find(params[:id])
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), success: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), success: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, success: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :primary_contact, :support_level, :rating, :billing_strategy, :billing_provider, :currency, :language, :promo_code, :in_setup, :two_fa_active)
    end

    def set_customer_select_options
      @support_level_options = Customer::SUPPORT_LEVELS
      @rating_options = Customer::RATINGS
      @billing_strategy_options = Customer::BILLING_STRATEGIES
      @billing_provider_options = Customer::BILLING_PROVIDERS
    end
end
