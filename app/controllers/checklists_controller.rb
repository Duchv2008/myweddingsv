class ChecklistsController < ApplicationController
  before_action :authenticate_request!, only: [:create, :update]
  before_action :find_checklist, except: [:index, :create]
  before_action :find_wedding

  def index
    @checklists = @wedding.checklists
    render json: {results: @checklists}
  end

  def create
    @checklist = @wedding.checklists.new parameter

    if @checklist.save
      render json: @checklist, status: 200
    else
      render json: { errors: @checklist.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def update
    if @checklist.update! parameter
      render json: @checklist, status: 200
    else
      render json: { errors: @checklist.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    if @checklist.destroy
      render json: @checklist, status: 200
    else
      render json: { errors: @checklist.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private

  def parameter
    params.permit :name, :status, :date, :note
  end

  def find_checklist
    @checklist = Checklist.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Checklist not found' }, status: 404
  end

  def find_wedding
    @wedding = Wedding.find params[:wedding_id]
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Wedding not found' }, status: 404
  end
end
