class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [ :show, :edit, :update, :destroy ]
  before_action :set_render, only: [ :show, :edit, :update ]
  def index
    @enrollments = Enrollment.all
    respond_to do |format|
      format.html
      format.json { render json: @enrollments }
    end
  end
  def show
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    ActiveRecord::Base.transaction do
      @enrollment = Enrollment.create!(enrollment_params)
      due_date = calculate_due_date(@enrollment.due_day)
      invoice_qtd = @enrollment.invoice_quantity
      invoice_value = calculate_value_invoice(@enrollment.total_value, invoice_qtd)
      invoice_qtd.times do
          Invoice.create!(
            invoice_value: invoice_value,
            due_date: due_date,
            enrollment: @enrollment,
            status: "aberta"
          )
          due_date = due_date.advance(months: 1)
      end
    end
    redirect_to enrollments_url
  end

  def edit
  end

  def update
    if @enrollment.update(enrollment_params)
      redirect_to enrollments_url(@enrollment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
     if @enrollment.destroy

       redirect_to enrollments_path
     else
      redirect_to @enrollment
     end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:total_value, :invoice_quantity, :due_day, :course_name, :university_id, :student_id)
  end

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def set_render
    render json: @enrollment if request.format.json?
  end

  def calculate_due_date(day)
    actually_date = Date.today
    today = actually_date.day
    if day <= today
      date_return = actually_date.advance(months: 1)
    else
      date_return = actually_date.change(day: day)
    end
    date_return
  end

  def calculate_value_invoice(total, quantity)
    value = total/quantity
    value.round(2)
  end
end
