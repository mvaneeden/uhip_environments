class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
		t.string "name"
		t.integer "position"
		t.integer "visible", :default => false
     	t.timestamps
    end
  end
  
 	 def down
  		drop_table :subjects
	end
end
