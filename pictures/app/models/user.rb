class User < ActiveRecord::Base
    #                               key      value
    has_many :subscriptions, foreign_key: :follower_id,
                            dependent: :destroy # destroy any associated subscriptions
                                                # if this user is ever destroyed.
    has_many :leaders, :through => :subscriptions

    has_many :reverse_subscriptions, foreign_key: :leader_id,
                                    class_name: 'Subscription', # specify class name because no model matches
                                    dependent: :destroy

    has_many :followers, through: :reverse_subscriptions

    #                    key      value
    has_many :posts, dependent: :destroy
    has_many :text_posts, dependent: :destroy
    has_many :image_posts, dependent: :destroy

    # trev
    has_many :comments

    # password_digest:
    has_secure_password
    validates :email, presence: true, uniqueness: true

    #---------------------------------------------------------------------------
    # check to see if the current user is following another user
    def following?(leader)
        leaders.include? leader
    end

    def follow!(leader)
        # check to see that user is NOT following self AND another user
        if leader != self && !following?(leader)
            leaders << leader    #insert this leader into the collection
        end
    end

    def timeline_user_ids
        # foreign key plus an id:
        leader_ids + [id]
    end

end
