# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Faker::Omniauth.github

10.times do
  User.create(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    username: Faker::Internet.user_name,
    bio: Faker::Matz.quote,
    github_profile_url: Faker::Internet.url("github.com"),
    avatar_url: Faker::Avatar.image,
    password: Faker::Internet.password(8)
  )
end

Community.create([
  {title: 'JavaScript', short_description: 'JavaScript (JS) is a lightweight interpreted or JIT-compiled programming language with first-class functions. While it is most well-known as the scripting language for Web pages.', user_id: 1},
  {title: 'Ruby', short_description: 'A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.', user_id: 2},
  {title: 'Ruby on Rails', short_description: 'Learning to build a modern web application is daunting. Ruby on Rails makes it much easier and more fun. It includes everything you need to build fantastic applications, and you can learn it with the support of our large, friendly community.', user_id: 1},
])

Post.create([
  {title: 'Newbies Introduction to Ruby on Rails', content: 'Note: This tutorial is intended to newbies only who want to kick-start web development with Ruby on Rails. I will just share links to different resources and give tips based on my experience which may help you starting development with Ruby on Rails.', link: 'https://dev.to/alihaider907/newbies-introduction-to-ruby-on-rails-4be', user_id: 3, community_id: 3}
])
