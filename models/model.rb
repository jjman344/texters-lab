require 'twilio-ruby'

def send_sms(phone_number, text)
  account_sid = 'AC1c7540dde1176984785aa9200209c5ea'
  auth_token = '628e6429fe6a2dc36731c745b50180fa'
  @client = Twilio::REST::Client.new account_sid, auth_token 
 
    message = @client.account.messages.create({
      :from => '+12032023229', 
      :to => phone_number,
      :body => text 
      })
  
  puts message.sid
end