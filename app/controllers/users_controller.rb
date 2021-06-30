# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.order(:id)
    @users = User.page(params[:page]).per(15)
  end
end
