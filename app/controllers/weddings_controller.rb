class WeddingsController < ApplicationController
  before_action :authenticate_request!, only: [:create, :update]
  before_action :find_wedding, except: [:create]

  def create
    @wedding = @current_user.weddings.new parameter
    if @wedding.save
      MockCheckList.new(@wedding).perform()
      render json: @wedding, status: 200
    else
      render json: { errors: @wedding.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def show
    render json: @wedding, status: 200
  end

  def update
    if @wedding.update parameter
      render json: @wedding, status: 200
    else
      render json: { errors: @wedding.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    if @wedding.destroy
      render json: @wedding, status: 200
    else
      render json: { errors: @wedding.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private

  def parameter
    params.permit :owner_name, :owner_gender, :partner_name,
      :partner_gender, :partner_email, :partner_phone, :wedding_name, :wedding_time
  end

  def find_wedding
    @wedding = Wedding.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Wedding not found' }, status: 404
  end
end
