# frozen_string_literal: true

module ApplicationHelper
  def paginate(rewards)
    content_tag :div, class: 'pagination' do
      render_page_numbers(rewards.total_pages, rewards.current_page)
    end
  end

  def render_page_numbers(total_pages, current_page)
    calculator = PaginationPagesCalculator.new(total_pages, current_page)
    calculator.numbers.each do |number|
      if number
        concat render_pagination_link(number, number, number == current_page)
      else
        concat content_tag(:span, '...', class: 'gap')
      end
    end
  end

  def render_pagination_link(label, page, disabled)
    content_tag :span, class: ('disabled' if disabled) do
      link_to_unless disabled, label, rewards_path(page: page)
    end
  end
end
