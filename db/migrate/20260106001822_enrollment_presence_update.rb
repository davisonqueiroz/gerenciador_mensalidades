class EnrollmentPresenceUpdate < ActiveRecord::Migration[8.0]
  def change
      change_column_null :enrollments, :total_value,false
      change_column_null :enrollments, :invoice_quantity,false
      change_column_null :enrollments, :due_day,false
      change_column_null :enrollments, :course_name,false
  end
end
