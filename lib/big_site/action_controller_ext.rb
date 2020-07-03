ActionController::Base.class_eval do
  helper_method :current_site

  def current_site
puts "************** " + request.host
    @current_site ||= (BigSite::Site.find_by_host_name(request.host) || BigSite::Site.first || nil)
  end
end
