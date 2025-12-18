module ApplicationHelper
  def star_rating(rating)
    return "" if rating.nil?

    full_stars = rating.floor
    partial_star = rating - full_stars
    empty_stars = 5 - full_stars - (partial_star.positive? ? 1 : 0)
    stars = ""

    full_stars.times { stars += content_tag(:i, "", class: "fas fa-star") }

    if partial_star.positive?
      stars +=
        content_tag(:span, class: "star-wrapper") do
          content_tag(:span, class: "star-empty") do
            content_tag(:i, "", class: "far fa-star")
          end +
            content_tag(
              :span,
              class: "star-filled",
              style: "width: #{partial_star * 100}%;"
            ) { content_tag(:i, "", class: "fas fa-star") }
        end
    end
    empty_stars.times { stars += content_tag(:i, "", class: "far fa-star") }
    stars.html_safe
  end
end
