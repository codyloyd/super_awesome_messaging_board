class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: 'comment was successfully created.'
    else
      redirect_to post_path(@post), notice: 'Something went wrong'
    end
  end

  private
  
    def comment_params
      params.fetch(:comment, {}).permit(:user_id, :body)
    end
end
