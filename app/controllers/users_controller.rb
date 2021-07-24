# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @title = User.human_attribute_name(:followings)
    @user = User.find(params[:id])
    @users = @user.followings
    render 'users'
  end

  def followers
    @title = User.human_attribute_name(:followers)
    @user = User.find(params[:id])
    @users = @user.followers
    render 'users'
  end
end
