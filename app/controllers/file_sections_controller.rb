class FileSectionsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_page, only: [:create, :update, :destroy]
	before_filter :load_file_section, only: [:edit, :update, :destroy]


	def create
		@file_section = @page.file_sections.new(params[:file_section])
		authorize! :create, @file_section
		if @file_section.valid? then
			@file_section.save
			redirect_to page_path(@page)
		else
			render text: @file_section.errors.full_messages
		end
	end

	def edit
		authorize! :update, @file_section
	end

	def update
		authorize! :update, @file_section
		@file_section.update_attributes(params[:file_section])
		if @file_section.valid? then
			redirect_to page_path(@page)
		else
			render text: @file_section.errors.full_messages
		end
	end

	def destroy
		authorize! :destroy, @file_section
		@file_section.destroy
		redirect_to page_path(@page)
	end

	protected

	def load_page
		@page = Page.find_by_url(params[:page_id])
		if not @page then
			not_found!
		end
	end

	def load_file_section
		@file_section = FileSection.find_by_id(params[:id])
		if not @file_section then
			not_found!
		end
	end



end