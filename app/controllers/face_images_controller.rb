class FaceImagesController < ApplicationController
  before_action :set_face_image, only: [:edit, :update, :destroy]

  def destroy
    @face_image.destroy
    redirect_to controller: :members, action: :edit, id: @face_image.member.id
  end

  def edit
  end

  def update
    @face_image.attributes = face_image_params
    if @face_image.save
      redirect_to controller: :members, action: :edit, id: @face_image.member.id
    else
      render :edit
    end
  end

  private

  def set_face_image
    @face_image = FaceImage.find(id_params[:id])
  end

  def face_image_params
    params.require(:face_image)
          .permit(:image)
  end

  def id_params
    params.permit(:id)
  end
end
