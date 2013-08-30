class PagesController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_filter :load_page, only: [:show, :edit, :update, :destroy]

	def new
		@page = Page.new
	end

	def show

	end

	def create
		@page = current_user.account.pages.create(params[:page])
		if @page.valid? then
			redirect_to page_path(@page)
		else
			render :new
		end
	end

	def edit
		authorize! :update, @page
	end

	def update
		authorize! :update, @page
		@page.update_attributes(params[:page])
		if @page.valid? then
			redirect_to page_path(@page)
		else
			render :edit
		end
	end

	def destroy
		authorize! :destroy, @page
		@page.destroy
		redirect_to account_path(current_user.account)
	end

	protected

	def load_page
		@page = Page.find_by_url(params[:id])
		if not @page then
			not_found!
		end
	end

end