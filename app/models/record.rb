class Record < ApplicationRecord
  belongs_to :user

  validates :place, presence: true, length: {maximum: 30}
  validates :lure, presence: true, length: {maximum: 30}
end
