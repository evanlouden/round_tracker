module ApplicationHelper
  def course_name(course)
    return course.name if course.name.length < 20

    space_index = nil
    course.name.chars.each_with_index do |char, index|
      space_index = index if char.blank? && index > 10
    end
    "#{course.name[0..space_index - 1]}<br />#{course.name[space_index + 1..-1]}".html_safe
  end
end
