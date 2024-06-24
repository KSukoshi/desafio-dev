class PaymentTransactionsController < ApplicationController
  before_action :set_payment_transaction, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /payment_transactions or /payment_transactions.json
  def index
    @payment_transactions = PaymentTransaction.all.includes(:payment_method)
    @total_value = PaymentTransaction.total_value.to_f
  end

  # GET /payment_transactions/1 or /payment_transactions/1.json
  def show
  end

  # GET /payment_transactions/new
  def new
    @payment_transaction = PaymentTransaction.new
  end

  # GET /payment_transactions/1/edit
  def edit
  end

  # POST /payment_transactions or /payment_transactions.json
  def create
    file = params[:file]
    if file.present?
      if file.content_type == 'text/plain'
        invalid_lines = []

        File.foreach(file.path).with_index do |line, index|
          line_number = index + 1
          line.chomp!
          line_length = line.size
          if line_length != 80
            puts "Line #{line_number} is not 80 characters long"
            invalid_lines << line_number
          end
        end
  
        if invalid_lines.any?
          redirect_to payment_transactions_path, alert: "File contains lines not equal to 80 characters: #{invalid_lines.join(', ')}."
        else
          FileParser.new(file.path).parse
          redirect_to payment_transactions_path, notice: 'File processed successfully.'
        end
      else
        redirect_to payment_transactions_path, alert: 'Only .txt files are allowed.'
      end
    else
      @payment_transaction = PaymentTransaction.new(payment_transaction_params)

      respond_to do |format|
        if @payment_transaction.save
          format.html { redirect_to payment_transactions_path, notice: "Transaction was successfully created." }
          format.json { render :show, status: :created, location: @payment_transaction }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @payment_transaction.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /payment_transactions/1 or /payment_transactions/1.json
  def update
    respond_to do |format|
      if @payment_transaction.update(payment_transaction_params)
        format.html { redirect_to payment_transaction_url(@payment_transaction), notice: "Payment transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @payment_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_transactions/1 or /payment_transactions/1.json
  def destroy
    @payment_transaction.destroy!

    respond_to do |format|
      format.html { redirect_to payment_transactions_url, notice: "Payment transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_transaction
      @payment_transaction = PaymentTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_transaction_params
      params.require(:payment_transaction).permit(:transaction_date, :value, :cpf, :payment_card, :paid_at, :store_owner, :store_name, :payment_method_id)
    end
end