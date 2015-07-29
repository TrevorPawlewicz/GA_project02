class TextPostsController < ApplicationController

    def new
        @text_post = TextPost.new
    end

    #159
    def create
        @text_post = current_user.text_posts.build(text_post_params)

        if @text_post.save
            redirect_to post_path(@text_post), notice: "Post created!"
        else
            render :new, alert: "Error creating post."
        end
    end

    #164
    def update
        @text_post = current_user.text_posts.find(params[:id])

        if @text_post.update(text_post_params)
            redirect_to post_path(@text_post), notice: "Post updated."
        else
            render :edit, alert: "Error updating post!"
        end
    end


    #------------------------------------------------------------------------
    private
    def text_post_params
        # make sure params has :text_post key and permits key-value pairs for
        # :title and :body
        params.require(:text_post).permit(:title, :body)
    end
end
