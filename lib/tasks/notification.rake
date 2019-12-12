namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime"
  task sms: :environment do
    # if Time.now.sunday?
      employees = Employee.all
      message = "Please log into  the overtime management dashboard to request overtime or confirm your hours for last week: https://ag-overtime.herokuapp.com/"

      employees.each do |employee|
        AuditLog.create!(user_id: employee.id)
        # SmsTool.send_sms(num: employee.phone, msg: message)
        SmsTool.send_sms(num: '606211316', msg: message)
      end
    # end
  end

  desc "Sends email notification to managers (admin users) each day to inform of pending overtime requests"
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
