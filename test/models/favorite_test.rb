# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  offer_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_favorites_on_offer_id              (offer_id)
#  index_favorites_on_user_id               (user_id)
#  index_favorites_on_user_id_and_offer_id  (user_id,offer_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (offer_id => offers.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
