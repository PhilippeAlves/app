module ApplicationHelper
  def format_date_br(date)
    if date.nil?
      "data não definida"
    else
      "#{date.day}/#{date.month}/#{date.year}"
    end
  end

  def format_time(date)
    if date.nil?
      "hora não definida"
    else
      date.strftime("%H:%M")
    end
  end

  def authenticated?
    session[:admin]
  end
end
