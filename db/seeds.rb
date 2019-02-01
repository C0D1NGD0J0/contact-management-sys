Contact.destroy_all
Group.destroy_all
User.destroy_all

user_ids = []

user_ids << User.create(name: Faker::Name.name, email: "#{Faker::Name.first_name}@example.com", password: 'password').id
user_ids << User.create(name: Faker::Name.name, email: "#{Faker::Name.first_name}@example.com", password: 'password').id

p "2 users were created"

group_ids = { user_ids[0] => [], user_ids[1] => []}

group_ids[user_ids[0]] << Group.create(name: "Business", user_id: user_ids[0]).id;
group_ids[user_ids[0]] << Group.create(name: "Family", user_id: user_ids[0]).id;
group_ids[user_ids[1]] << Group.create(name: "Friends", user_id: user_ids[1]).id;
group_ids[user_ids[1]] << Group.create(name: "Work", user_id: user_ids[1]).id;

p "#{group_ids.count} created"

number_of_contacts = 50
group_count = group_ids.length
contacts = []

number_of_contacts.times do |x|
	user_id = user_ids[Random.rand(0...2)]

	new_contact = {
		name: Faker::Name.name,
		email: Faker::Internet.safe_email,
		phone: Faker::PhoneNumber.phone_number,
		company: "Business Name--#{x}",
		address: Faker::Address.full_address,
		website: "www.#{x}.com",
		group_id: group_ids[user_id][Random.rand(0...group_count)],
		user_id: user_id
	}

	contacts.push(new_contact)
end

Contact.create(contacts)

p "#{number_of_contacts} contacts has been created"