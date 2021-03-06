@employee = Employee.create(email: 'test@test.com',
                    password: 'asdfasdf',
                    password_confirmation: 'asdfasdf',
                    first_name: 'Jon',
                    last_name: 'Snow',
                    phone: '432432432',
                    ssn: 1234,
                    company: 'ABC company')

puts '1 Employee created'

AdminUser.create(email: 'admin@test.com',
                 password: 'asdfasdf',
                 password_confirmation: 'asdfasdf',
                 first_name: 'Jonathan',
                 last_name: 'Winter',
                 phone: '432432432',
                 ssn: 1234,
                 company: 'ABC company')

puts '1 AdminUser created'

100.times do |post|
  Post.create(date: Date.today,
              rationale: "#{post} rationale content: But I must explain to you how all this mistaken idea of denouncing
                          pleasure and praising pain was born and I will give you a complete account of the system,
                          and expound the actual teachings of the great explorer of the truth, the master-builder of
                          human happiness.",
              user_id: @employee.id,
              daily_hours: 2.5)
end

puts "100 Posts have  been created"

AuditLog.create(user_id: @employee.id, status: 0, start_date: (Date.today - 6))
AuditLog.create(user_id: @employee.id, status: 0, start_date: (Date.today - 13))
AuditLog.create(user_id: @employee.id, status: 0, start_date: (Date.today - 20))

puts "3 AuditLogs have been created"
