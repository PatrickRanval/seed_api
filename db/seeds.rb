require 'faker'

# Create Types

types = []
rand(3..6).times do
    types << Type.create(
        name: Faker::Food.vegetables
    )
end

# Create Varieties
varieties = []
10.times do
  varieties << Variety.create(
    type: types.sample,
    name: Faker::Food.fruits
  )
end

# Create Users
users = []
5.times do
  users << User.create(
    email: Faker::Internet.email,
    #TODO: Build Out Password
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Create UserVarieties (associating random varieties with random users)
users.each do |user|
  user_varieties_count = rand(1..5)
  user_varieties = varieties.sample(user_varieties_count)
  user_varieties.each do |variety|
    UserVariety.create(user: user, variety: variety)
  end
end

# Create Vendors
vendors = []
5.times do
  vendors << Vendor.create(
    name: Faker::Company.name,
    website: Faker::Internet.url
  )
end

# Create Sources
sources = []
5.times do
  sources << Source.create(
    name: Faker::Company.name,
    website: Faker::Internet.url
  )
end

# Create Listings (associating random varieties with random vendors)
vendors.each do |vendor|
  listing_count = rand(1..5)
  listings = varieties.sample(listing_count)
  listings.each do |variety|
    Listing.create(
      vendor: vendor,
      variety: variety,
      quantity: rand(1..100),
      price: Faker::Commerce.price,
      story: Faker::Lorem.paragraph,
      organic_status: [true, false].sample
    )
  end
end

# Create SourceRecords (associating random varieties with random sources)
sources.each do |source|
  source_record_count = rand(1..5)
  source_records = varieties.sample(source_record_count)
  source_records.each do |variety|
    SourceRecord.create(
      source: source,
      variety: variety,
      story: Faker::Lorem.paragraph
    )
  end
end

# Create SeedGrowingInstances (associating random varieties with random users)
users.each do |user|
  seed_growing_instance_count = rand(1..5)
  seed_growing_instances = varieties.sample(seed_growing_instance_count)
  seed_growing_instances.each do |variety|
    SeedGrowingInstance.create(
      user: user,
      variety: variety,
      start_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      harvest_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
      story: Faker::Lorem.paragraph,
      seeds_saved: [true, false].sample
    )
  end
end