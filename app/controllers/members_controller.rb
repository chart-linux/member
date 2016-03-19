class MembersController < ApplicationController
  before_action :set_room, only: [:index]
  before_action :set_department, only: [:index]
  before_action :set_committee, only: [:index]
  before_action :build_member, only: [:create]
  before_action :set_member, only: [:edit, :destroy, :update]
  before_action :set_form_properties, only: [:edit, :new]

  def index
    group = [
      @room&.members,
      @department&.members,
      @committee&.members,
      Member.all
    ].find { |g| g.present? }
    @members = group.eager_load :department, :committee, :room
  end

  def edit
  end

  def destroy
    @member.destroy
    redirect_to action: :index
  end

  def update
    @member.update(create_member_params)
    redirect_to action: :index
  end

  def new
    @member = Member.new()
  end

  def create
  	if @member.save
  	  redirect_to action: :index
  	else
  		redirect_to action: :new
  	end
  end

  private

  def set_member
  	@member = Member.find(show_member_params[:id])
  end

  def build_member
  	@member = Member.new(create_member_params)
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

  def show_member_params
  	params.permit(:id)
  end

  def create_member_params
  	params
      .require(:member)
  	  .permit(
  	  	:name,
  	  	:room_id,
  	  	:department_id,
  	  	:committee_id,
  	  	:phone_number,
  	  	:mail_address
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
