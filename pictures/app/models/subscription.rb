class Subscription < ActiveRecord::Base
    # both :leader and :follower refer to a User.
    # MUST specify a class name so they don't automatically look for models
    # named Leader and Follower
    belongs_to :leader, class_name: 'User'
    belongs_to :follower, class_name: 'User'
end
