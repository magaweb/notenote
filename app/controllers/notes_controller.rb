class NotesController < ApplicationController
    before_action :find_note, only: [:show, :edit, :update, :destroy, :search]
    before_action :authenticate_user!

    def index
        if params[:search]
            @notes = Note.where(user_id: current_user).search(params[:search]).order("created_at DESC")
        else
            @notes = Note.where(user_id: current_user).order('created_at DESC')
        end
    end

    def show
    end

    def new
        @note = current_user.notes.build
    end

    def create
        @note = current_user.notes.build(note_params)

        if @note.save
            redirect_to @note
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @note.update(note_params)
            redirect_to @note
        else
            render 'edit'
        end
    end

    def destroy
        @note.destroy
        redirect_to notes_path
    end

    private

    def find_note
        @note = Note.find(params[:id])
    end

    def note_params
        params.require(:note).permit(:title, :content)
    end

    def search
       @search = params[:search][:q]
    end

end
