class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :commnt, presence: true
end
