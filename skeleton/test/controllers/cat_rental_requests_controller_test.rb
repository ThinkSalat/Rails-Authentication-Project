# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  end_date   :date             not null
#  start_date :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          default(0), not null
#

require 'test_helper'

class CatRentalRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cat_rental_requests_new_url
    assert_response :success
  end

end
