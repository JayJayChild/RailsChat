class ConversationsController < ApplicationController
	#these happen at the beginning of the controller call!
	before_filter :authenticate_user!
	before_filter :get_mailbox
	before_filter :get_conversation, except: [:index]

	def index
		@conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
	end

	def show 

	end


	private 

	def get_mailbox
		@mailbox ||= current_user.mailbox
	end

	def get_conversation 
		@conversation ||= @mailbox.conversations.find(params[:id])
	end
end
