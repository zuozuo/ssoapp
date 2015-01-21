module ApplicationHelper
  def active_class(name)
    'active' if params[:controller]==name
  end

  def user_avatar(user, options={})
    image_tag user.avatar.url(:thumb), class: "img-#{options[:type]||'circle'}", size: options[:size]||'90x90'
  end

  def user_link(user, options={})
    link_to user_avatar(user, options)
  end
end
