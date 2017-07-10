class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  scope :name_sort, ->{order full_name: asc}
  validates :full_name, presence: true,
    length: {maximum: Settings.user.full_name.max_length}

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  def feed
    Post.feed_load following_ids, id
  end
end
