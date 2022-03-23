# Tạo và định nghĩa các dịch vụ
class ServicesController < ApplicationController
  before_action :authenticate_request!, only: [:create, :update]
  before_action :find_service, except: [:index, :create]
  before_action :find_wedding

  def main_services
    services = Service.where(is_main: true)
    render json: services
  end

  def index
    @services = @wedding.services
    render json: @services
  end

  def create
    @service = @wedding.services.new parameter

    if @service.save
      render json: @service, status: 200
    else
      render json: { errors: @service.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def update
    if @service.update parameter
      render json: @service, status: 200
    else
      render json: { errors: @service.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    if @service.destroy
      render json: @service, status: 200
    else
      render json: { errors: @service.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private

  def parameter
    params.permit :name
  end

  def find_service
    @service = Service.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Service not found' }, status: 404
  end

  def find_wedding
    @wedding = Wedding.find params[:wedding_id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Wedding not found' }, status: 404
  end
end
