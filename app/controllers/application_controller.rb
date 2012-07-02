class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  before_filter :lookup_required_resources, :authenticate, :assign_current_user

  # Method to check that all the resources required by the marketplace
  # application are available. Required resources include a marketeer 
  # (administrative) User item.
  #
  # If a resource is available, a session flag is set so the app will
  # not check again (for this user, ideally a global flag would be set).
  # If any required resource is unavailable, the user is directed to the
  # apps landing/welcome page which will display links to create the
  # missing resource(s).
  def lookup_required_resources
    
    # Marketplace admin user - required to administer users, and store
    # application-level properties
    unless session['marketplace_admin_user_name']
      marketeer_user = User.where(role: 'marketeer').first
      session['marketplace_admin_user_name'] = marketeer_user ? marketeer_user.name : nil
    end
    
    # Determine whether any required resources are missing.
    session['required_resources_present'] = !session['marketplace_admin_user_name'].nil?
          
    unless session['required_resources_present']
       
      # An action is being invoked before all the required resources have
      # been initialized. Redirect the user back to the landing page, unless
      # the user has initiated an "/init_XYZ" request to create a resource.
 #     redirect_to root_url
    end
  end
    

  # Implements a primitive authentication mechanism. Any controller that
  # respond_to :required_user_role will refuse to act on a user's request unless 
  # the user is logged in and belongs to the role name returned by the
  # :required_user_role method. Unauthenticated users will be sent to the
  # login page.
  #
  # For example, a controller can specify that users must be in the 
  # 'marketeer' role by defining the method:
  # => def required_user_role
  # =>  'marketeer'
  # => end
  def authenticate
    if respond_to? :required_user_role and not user_in_role(required_user_role)
      session['user_attributes'] = nil
      session[:redirect_to] = request.env['PATH_INFO']
      flash[:notice] = "Login as a #{required_user_role}"
      redirect_to(login_url)
    end
  end  

  
  # Returns true if the web site user has logged in and is a member of
  # the specified role, false otherwise.
  def user_in_role(role)
    attrs = session['user_attributes']
    attrs && attrs['role'].split(',').include?(role)
  end

  def assign_current_user
    @current_user = User.find(session['user_attributes']['id']) if session['user_attributes']
  end
end
