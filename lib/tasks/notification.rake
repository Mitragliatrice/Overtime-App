
namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please log into the Overtime Managment Dashoboard to request overtime or confirm your hours for last week: https://corp-overtime.herokuapp.com/users/sign_in"
     
      employees.all.each do |employee|
        AuditLog.create!(user_id: employee.id)  
        SmsTool.send_sms(number: employee.phone ,message: notification_message )
      end
    end
  end

    desc "Sends Mail notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
      if submitted_posts.count > 0
        admin_users.each do |admin|
          ManagerMailer.email(admin).deliver_later
        end
      end
    end
end
