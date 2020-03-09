class AddVisibleStateOfContests < ActiveRecord::Migration
  def change
	add_column :contests, :visible_state, :integer , :default => 0
  end
end
