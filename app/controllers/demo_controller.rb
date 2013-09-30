class DemoController < ApplicationController
 
  def index
  	render('index')
  end
  
  def hello
  	render('hello')
  end
  
  def other_hello
  	render(:text => 'Hello Everyone!')
  end
end
