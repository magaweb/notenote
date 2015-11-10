class AddPhotoToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :photo_id, :string
  end
end
