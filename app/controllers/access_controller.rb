class AccessController < ApplicationController
  
  layout 'admin'
  
  def index
    menu
    render('menu')
  end
  
  def menu
    # display text & links
  end

  def login
    # login form
  end
  
  def attempt_login
    authorized_user = AdminUser.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
       redirect_to(:controller => 'deployments', :action => 'list')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
    
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end

end
