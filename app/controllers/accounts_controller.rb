class AccountsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_account

	def show

	end

	def edit

	end

	def update
		if params[:account][:subscription_tier] then
			@account.subscription_tier = params[:account][:subscription_tier]
			params[:account].delete('subscription_tier')
		end
		@account.update_attributes(params[:account])
		if @account.valid? then
			redirect_to account_path
		else
			render :edit
		end
	end

	protected

	def load_account
		@account = current_user.account
		if not @account then
			not_found!
		end
	end

end