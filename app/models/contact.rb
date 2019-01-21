class Contact < ApplicationRecord
  belongs_to :group

  def get_avatar
		hash = Digest::MD5.hexdigest(email.downcase)
		"https://www.gravatar.com/avatar/#{hash}"
  end
end
