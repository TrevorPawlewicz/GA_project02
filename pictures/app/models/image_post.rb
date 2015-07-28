class ImagePost < Post
    # this model inherits from the Post model

    # don't allow image to be saved without an image url:
    validates :url, presence: true
end
