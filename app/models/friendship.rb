class Friendship < ApplicationRecord
  belongs_to :receiver, class_name: :User
  belongs_to :creator, class_name: :User
  validates :creator, presence: true
  validates :receiver, presence: true
end
