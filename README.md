# Overtime App

### Key requirement: company needs documentation that salaried employees did or did not get overtime each week

### Models

- |X| Post -> date:date rationale:text
- |X| User -> Devise
- |X| rails gAdminUser -> STI

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- |X| Administrate admin dashboard
- |X| Block non admin and guest users
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime
### UI:

- |X| Bootstrap -> formatting
- Icons from Font Awesome
- |X| Update the styles for forms

## TODOS:
### Audit Log
##### Keep track of if an employee had overtime or not
- Dependancies
  - User
- Attrs:
  - status:integer (enum) -> [pending, complete]
  - start_date:date -> default to previous Monday 
  - date_verified:date -> default to nill

Monday

|

|

|

Sunday ------- Notification

```
rails g resource AuditLog user:references status:integer start_date:date end_date:date
```
Modify the migration file to add default. 
```ruby
class CreateAuditLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :audit_logs do |t|
      t.references :user, foreign_key: true
      t.integer :status, default: 0
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
```
then migrate
```
rails db:migrate
```