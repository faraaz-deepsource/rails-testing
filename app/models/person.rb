class Person < ApplicationRecord
  before_validation :before_validation_callback
  after_commit :after_commit_validation

  enum status: [:active, :archived]
end
