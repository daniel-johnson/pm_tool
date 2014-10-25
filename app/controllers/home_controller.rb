class HomeController < ApplicationController

  def about
  end

  def home
    render "home/home"#, layout: false
  end
  
end
