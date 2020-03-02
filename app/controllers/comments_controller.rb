class CommentsController < ApplicationController

  def kurt
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to @post
    else
      @comments =  @post.comments
      render 'posts/show'

      # redirect_to @post, notice: @comment.errors.full_messages
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:body)
  end
end
