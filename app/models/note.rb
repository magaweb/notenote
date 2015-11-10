class Note < ActiveRecord::Base
    belongs_to :user

    attachment :photo, type: :image

    has_many :documents, dependent: :destroy

    accepts_attachments_for :documents

    def self.search(search)
      where("title LIKE ?", "%#{search}%")
      where("content LIKE ?", "%#{search}%")
    end

end
