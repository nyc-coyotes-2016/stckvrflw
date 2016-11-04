post '/questions/:question_id/comments/:comment_id/votes' do
  comment = Comment.find(params[:comment_id])

  vote = Vote.find_or_initialize_by(user:current_user, voteable: comment)
  vote.vote_direction = params["vote_direction"]

  if request.xhr?
    if vote.save
      status 200
      content_type :json
      { points: comment.votes.pluck(:vote_direction).sum }.to_json
    else
      status 410
    end
  end
end
