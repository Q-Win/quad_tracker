require 'test_helper'
require './app/services/riot_service'

class RiotServiceTest < ActionDispatch::IntegrationTest

  def setup

  end

  test "it can get a JSON" do
    riot_service = RiotService.new
    matches = riot_service.matches
    debugger
    assert_not_nil matches
    # assert_equal recipes[0][:name],"Minestrone"
    # assert recipes, Array
  end

end
