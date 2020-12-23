FactoryBot.define do
  factory :comment do
    body {"コメント"}

    association :user
    association :post
  end
end
