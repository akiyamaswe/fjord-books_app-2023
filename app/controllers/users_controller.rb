# frozen_string_literal: true

class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @users = User.order(:id).page(params[:page])
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end
end
