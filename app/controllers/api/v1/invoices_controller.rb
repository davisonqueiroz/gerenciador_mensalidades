module Api
  module V1    
    class InvoicesController < ApplicationController
      before_action :set_invoice, only: [ :show, :edit, :update, :destroy ]
      before_action :set_render, only: [ :show, :edit, :update ]
      def index
        @invoices = Api::V1::Invoice.all
        respond_to do |format|
          format.html
          format.json { render json: @invoices }
        end
      end
      def show
      end

      def new
        @invoice = Api::V1::Invoice.new
      end

      def create
        @invoice = Api::V1::Invoice.new(invoice_params)
        if @invoice.save
          redirect_to invoices_url
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
      end

      def update
        if @invoice.update(invoice_params)
          redirect_to invoices_url(@invoice)
        else
          render :new, status: :unprocessable_entity
        end
      end

      def destroy
        if @invoice.destroy
          redirect_to invoices_path
        else
          redirect_to @invoice
        end
      end


      private

      def invoice_params
        params.require(:invoice).permit(:invoice_value, :due_date, :enrollment_id, :status)
      end

      def set_invoice
        @invoice = Api::V1::Invoice.find(params[:id])
      end

      def set_render
        render json: @invoice if request.format.json?
      end
    end
  end
end