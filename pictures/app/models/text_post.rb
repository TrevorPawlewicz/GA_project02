class TextPost < Post
    # this model inherits from the Post model
    belongs_to :user
    # don't allow a text post to be saved without a body:
    validates :body, presence: true
end
