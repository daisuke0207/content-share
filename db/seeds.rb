# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |n|
  Post.create!(
      title: "whiteの#{n+1}番目のタイトルです。whiteの#{n+1}番目のタイトルです。",
      body: "#{n+1}番目のコンテンツです。#{n+1}番目のコンテンツです。#{n+1}番目のコンテンツです。#{n+1}番目のコンテンツです。#{n+1}番目のコンテンツです。",
      is_publish: true,
      user_id: 1
  )
end

50.times do |n|
  Post.create!(
      title: "blackの#{n+1}番目のタイトルです。blackの#{n+1}番目のタイトルです。",
      body: "#{n+1}番目のコンテンツです。#{n+1}番目のコンテンツです。#{n+1}番目のコンテンツです。#{n+1}番目のコンテンツです。#{n+1}番目のコンテンツです。",
      is_publish: true,
      user_id: 2
  )
end