class Address < ApplicationRecord
  belongs_to :contact

  validates :street, presence: true
end
