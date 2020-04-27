class LibrarySerializer < ApplicationSerializer
  belongs_to :purchase_of, polymorphic: true
end
