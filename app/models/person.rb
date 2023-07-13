class Person < ApplicationRecord
  after_commit :after_commit_validation
  before_validation :before_validation_callback

  scope :updated_in_last_7_days, -> { where('updated_at BETWEEN ? AND ?', 7.days.ago.beginning_of_day, Time.current) }
  enum status: [:active, :archived]
end
