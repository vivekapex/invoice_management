class InvoicesController < ApplicationController
  before_action :require_usertype
  before_action :set_invoice, only: [:show, :edit, :update, :mark_as_digitized]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.includes(:line_items)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully uploaded.' }
        format.json { render :index, status: :created, location: invoices_path }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_as_digitized
    @invoice.update_column(:is_digitized, true)

    respond_to do |format|
      format.html { redirect_to invoices_path, notice: 'Invoice was successfully digitized.' }
      format.json { render :index, status: :ok, location: invoices_path }
    end
  end

  def add_line_item
    @invoice = Invoice.find_by(id: params[:id]) || Invoice.new
    @line_item = @invoice.line_items.build

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invoice_params
    params.require(:invoice).permit(:document, :internal_id, :external_id, :disbursement_date, :due_date,
      :description, :counterparty_type, :is_digitized, :gross_amount, :tax_rate, :tax, :status,
      line_items_attributes: [:id, :category_id, :quantity, :unit_price, :amount, :_destroy])
  end
end
