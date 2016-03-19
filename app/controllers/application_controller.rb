class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_menu

  private

  def set_menu
    @menu_rooms = Room.all
    @menu_departments = Department.all
    @menu_committees = Committee.all
  end
end
