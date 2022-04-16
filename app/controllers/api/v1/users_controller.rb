class Api::V1::UsersController < ApplicationController

  def create
    if ActiveSupport::TimeZone[user_params[:location]].present?
      if @user = User.create(user_params)
        render json: {status: 200, message: "User has been created"}, status: 200
      else
        render json: {status: 422, message: @user.errors.full_messages}, status: 422
      end
    else
      render json: {status: 422, message: "Location is not supported", supported_location: ActiveSupport::TimeZone::MAPPING.map{|name,_| name}}, status: 422
    end
  end

  def delete
    @user = User.find(params[:id])
    if @user.destroy
      render json: {status: 200, message: "User data has been destroyed"}, status: 200
    else
      render json: {status: 422, message: @user.errors.full_messages}, status: 422
    end
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :location, :birthday_date)
  end
end
