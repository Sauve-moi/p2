# require 'test_helper'
#
# class HousesControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @house = houses(:one)
#   end
#
#   test "should get index" do
#     get 'houses/index/'
#     assert_response :redirect
#   end
#
#   test "should get new" do
#     get 'houses/new'
#     assert_response :redirect
#   end
#
#   test "should create house" do
#     assert_difference('House.count') do
#       post '/houses/create', params: { houses: { location: @house.location, square_footage: @house.square_footage, year_built: @house.year_built, style: @house.style, list_price: @house.list_price, floors: @house.floors, basement: @house.basement, current_house_owner: @house.current_house_owner }}
#     end
#
#     assert_redirected_to '/houses/index'
#   end
#
#   test "should show house" do
#     get '/houses/show/', params: { id: @house.id }
#     assert_response :redirect
#   end
#
#   test "should get edit" do
#     get '/houses/edit', params: { id: @house.id }
#     assert_response :success
#   end
#
#   test "should update house" do
#     patch '/houses/update', params: { id: @house.id }, params: { house: { location: @house.location, square_footage: @house.square_footage, year_built: @house.year_built, style: @house.style, list_price: @house.list_price, floors: @house.floors, basement: @house.basement, current_house_owner: @house.current_house_owner} }
#
#     assert_redirected_to '/houses/show'+ @house.id.to_s
#   end
#
#   test "should destroy house" do
#     assert_difference('House.count', -1) do
#       delete '/houses/destroy', params: { id: @house.id }
#     end
#
#
#     assert_redirected_to '/houses/'
#     end
# end
#
