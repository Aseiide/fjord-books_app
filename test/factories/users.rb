# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    name { 'alice' }
    email { 'alice@example.com' }
    password { 'password' }
  end
end
