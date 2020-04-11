class AddTimeStampsToTodos < ActiveRecord::Migration[6.0]
  def change
    add_timestamps(:todos)
  end
end
