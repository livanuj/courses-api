class Course < ApplicationRecord
  belongs_to :coach
  has_many :activities, dependent: :destroy

  validates :coach, presence: true
  validates :name, presence: true
end
