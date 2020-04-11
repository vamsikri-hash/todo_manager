class Todo < ActiveRecord::Base
  belongs_to :user

  scope :overdue, -> { where("due_date < ? and completed= ?", Date.today, false) }
  scope :duetoday, -> { where("due_date = ?", Date.today) }
  scope :duelater, -> { where("due_date > ?", Date.today) }
  scope :completed, -> { where(completed: true) }
end
