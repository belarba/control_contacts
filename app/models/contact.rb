class Contact < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  validates_uniqueness_of :email

  has_many :audits, dependent: :destroy
end
