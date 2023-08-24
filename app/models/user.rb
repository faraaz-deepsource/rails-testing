class User < ApplicationRecord
  attribute :confirmed_at, :datetime, default: Time.zone.now
end
