class Contact < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  paginates_per 7
  
  validates :name, :email, :group_id, :phone, presence: true
  validates :name, length: { in: 2..15 }

  scope :search, -> (query) do
  	where('name ILIKE :query or company ILIKE :query or email ILIKE :query', query: "%#{query.downcase}%") if query.present?
  end

  scope :by_group, -> (group_id) { where(group_id: group_id) if group_id.present? }

  def get_avatar
		hash = Digest::MD5.hexdigest(email.downcase)
		"https://www.gravatar.com/avatar/#{hash}"
  end

  # def self.search(query)
  # 	if query && !query.empty?
  # 		where('name ILIKE ?', "%#{query}%")
  # 	else
  # 		all
  # 	end
  # end

  # def self.by_group(group_id)
  # 	if group_id && !group_id.empty?
  # 		where(group_id: group_id)
  # 	else
  # 		all
  # 	end
  # end
end




#       if params[:query] && !params[:group_id].empty?
#         @contacts = group.contacts.order(created_at: :desc).page(params[:page])
#       else
#         @contacts = group.contacts.order(created_at: :desc).page(params[:page])
#       end