class PagesController < ApplicationController
  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def admin
      @title = "Admin" 
  end
  
  def organization
    @title = "Organizations"
  end
  
  def creators
    @title = "creators"
  end  
end
