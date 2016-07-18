class RepositoriesController < ApplicationController
  def index
    response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    @repos_array = JSON.parse(response.body)
  end

  def create
    service = GithubService.new({"access_token"=> session[:token]})
    service.create_repo(params[:name])
    redirect_to '/'
  end
end
