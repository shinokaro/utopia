class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def need_review
    if current_user
      @review_mtg = current_user.promotions.where(participant_rate: nil)
      @review_mtg = current_user.participations.where(promoter_rate: nil) unless @review_mtg.present?
      if @review_mtg.present?
        redirect_to review_users_path, notice: "レビューを必ずおこなってください"
      end
    end
  end
end
