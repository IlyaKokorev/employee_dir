module ApplicationHelper
  def bootstrap_class_for(name)
    { success: "alert-success",
      error:   "alert-danger",
      danger:  "alert-danger",
      alert:   "alert-warning",
      notice:  "alert-info"
    }[name.to_sym] || name
  end

  def bootstrap_flash(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do
        concat content_tag(:button, '×', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end
end
