class Contact < ApplicationRecord
  belongs_to :group
  paginates_per 7
  
  validates :name, :email, :group_id, :phone, presence: true
  validates :name, length: { in: 2..15 }

  def get_avatar
		hash = Digest::MD5.hexdigest(email.downcase)
		"https://www.gravatar.com/avatar/#{hash}"
  end
end
