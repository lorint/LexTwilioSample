class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
	
	def index 
		@messages = Message.all
	end 
 
	def edit 
		@message = Message.find(params[:id])
	end 
 
	def new
		@message = Message.new
	end  
 
	def create 
		@message = Message.new(message_params)
		if @message.save
			@message.send_text
		redirect_to messages_path(@message)
		else 
		render "new"
		end
	end
 
	def show 
		@message = Message.find(params[:id])
	end 
 
	protected
	def message_params
		params.require(:message).permit(:content, :name, :number)
	end 
end
