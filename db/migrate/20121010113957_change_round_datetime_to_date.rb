class ChangeRoundDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :rounds, :closing_time, :date
  end
end
