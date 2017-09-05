module ApplicationHelper
  ALERT_TYPES = [:info, :success, :warning, :danger]
  # for notif alert / flash message
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = type.to_sym
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = :success if type == :notice
      type = :danger  if [:alert, :error].include?(type)
      next unless ALERT_TYPES.include?(type)

      Array(message).flatten.each do |msg|
        flag = 'check'  if type == :success
        flag = 'ban'    if type == :danger
        flag = 'info'   if type == :info
        flag = 'warnin' if type == :warning


        text = content_tag(:div,
            content_tag(:i, '', class: "fa fa-#{ flag }") +
            content_tag(:a, raw('&times;'), class: 'close', 'data-dismiss' => 'alert') +
            msg,
          class: "alert alert-#{type} alert-dismissable text-center")

        flash_messages << text if message
      end
    end

    content_tag(:div, flash_messages.join("\n").html_safe, id: 'find-alert').html_safe
  end

  def user_access_token
    current_user.auth_tokens.find_by_device(request.headers['Device-Id']).token
  end

end
