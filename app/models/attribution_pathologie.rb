class AttributionPathologie < ActiveRecord::Base
  belongs_to :article
  belongs_to :pathologie
end
