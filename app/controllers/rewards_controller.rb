# frozen_string_literal: true

class RewardsController < ApplicationController
  def index
    rewards = Reward.all
    if params[:category_id].present?
      rewards = rewards.joins(:category_rewards).where(category_rewards: { category_id: params[:category_id] })
    end
    rewards = rewards.paginate(page: params[:page], per_page: 10)
    render :index, locals: { rewards: rewards }
  end

  def show
    render :show, locals: { reward: reward }
  end

  private

  def reward
    @reward ||= Reward.find(params[:id])
  end

  def reward_params
    params.require(:reward).permit(:title, :description, :price)
  end
end
