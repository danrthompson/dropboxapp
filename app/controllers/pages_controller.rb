class PagesController < ApplicationController
	before_filter :load_page, only: [:show, :edit, :update, :destroy]

	def new

		@page = Page.new
	end

	def show

	end

	def create

	end

	def edit

	end

	def update

	end

	def destroy

	end

	protected

	def load_page
		@page = Page.find_by_url(params[:id])
		if not @page then
			not_found!
		end
	end

end