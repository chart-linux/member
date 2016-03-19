module MemberHelper
  def belongs_name
    if @room.present?
      @room.name + "の"
    elsif @department.present?
      @department.name + "部会の"
    elsif @committee.present?
      @committee.name + "委員会の"
    else
      ""
    end
  end
end
