module ApplicationHelper
  def bootstrap_alert_class(name)
    debug name
    case name
    when :notice
      "alert-success"
    when :alert
      "alert-error"
    else
      "alert-info"
    end
  end
end
