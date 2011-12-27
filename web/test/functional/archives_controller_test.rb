require 'test_helper'

class ArchivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get photos" do
    get :photos
    assert_response :success
  end

  test "should get documents" do
    get :documents
    assert_response :success
  end

  test "should get videos" do
    get :videos
    assert_response :success
  end

end
