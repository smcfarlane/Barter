module BoardsHelper
  def format_skills_offered skills_offered
    s = ''
    case skills_offered.count
      when 0
        s = 'nothing'
      when 1
        s = skills_offered[0]
      when 2
        s = "#{skills_offered[0]} or #{skills_offered[1]}"
      else
        skills_offered.each_with_index do |v, i|
          if i == skills_offered.count - 1
            s += "or #{v}"
          else
            s += "#{v}, "
          end
        end
    end
    s
  end
end
