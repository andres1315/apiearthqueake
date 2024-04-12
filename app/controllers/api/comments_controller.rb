class Api::CommentsController < ApplicationController
  before_action :find_feature

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def find_feature
    feature_id = params[:feature_id].to_i
    unless feature_id.positive?
      render json: { error: 'el id debe ser un numero entero mayor a 0' }, status: :unprocessable_entity
      return
    end
    @feature = Eventearthquake.find(feature_id)

  end

  def create
    comment = @feature.comments.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: { error: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index 
    comments = Comment.where(eventearthquake: params[:feature_id])
    render json: comments
  end

  def comment_params
    params.require(:comment).permit(:body)

  end
end



