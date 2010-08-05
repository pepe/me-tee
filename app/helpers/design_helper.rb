# Helper methods defined here can be accessed in any controller or view in the application

PadMeTee.helpers do
  # prints size option with selected if in session
  def option_for(size)
    res = '<option'
    res += session['size'] == size ? ' selected="selected">' : '>'
    res += (size + '</option>')
  end
  
  # returns chosen icon image
  def chosen_icon_image(type, size = '')
    if icon_id = (session[type] || @order.try(type))
      icon = Icon.find(icon_id)
      '<img src="/icons/%s" alt="%s" width="%s" height="%s" />' % [icon.filename, icon.full_name, size, size]
    else
      "<span></span>"
    end
  end

  # renders img tag for icon thumb for carousel
  def icon_image_thumb(icon)
    "<a href='/icons/%s' title='%s'><img src='%s' width='72' height='72' class='hidden' /></a>" % [icon.id, icon.full_name, icon.path]
  end
end
