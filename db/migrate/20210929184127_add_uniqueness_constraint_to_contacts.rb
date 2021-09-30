class AddUniquenessConstraintToContacts < ActiveRecord::Migration
  def change
    add_index :contacts, [:email], unique: true, name: 'uniq_email_per_contact'
  end
end
