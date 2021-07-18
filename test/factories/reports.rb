# frozen_string_literal: true

FactoryBot.define do
  factory :report, class: Report do
    title { 'Railsでテストを書く' }
    content { 'システムテストを書いた' }
    association :user
  end
end
