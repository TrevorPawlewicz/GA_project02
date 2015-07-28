class Post < ActiveRecord::Base
  belongs_to :user

  # validation to ensure that a Post cannot be created without an associated user_id.
  validates :user_id, presence: true
  validates :type, presence: true
end
