class Document < ActiveRecord::Base
  belongs_to :note

  attachment :file
end

