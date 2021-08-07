class Coach < ApplicationRecord
  has_many :courses

  validates :name, presence: true

  after_destroy :transfer_coach

  private

  def transfer_coach
    return unless courses.present?

    courses.each do |course|
      course.update(coach: Coach.last)
    end
  end
end
