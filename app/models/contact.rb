class Contact < ApplicationRecord
  paginates_per 5

  validates :kind, presence: true
  validates :address, presence: true

  belongs_to :kind
  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true
end
