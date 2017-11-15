# frozen_string_literal: true

# These methods will be used in comment views
module CommentsHelper
  def nested_messages(messages)
    return if messages.blank?
    messages.map do |message, sub_messages|
      render(partial: 'comments/comment', locals: { message: message }) +
        content_tag(:div, nested_messages(sub_messages),
                    class: 'nested_messages')
    end.join.html_safe
  end
end
