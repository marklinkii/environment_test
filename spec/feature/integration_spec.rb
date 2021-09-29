# location: spec/feature/integration_spec.rb
 require 'rails_helper'

# Sunny day test
 RSpec.describe 'Creating a book', type: :feature do
   scenario 'valid inputs' do
       visit new_book_path
       fill_in 'Title', with: 'Lord Of The Rings'
       fill_in 'Author', with: 'JRR Tolkein'
       fill_in 'Price', with: 60
       select 2017, :from => "book_published_date_1i"
       select 'August', :from => "book_published_date_2i"
       select 15, :from => "book_published_date_3i"
       select 12, :from => "book_published_date_4i"
       select 30, :from => "book_published_date_5i"
       click_on 'Create Book'
       visit books_path
       expect(page).to have_content('Lord Of The Rings')
       expect(page).to have_content('JRR Tolkein')
   end
 end

# Rainy day test - title
 RSpec.describe 'Creating a book', type: :feature do
   scenario 'invalid title' do
       visit new_book_path
       fill_in 'Title', with: ''
       fill_in 'Author', with: 'JRR Tolkein'
       fill_in 'Price', with: 60
       select 2017, :from => "book_published_date_1i"
       select 'August', :from => "book_published_date_2i"
       select 15, :from => "book_published_date_3i"
       select 12, :from => "book_published_date_4i"
       select 30, :from => "book_published_date_5i"
       click_on 'Create Book'
       expect(page).to have_content('Title can\'t be blank')
   end
 end

 # Rainy day test - price
  RSpec.describe 'Creating a book', type: :feature do
    scenario 'invalid price' do
        visit new_book_path
        fill_in 'Title', with: 'Lord Of The Rings'
        fill_in 'Author', with: 'JRR Tolkein'
        fill_in 'Price', with: ''
        select 2017, :from => "book_published_date_1i"
        select 'August', :from => "book_published_date_2i"
        select 15, :from => "book_published_date_3i"
        select 12, :from => "book_published_date_4i"
        select 30, :from => "book_published_date_5i"
        click_on 'Create Book'
        expect(page).to have_content('Price can\'t be blank')
    end
  end

  # Rainy day test - author
   RSpec.describe 'Creating a book', type: :feature do
     scenario 'valid inputs' do
         visit new_book_path
         fill_in 'Title', with: 'Lord Of The Rings'
         fill_in 'Author', with: ''
         fill_in 'Price', with: 60
         select 2017, :from => "book_published_date_1i"
         select 'August', :from => "book_published_date_2i"
         select 15, :from => "book_published_date_3i"
         select 12, :from => "book_published_date_4i"
         select 30, :from => "book_published_date_5i"
         click_on 'Create Book'
         expect(page).to have_content('Author can\'t be blank')
     end
   end
