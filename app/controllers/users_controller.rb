class UsersController < ApplicationController
  before_action :authenticate_user!, only: %W(show edit destroy be_free)
  before_action :get_free_mtgs, only: %w(mypage)
  #before_action :need_review, only: %w(review done_review)

  def mypage
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def destroy

  end

  def be_free
    @mtg = current_user.promotions.build
    if @mtg.save
      redirect_to root_url, notice: 'ok'
    else
      redirect_to root_url
    end
  end

  def cancel
    @mtg = current_user.promotions.last
    @mtg.destroy
    redirect_to root_url
  end

  def agree
    @mtg = Meeting.find(params[:user][:mtg_id])
    @mtg.update(participant_id: params[:user][:user_id])
    redirect_to review_users_path, notice: '会う約束をしました。レビューをしましょう。'
  end

  def review
    @review_mtg = current_user.promotions.where(participant_rate: nil)
    @review_mtg = current_user.participations.where(promoter_rate: nil) unless @review_mtg.present?
    @review_mtg = @review_mtg.last
  end

  def done_review
    @review_mtg = Meeting.find(params[:meeting][:id])
    @review_mtg.update_attributes!(review_params)
    redirect_to root_url, notice: 'レビューが完了しました'

  end

  private

  def get_free_mtgs
    if current_user
      @free_mtgs = Meeting.where(participant_id: nil).where.not(promoter_id: current_user.id)
    end
  end

  def review_params
    params.require(:meeting).permit(:promoter_rate, :participant_rate)
  end
end
