# location: spec/feature/integration_spec.rb
 require 'rails_helper'

 RSpec.describe 'Creating a book', type: :feature do
   scenario 'valid inputs' do
       visit new_book_path
       fill_in 'Title', with: 'Lord Of The Rings'
       fill_in 'Author', with: 'JRR Tolkein'
       fill_in 'Price', with: 60
       select 1940, :from => "book_published_date_1i"
       select 'August', :from => "book_published_date_2i"
       select 15, :from => "book_published_date_3i"
       select 12, :from => "book_published_date_4i"
       select 30, :from => "book_published_date_5i"
       click_on 'Create Book'
       visit books_path
       expect(page).to have_content('Lord Of The Rings')
   end
 end
