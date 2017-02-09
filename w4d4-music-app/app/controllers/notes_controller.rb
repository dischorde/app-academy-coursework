class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    @note.track_id = params[:track_id]
    @note.user_id = current_user.id
    if @note
      @note.save
    else
      flash.now[:errors] = @note.errors.full_messages
    end
    redirect_to track_url(@note.track_id)
  end

  def destroy
    @note = Note.find(params[:id])
    if @note &&
      @note.destroy
      redirect_to track_url(@note.track_id)
    else
      render text: "You are not allowed to destroy this note", status: :forbidden
    end
  end

  private

  def note_params
    params.require(:note).permit(:user_id, :notes, :track_id)
  end

end
