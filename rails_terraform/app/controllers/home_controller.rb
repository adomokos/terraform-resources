class HomeController < ApplicationController
  def index
    output = {'foo' => 'bar'}.to_json
    render :json => output
  end
end
