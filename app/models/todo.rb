class Todo < ActiveRecord::Base
  scope :overdue, -> { where("due_date < ? and completed= ?", Date.today, false) }
  scope :duetoday, -> { where("due_date = ?", Date.today) }
  scope :duelater, -> { where("due_date > ?", Date.today) }
  scope :completed, -> { where(completed: true) }

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[]"
    "#{id}.#{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  end
end
