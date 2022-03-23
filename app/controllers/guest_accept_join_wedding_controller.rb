class GuestAcceptJoinWeddingController < ApplicationController
  before_action :authenticate_request!
  before_action :find_wedding

  def create
    @wedding_guest.join_status = :confirmed
    @wedding_guest.save
    render json: @wedding_guest
  end

  def destroy
    @wedding_guest.join_status = :cancelled
    @wedding_guest.save
    render json: @wedding_guest
  end

  private

  def find_wedding_guest
    @wedding_guest = WeddingGuest.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Wedding guest not found' }, status: 404
  end
end
