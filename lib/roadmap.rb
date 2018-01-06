module Roadmap

  def get_roadmap(roadmap_id)
    response = self.class.get('https://www.bloc.io/api/v1/roadmaps/37', headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_checkpoint
    response = self.class.get('https://www.bloc.io/api/v1/checkpoints/2553', headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

end
