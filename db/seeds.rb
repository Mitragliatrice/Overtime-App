
1.times do |adminuser| 
    AdminUser.create!(email: "mathews.colton@gmail.com", password: "Colton11!", password_confirmation: "Colton11!", first_name: "Jon", last_name: "Snow")
end

puts "Created 1 test admin user"

1.times do |user|
    User.create!(email: "tester@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Test", last_name: "User")
end

puts "Created 1 test user"

100.times do |post| 
    Post.create!(date: Date.today, rationale: "Test rationale number #{post}", user: User.last, overtime_request: 2.5)
end

puts "Created 100 test posts"


