# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  # フォローの1対多の関係
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy,
                                  inverse_of: :follower
  # フォロワーの1対多の関係
  has_many :passive_relationshops, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy,
                                   inverse_of: :followed
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationshops, source: :follower

  # フォローする
  def follow(other_user)
    followings << other_user
  end

  # フォロー解除
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしていたらtrueを返す
  def following?(other_user)
    followings.include?(other_user)
  end
end
