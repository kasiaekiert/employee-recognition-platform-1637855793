# frozen_string_literal: true

module Admins
  class RewardsController < Admins::BaseController
    def index
      render :index, locals: { rewards: Reward.includes(:categories).all }
    end

    def show
      render :show, locals: { reward: reward }
    end

    def new
      render :new, locals: { reward: Reward.new }
    end

    def edit
      render :edit, locals: { reward: reward }
    end

    def create
      new_reward = Reward.new(reward_params)
      if new_reward.save
        redirect_to admins_rewards_path, notice: 'New Reward was successfully created.'
      else
        render :new, locals: { reward: new_reward }
      end
    end

    def update
      if reward.update(reward_params)
        redirect_to admins_reward_path(reward), notice: 'Reward was successfully updated.'
      else
        render :edit, locals: { reward: reward  }
      end
    end

    def destroy
      reward.destroy
      redirect_to admins_rewards_path, notice: 'Reward was successfully destroyed.'
    end

    private

    def reward
      @reward ||= Reward.find(params[:id])
    end

    def reward_params
      params.require(:reward).permit(:title, :description, :price, category_ids: [])
    end
  end
end
