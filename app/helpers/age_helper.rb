module AgeHelper
  def get_range_age(age)
    case age
    when 0..1
      "baby"
    when 2..6
      "toddler"
    when 7..18
      "adolescents"
    when 19..40
      "adult"
    when 41..100
      "old"
    else
      "Error: age has an invalid value (#{age})"
    end
  end
end