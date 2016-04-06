class MembersController < ApplicationController
  before_action :set_room, only: [:index]
  before_action :set_department, only: [:index]
  before_action :set_committee, only: [:index]
  before_action :build_member, only: [:create]
  before_action :set_member, only: [:edit, :destroy, :update]
  before_action :build_face_image, only: [:create, :update]
  before_action :set_form_properties, only: [:edit, :new, :create]

  def index
    group = [
      @room&.members,
      @department&.members,
      @committee&.members,
      Member.all
    ].find { |g| g.present? }
    @members = group.eager_load :department, :committee, :room
  end

  def unconfirmed
    @members = Member.where(sent_confirmed: false)
    render template: 'members/index'
  end

  def edit
  end

  def destroy
    @member.destroy
    redirect_to action: :index
  end

  def update
    @member.attributes = properties_params.except(:face_image)
    if @member.save
      redirect_to action: :index
    else
      render :edit
    end
  end

  def new
    @member = Member.new()
  end

  def create
  	if @member.save
  	  redirect_to action: :index
    else
      render :new
    end
  end

  def confirmation
    timestamp = Time.zone.strptime('%Y-%m-%d')

    ConfirmationMailer.send_mailing_list(timestamp).deliver
    Member.where(sent_confirmed: false).each do |member|
      ConfirmationMailer.confirm(member, timestamp).deliver if member.mail_address != ''
    end
  end

  private

  # before_action
  def set_member
  	@member = Member.find(id_params[:id])
  end

  def build_member
  	@member = Member.new(properties_params.except(:face_image))
  end

  def build_face_image
    fm = properties_params[:face_image]
    @face_image = @member.build_face_image(image: fm) if fm.present?
  end

  def set_room
    @room = Room.find_by(id: room_params[:room_id])
  end

  def set_department
    @department = Department.find_by(id: department_params[:department_id])
  end

  def set_committee
    @committee = Committee.find_by(id: committee_params[:committee_id])
  end

  def set_form_properties
    @departments = Department.all
    @committees = Committee.all
    @rooms = Room.all
  end

  # strong parameters
  def id_params
  	params.permit(:id)
  end

  def properties_params
  	params
      .require(:member)
  	  .permit(
  	  	:name,
  	  	:room_id,
  	  	:department_id,
  	  	:committee_id,
  	  	:phone_number,
  	  	:mail_address,
        :is_absent,
        :sent_confirmed,
        :face_image
  	  )
  end

  def room_params
    params.permit(:room_id)
  end

  def department_params
    params.permit(:department_id)
  end

  def committee_params
    params.permit(:committee_id)
  end
end
