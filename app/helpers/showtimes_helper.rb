module ShowtimesHelper
  def card_element(showtime)
    content_tag(:p, showtime.display_name, class: card_element_class(showtime))
  end

  def card_element_class(showtime)
    showtime.sold_out? ? 'error-block' : ''
  end
end
