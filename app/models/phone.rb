class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true
end
