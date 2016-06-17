class Blog < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
    where("content ILIKE ?", "%#{search}%")
  end
end
