class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  has_many :friendships, dependent: :destroy, foreign_key: :creator_id
  has_many :inverse_friendships, dependent: :destroy, class_name: :Friendships, foreign_key: :receiver_id
  has_many :friend_requests, through: :inverse_friendships

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :pending_friendships, -> { where status: false }, class_name: :Friendships, foreign_key: :creator_id
  has_many :pending_friends, through: :pending_friendships, source: :friend

  has_many :confirmed_friendships, -> { where status: true }, class_name: :Friendships
  has_many :friends, through: :confirmed_friendships

  def friends_and_own_posts
    Post.where(user: (friends.to_a << self))
  end

  


  def self.my_friends(current_user)
    requested_friends = current_user.friendships.map(&:receiver)
    accepted_friends = current_user.friendships.map(&:creator)
    requested_friends.compact + accepted_friends.compact
  end

  def self.friend?(_user)
    requested_friends = current_user.friendships.map { |friendship| friendship.receiver if friendship.status == false }
    accepted_friends = current_user.friendships.map { |friendship| friendship.creator if friendship.status == true }
    requested_friends.compact + accepted_friends.compact
  end

  def self.row_creator(user)
    f1 = Friendship.find_by(creator_id: user.creator_id, receiver_id: user.receiver_id)
    f2 = Friendship.find_by(creator_id: user.receiver_id, receiver_id: user.creator_id)
    f1.id < f2.id
  end
end
