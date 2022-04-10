# frozen_string_literal: true

module Admins
  class CategoriesController < Admins::BaseController
    def index
      render :index, locals: { categories: Category.all }
    end

    def show
      render :show, locals: { category: category }
    end

    def new
      render :new, locals: { category: Category.new }
    end

    def edit
      render :edit, locals: { category: category }
    end

    def create
      new_category = Category.new(category_params)

      if new_category.save
        redirect_to admins_categories_path, info: 'New Category was successfully created.'
      else
        render :new, locals: { category: new_category }
      end
    end

    def update
      if category.update(category_params)
        redirect_to admins_category_path(category), info: 'Category was successfully updated.'
      else
        render :edit, locals: { category: category }
      end
    end

    def destroy
      category.destroy
      redirect_to admins_categories_path, danger: 'Category was successfully destroyed.'
    end

    private

    def category
      @category ||= Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
  end
end
