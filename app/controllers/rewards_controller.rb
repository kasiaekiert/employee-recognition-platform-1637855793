# frozen_string_literal: true

class RewardsController < ApplicationController
  def index
    render :index, locals: { rewards: Reward.all.paginate(page: params[:page], per_page: 10) }
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
