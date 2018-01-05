class Kele
  include HTTParty
  def initialize(email, password)
    @options = { query: { email: email, password: password } }
    response = self.class.post("https://www.bloc.io/api/v1", @options)
    @auth_token = response["auth_token"]
  end
end