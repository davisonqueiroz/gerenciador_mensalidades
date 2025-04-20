class UniversitiesController < ApplicationController
  before_action :set_university,only: [:show,:edit,:update,:destroy]
  def index
    @universitys = University.all
  end
  def show
  end

  def new
    @university = University.new
  end

  def create
    @university = University.new(invoice_params)
  end

  def edit
  end

  def update
  end

  def destroy
    @university.destroy
  end


  private

  def university_params
    params.require(:university).permit(:name,:cnpj,:type)
  end

  def set_university
    @university = University.find(params[:id])
  end
end
