module Api
  module V1    
    class UniversitiesController < ApplicationController
      before_action :set_university, only: [ :show, :edit, :update, :destroy ]
      before_action :set_render, only: [ :show, :edit, :update ]
      def index
        @universities = Api::V1::University.all
        respond_to do |format|
          format.html
          format.json { render json: @universities }
        end
      end
      def show
      end

      def new
        @university = Api::V1::University.new
      end

      def create
        @university = Api::V1::University.new(university_params)
        if @university.save
          redirect_to universities_url
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
      end

      def update
        if @university.update(university_params)
          redirect_to universities_url(@university)
        else
          render :new, status: :unprocessable_entity
        end
      end

      def destroy
        if @university.destroy
          redirect_to universities_path
        else
          redirect_to @university
        end
      end


      private

      def university_params
        params.require(:university).permit(:name, :cnpj, :university_type)
      end

      def set_university
        @university = Api::V1::University.find(params[:id])
      end

      def set_render
        render json: @university if request.format.json?
      end
    end
  end
end