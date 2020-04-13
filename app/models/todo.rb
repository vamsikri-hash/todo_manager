class Todo < ActiveRecord::Base
  belongs_to :user

  scope :overdue, -> { where("due_date < ? and completed= ?", Date.today, false) }
  scope :duetoday, -> { where("due_date = ?", Date.today) }
  scope :duelater, -> { where("due_date > ?", Date.today) }
  scope :completed, -> { where(completed: true) }

  validates :todo_text, presence: true, length: { minimum: 2 }
  validates :due_date, presence: true
end
