class AddKeys < ActiveRecord::Migration
  def change
      add_foreign_key "vehicles", "users", name: "vehicles_user_id_fk"
  end
end
