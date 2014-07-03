module ApplicationHelper

  def full_title(page_title)
    base_title = "Hockey Akademy"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def full_name(first, last)
    "#{first.titleize} #{last.titleize}"
  end

  def format(time)
    time.strftime('%A, %d %b %Y')
  end
end
