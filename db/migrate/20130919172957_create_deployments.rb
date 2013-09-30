class CreateDeployments < ActiveRecord::Migration
  def up
    create_table :deployments do |t|
		t.string "environment"
		t.string "version"
		t.string "url"
		t.boolean "mci"
		t.boolean "security"
		t.boolean "fdsh"
		t.string "app_logs"
		t.string "system_logs"
		t.string "db_details"
      t.timestamps
    end
    add_index("deployments", "mci")
    add_index("deployments", "security")
  end
  
  def down
  	drop_table :deployments
  end
end
