class MyDropboxController < ApplicationController

	before_filter :authenticate_db_user!, except: [:homepage]

  def my_pages
  end

  def edit_page
  end

  def homepage
  	if db_user_signed_in?
  		redirect_to action: :edit_page and return
  	end
  	redirect_to "/homepage.html" and return
  end
end
