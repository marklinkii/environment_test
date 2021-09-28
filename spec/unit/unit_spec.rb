# location: spec/unit/unit_spec.rb
 require 'rails_helper'

# Sunny day test
 RSpec.describe Book, type: :model do
   subject do
       described_class.new(title: 'Lord Of The Rings', author:'JRR Tolkein', price:60, published_date:'1940-08-15 12:30:00')
   end

   it 'is valid with valid attributes' do
     expect(subject).to be_valid
   end

 end

# Rainy day test
RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'Lord Of The Rings', author:'JRR Tolkein', price: 0, published_date:'1940-08-15 12:30:00')
  end

  it 'Price is invalid (must be > 0)' do
    subject.price <= 0
    expect(subject).not_to be_valid
  end
end
