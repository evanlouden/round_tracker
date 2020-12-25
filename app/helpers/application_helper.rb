module ApplicationHelper
  def course_name(course)
    return course.name if course.name.length < 20

    space_index = nil
    course.name.chars.each_with_index do |char, index|
      space_index = index if char.blank? && index > 10
    end
    "#{course.name[0..space_index - 1]}<br />#{course.name[space_index + 1..-1]}".html_safe
  end

  def embedded_svg(filename, options={})
    file = File.read(Rails.root.join("app", "assets", "images", filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css("svg")
    if options[:class].present?
      svg["class"] = options[:class]
    end

    if svg.children.present?
      svg.children.each do |child|
        child["stroke"] = options[:stroke] if options[:stroke]
        child["fill"] = options[:fill] if options[:fill]
      end
    end
    doc.to_html.html_safe
  end
end
