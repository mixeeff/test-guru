module SessionsHelper
  def flash_message(key)
    content_tag :p, flash[key], class: 'flash alert' if flash[key]
  end
end
