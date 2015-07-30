class Comment < ActiveRecord::Base
    belongs_to :post, touch: true
    belongs_to :user

    # do not allow a comment without vaild user & post id:
    validates :user_id, presence: true
    validates :post_id, presence: true
end
