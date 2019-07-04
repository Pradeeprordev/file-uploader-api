class Api::V1::UsersController < ApplicationController
  require 'roo'

  def index
    # TODO: Pagination
    @users = User.all
    render json: @users
  end

  def import_data
    is_success = User.import_file_data(params[:file].path)
    if is_success
      render json: { success: true }, status: 200
    else
      render json: { success: false }, status: 400
    end
  end
end
