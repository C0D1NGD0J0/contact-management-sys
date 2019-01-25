class Contact < ApplicationRecord
  belongs_to :group
  paginates_per 7
  
  validates :name, :email, :group_id, :phone, presence: true
  validates :name, length: { in: 2..15 }

  def get_avatar
		hash = Digest::MD5.hexdigest(email.downcase)
		"https://www.gravatar.com/avatar/#{hash}"
  end

  def self.search(query)
  	if query && !query.empty?
  		where('name ILIKE ?', "%#{query}%")
  	else
  		all
  	end
  end

  def self.by_group(group_id)
  	if group_id && !group_id.empty?
  		where(group_id: group_id)
  	else
  		all
  	end
  end
end




#       if params[:query] && !params[:group_id].empty?
#         @contacts = group.contacts.order(created_at: :desc).page(params[:page])
#       else
#         @contacts = group.contacts.order(created_at: :desc).page(params[:page])
#       end