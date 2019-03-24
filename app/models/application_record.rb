class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Transform and return current date for internal sorting, e.g. "3302019"
  def self.current_date_for_sort
    current_date = Time.now.to_s.split("-")
    current_month = current_date[1].to_i
    current_day = current_date[2].to_i
    current_year = current_date[0].to_i
    "#{current_month} #{current_day} #{current_year}".split.join.to_i
  end

  # Display month, e.g. return "January"
  def display_month(date_string)
    month_number = date_string[0].to_i
    case month_number
    when 1
      "January"
    when 2
      "February"
    when 3
      "March"
    when 4
      "April"
    when 5
      "May"
    when 6
      "June"
    when 7
      "July"
    when 8
      "August"
    when 9
      "September"
    when 10
      "October"
    when 11
      "November"
    when 12
      "December"
    end
  end


end
