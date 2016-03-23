class AddMemberIdToFaceImage < ActiveRecord::Migration[5.0]
  def change
    add_reference :face_images, :member, index: true
  end
end
