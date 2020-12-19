# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { '投稿タイトル' }
    body {'投稿内容'}
    is_publish { false }

    association :user
  end
end
