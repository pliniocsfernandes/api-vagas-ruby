class ScoreCalculatorService
  def initialize(job_application)
    @job_application = job_application
  end

  def calculate_n
    100 - 25 * (@job_application.job_opportunity.level - @job_application.person.level).abs
  end

  def calculate_score
    (calculate_n + calculate_d)/2
  end

  def calculate_d
    case get_smaller_distance
    when 0..5
      100
    when 6..10
      75
    when 11..15
      50
    when 16..20
      25
    else
      0
    end
  end

  def get_smaller_distance
    @job_application.calculate_distance
  end
end