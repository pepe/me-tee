# Helper methods defined here can be accessed in any controller or view in the application

PadMeTee.helpers do
  # returns right host name
  def host_name
    request.env['HTTP_X_FORWARDED_HOST'] || request.host
  end

end
