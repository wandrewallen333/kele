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

end
