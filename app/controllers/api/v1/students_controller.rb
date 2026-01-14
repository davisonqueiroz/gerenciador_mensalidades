module Api
  module V1
    class StudentsController < ApplicationController
      before_action :set_student, only: [ :show, :edit, :update, :destroy ]
      before_action :set_render, only: [ :show, :edit, :update ]
      def index
        @students = Student.all
        respond_to do |format|
          format.html
          format.json { render json: @students }
        end
      end
      def show
      end

      def new
        @student = Student.new
      end

      def create
        @student = Student.new(student_params)
        if @student.save
          redirect_to students_url
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
      end

      def update
        if @student.update(student_params)
          redirect_to students_url(@student)
        else
          render :new, status: :unprocessable_entity
        end
      end

      def destroy
        if @student.destroy
          redirect_to students_path
        else
          redirect_to @student
        end
      end


      private

      def student_params
        params.require(:student).permit(:name, :cpf, :gender, :payment_method, :cellphone, :date_of_birth)
      end

      def set_student
        @student = Student.find(params[:id])
      end

      def set_render
        render json: @student if request.format.json?
      end
    end
  end
end