class Feed < ApplicationRecord
  belongs_to :feedable, polymorphic: true
end
