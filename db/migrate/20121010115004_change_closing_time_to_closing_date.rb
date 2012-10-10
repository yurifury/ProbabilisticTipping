class ChangeClosingTimeToClosingDate < ActiveRecord::Migration
  def change
    rename_column :rounds, :closing_time, :closing_date
  end
end
