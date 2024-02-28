require 'rails_helper'

RSpec.describe Variety, type: :model do
  context 'Validation Tests' do
    it 'is not valid without a name' do
      type = Type.create(name: Faker::Food.vegetables)
      variety = Variety.create(type: type, name: '')
      expect(variety).to_not be_valid
    end

    it 'is valid if two different types have same variety name' do
      type1 = Type.create(name: "Spinach")
      type2 = Type.create(name: "Lettuce")
      variety1 = Variety.create(type: type1, name: 'Space')
      variety2 = Variety.create(type: type2, name: 'Space')
      expect(variety2).to be_valid
    end

    it 'is not valid if a type has the same variety name' do
      type1 = Type.create(name: "Spinach")
      variety1 = Variety.create(type: type1, name: 'Space')
      variety2 = Variety.create(type: type1, name: 'Space')
      expect(variety2).to_not be_valid
    end
  end

  
end
