
1.times do |user|
    User.create!(email: "text@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Test", last_name: "User")
end

puts "Created 1 test user"

1.times do |adminuser| 
    AdminUser.create!(email: "admintext@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Test", last_name: "User")
end

puts "Created 1 test admin user"

5.times do |post| 
    Post.create!(date: Date.today, rationale: 'Test rationale number #{post}', user: User.last)
end

puts "Created 5 test posts"


