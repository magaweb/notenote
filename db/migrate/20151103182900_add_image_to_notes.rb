class AddImageToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :image_id, :string
  end
end
