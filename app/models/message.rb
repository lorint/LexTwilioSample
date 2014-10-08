require "twilio-ruby"
class Message < ActiveRecord::Base

	def send_text
		twilio_sid = ENV["twilio_sid"]
		twilio_token = ENV["twilio_token"]
		twilio_phone_number = ENV["twilio_phone"]
		# rememeber this: the scope of a variable within a method is limited to that 
		# method unless you definie it globally. So you couldn't access the 
		# the twilio token or id because it was defined outside of this method
		# however the class aka message could use it 
		@client = Twilio::REST::Client.new(twilio_sid, twilio_token)
		@client.account.messages.create(
			:from => twilio_phone_number,
			:to =>   self.number,
				# right here we're simply calling the phone number method for message 
			:body => self.content)	
	end 
	 
	validates :content, :name, :number, presence: true 

end
