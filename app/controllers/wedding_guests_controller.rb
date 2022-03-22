class WeddingGuestsController < ApplicationController
  before_action :authenticate_request!
  before_action :find_wedding
  before_action :find_wedding_guest, except: [:create, :index]

  def index
    @wedding_guests = @wedding.wedding_guests
    render json: {results: @wedding_guests}
  end

  def create
    @wedding_guest = @wedding.wedding_guests.new parameter

    if @wedding_guest.save
      render json: @wedding_guest, status: 200
    else
      render json: { errors: @wedding_guest.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def show
    render json: @wedding_guest, status: 200
  end

  def update
    if @wedding_guest.update parameter
      render json: @wedding_guest, status: 200
    else
      render json: { errors: @wedding_guest.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    if @wedding_guest.destroy
      render json: @wedding_guest, status: 200
    else
      render json: { errors: @wedding_guest.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private

  def parameter
    params.permit :phone, :name, :email, :gender, :attachments, :is_join, :is_attended_their_wedding, :money_you_send, :money_you_receive, :note
  end

  def find_wedding
    @wedding = Wedding.find params[:wedding_id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Wedding not found' }, status: 404
  end

  def find_wedding_guest
    @wedding_guest = WeddingGuest.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Wedding guest not found' }, status: 404
  end
end
