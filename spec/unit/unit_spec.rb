# location: spec/unit/unit_spec.rb
 require 'rails_helper'

# Sunny day test
 RSpec.describe Book, type: :model do
   subject do
       described_class.new(title: 'Lord Of The Rings', author:'JRR Tolkein', price:60.0, published_date:'2019-08-15 12:30:00')
   end

   it 'is valid with valid attributes' do
     expect(subject).to be_valid
   end

 end

# Rainy day test - price
RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'Lord Of The Rings', author:'JRR Tolkein', price: 0, published_date:'2019-08-15 12:30:00')
  end

  it 'Price is invalid (must be > 0)' do
    subject.price = nil
    expect(subject).not_to be_valid
  end
end

# Rainy day test - title
RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: '', author:'JRR Tolkein', price: 10, published_date:'2019-08-15 12:30:00')
  end

  it 'Title cant be empty' do
    subject.title = nil
    expect(subject).not_to be_valid
  end
end

# Rainy day test - author
RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'Lord Of The Rings', author:'', price: 10, published_date:'2019-08-15 12:30:00')
  end

  it 'Author cant be empty' do
    subject.author = nil
    expect(subject).not_to be_valid
  end
end
