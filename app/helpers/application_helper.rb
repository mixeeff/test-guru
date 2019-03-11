module ApplicationHelper
  ALERT_CLASSES = { notice: 'info', error: 'danger', success: 'success', alert: 'danger'}

  def this_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(key, message)
    content_tag :div, message.html_safe, class: "alert alert-#{ALERT_CLASSES[key.to_sym]}"
  end
end
