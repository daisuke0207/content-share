# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { 'user' }
    email { 'user@com' }
    password { 'abc456' }
    password_confirmation { password }
  end
end
