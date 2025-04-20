class InvoicesController < ApplicationController
  before_action :set_invoice,only: [:show,:edit,:update,:destroy]
  def index
    @invoices = Invoice.all
  end
  def show
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
  end

  def edit
  end

  def update
  end

  def destroy
    @invoice.destroy
  end


  private

  def invoice_params
    params.require(:invoice).permit(:invoice_value,:due_date,:enrollment,:status)
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end
