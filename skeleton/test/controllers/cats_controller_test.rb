# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          default(0), not null
#

require 'test_helper'

class CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get cats_edit_url
    assert_response :success
  end

  test "should get index" do
    get cats_index_url
    assert_response :success
  end

  test "should get new" do
    get cats_new_url
    assert_response :success
  end

  test "should get show" do
    get cats_show_url
    assert_response :success
  end

end
