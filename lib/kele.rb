require 'rubygems'
require 'httparty'
require 'json'
require_relative './roadmap'

class Kele
  include HTTParty
  include Roadmap

  def initialize(email, password)
    @options = { query: { email: email, password: password } }
    response = self.class.post("https://www.bloc.io/api/v1/sessions", @options)
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get('https://www.bloc.io/api/v1/mentors/2290632/student_availability', headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_messages(page)
    response = self.class.get('https://www.bloc.io/api/v1/message_threads', headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, subject, stripped_text)
    response = self.class.post("https://www.bloc.io/api/v1/messages",
      body: {
        "sender": sender,
        "recipient_id": recipient_id,
        "subject": subject,
        "stripped-text": stripped_text
      },
      headers: {"authorization" => @auth_token})
      if response.success?
          puts "message sent!"
      end
  end      



end
