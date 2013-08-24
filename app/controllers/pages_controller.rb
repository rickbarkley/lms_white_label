class PagesController < ApplicationController
  def contact
  end

  def about
  end

  def admin
      @title = "Admin" 
  end
end
