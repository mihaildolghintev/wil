class NotesController < ApplicationController
  def index
    @q = Note.ransack(params[:q])
    @notes = @q.result(distinct: true)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
