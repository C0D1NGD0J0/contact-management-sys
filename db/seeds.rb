Contact.destroy_all;
Group.destroy_all;

group_ids = []

group_ids << Group.create(name: "Business").id;
group_ids << Group.create(name: "Family").id;
group_ids << Group.create(name: "Friends").id;

p "#{group_ids.count} created"

number_of_contacts = 20
group_count = group_ids.length
contacts = []

number_of_contacts.times do |x|
	new_contact = {
		name: Faker::Name.name,
		email: Faker::Internet.safe_email,
		phone: Faker::PhoneNumber.phone_number,
		company: "Business Name--#{x}",
		address: Faker::Address.full_address,
		website: "www.#{x}.com",
		group_id: group_ids[Random.rand(0...group_count)]
	}

	contacts.push(new_contact)
end

Contact.create(contacts)

p "#{number_of_contacts} contacts has been created"