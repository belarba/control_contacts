class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.references :contact
      t.string :audit_message

      t.timestamps null: false
    end
  end
end
