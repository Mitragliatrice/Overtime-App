
1.times do |adminuser| 
    AdminUser.create!(email: "mathews.colton@gmail.com", 
                      password: "Colton11!", 
                      password_confirmation: "Colton11!", 
                      first_name: "Test", 
                      last_name: "User", 
                      phone: "3853233071")
end

puts "Created 1 test admin user"

1.times do |user|
    User.create!(email: "tester@test.com", 
                password: "asdfasdf", 
                password_confirmation: "asdfasdf", 
                first_name: "Jon", 
                last_name: "Snow",
                phone: "3853233071")
end

puts "Created 1 test user"

  AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 6.days))
  AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 13.days))
  AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 20.days))
  
puts "Created 3 audit logs"

15.times do |post| 
    Post.create!(date: Date.today, rationale: "Amet quis labore incididunt labore. #{post} ", user: User.last, overtime_request: 2.5)
end

puts "Created 15 test posts"



