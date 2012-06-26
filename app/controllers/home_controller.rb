class HomeController < ApplicationController
  # The application's home page displays all the products that are
  # available for sale, namely those products which have the attribute
  # :sell set to true.
  def index
    @products = Product.where(:sell => true).all
  end

  # Creates a new User in the database based on information
  # from the signup form (eg views/home/signup.html.erb)
  def signup
    if params['username'] and params['password'] and params['role']
      # This action has been invoked by the signup form.
      @user = User.create(:role => params['role'],
                          :name => params['username'],
                          :password => params['password'])

      unless session['user_attributes']
        session['user_attributes'] = @user.attributes
        session['user_attributes']['id'] = @user.id

        flash[:notice] = "Welcome #{@user.name}, you have signed up as a #{@user.role}"
        redirect_to(root_url)
      end
    else
    # This action was not invoked by the signup form, redirect
    # to the form.

      if params['role'] == 'marketeer'
        # We do not allow users to create marketeer (admin) users by
        # crafting their own URLs.
        flash[:error] = 'Marketeer users may only be created through the Users management page'
        redirect_to(root_url)
      end
    end
  end


  # Allows a registered user to log in to the marketplace application
  # using the login form (views/home/login.html.erb)
  def login
    if params['username'] and params['password']
      user = User.where(name:params['username'], password: params['password']).first 
      if user
        session['user_attributes'] = user.attributes
        session['user_attributes']['id'] = user.id
      else
        flash[:error] = "Login failed"
      end
    end    
  
    if session['user_attributes']
      unless params['redirect_to'].nil?
        redirect_to("#{params['redirect_to']}")
      else
        redirect_to(root_url)
      end
    else
      flash[:redirect_to] = params['redirect_to'] unless flash[:redirect_to]
    end
  end
  
  
  # Logs a user out of the marketplace and resets the user's session.
  def logout
    reset_session
    redirect_to(root_url)
  end  



end