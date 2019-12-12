# == Schema Information
#
# Table name: offer_tag_relations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  offer_id   :bigint
#  tag_id     :bigint
#
# Indexes
#
#  index_offer_tag_relations_on_offer_id  (offer_id)
#  index_offer_tag_relations_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (offer_id => offers.id)
#  fk_rails_...  (tag_id => tags.id)
#

class OfferTagRelation < ApplicationRecord
  belongs_to :offer
  belongs_to :tag
end
