class DeploymentsController < ApplicationController

	layout 'admin'
	
	def index
		list
		render('public_list')
	end
	
	
	def list
		@deployments = Deployment.order("deployments.id ASC")
	end
	
	def show
		@deployment = Deployment.find(params[:id])
	end
	
	def new
		@deployment = Deployment.new
	end
	
	def create
		@deployment = Deployment.new(params[:deployment])
		if @deployment.save
			flash[:notice] = "Environment created successfully."
			redirect_to(:action => 'list')
		else
			render('new')
		end
	end
	
	def edit
		@deployment = Deployment.find(params[:id])
	end
	
	def update
		@deployment = Deployment.find(params[:id])
		if @deployment.update_attributes(params[:deployment])
			flash[:notice] = "Environment updated successfully."
			redirect_to(:action => 'list', :id => @deployment.id)
		else
			render('edit')
		end
	end
	
	def delete
		@deployment = Deployment.find(params[:id])
	end
	
	def destroy
		Deployment.find(params[:id]).destroy
		flash[:notice] = "Environment deleted successfully."
		redirect_to(:action => 'list')
	end
	
	def deployment_link
		@deployment = Deployment.find(params[:id])
		@deployment.url = deployment_url
	end
	
	# authorization def's below
	before_filter :confirmed_logged_in, :except => [:login, :logout, :attempt_login, :index, :show, :create, :edit]
	
	def login
	  # login form
	end
	
	def attempt_login
	  authorized_user = AdminUser.authenticate(params[:username], params[:password])
	  if authorized_user
	    session[:user_id] = authorized_user.id
	    session[:username] = authorized_user.username
	    flash[:notice] = "You are now logged in."
	    redirect_to(:action => 'list')
	  else
	    flash[:notice] = "Invalid username/password combination."
	    redirect_to(:action => 'login')
	  end
	  
	end
	
	def logout
	  session[:user_id] = nil
	  session[:username] = nil
	  flash[:notice] = "You have been logged out."
	  redirect_to(:action => "index")
	end
	
	
	
end
