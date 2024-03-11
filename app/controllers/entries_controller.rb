#Edits by GPT 4.0 based on User stories

class EntriesController < ApplicationController
  before_action :require_user
  before_action :set_entry, only: %i[show edit update destroy]
  before_action :set_place, only: [:new, :create]

  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = @place.entries.build(entry_params.merge(user_id: current_user.id))

    if @entry.save
      redirect_to place_path(@entry.place_id), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)
  end
end
