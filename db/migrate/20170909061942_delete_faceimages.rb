class DeleteFaceimages < ActiveRecord::Migration[5.0]
  def change
    drop_table :face_images
  end
end
