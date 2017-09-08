require('capybara/rspec')

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'https://shrouded-lowlands-66853.herokuapp.com/'
Capybara.run_server = false

# A01
describe "Test case A01: navigate to the testing page", :type => :feature do
  it "Page to register a new user is displayed." do
    visit ('/')
    expect(page).to have_content 'Register New User'
    page.save_screenshot('screenshots/A01.png')
  end
end

# A02
describe "Test case A02: fill out required fields except first name with valid data and check all checkboxes. Select the save user button.", :type => :feature do
  it "displays error message indicating first name requires a value" do
    visit('/')
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Cook'
    fill_in 'user[email]', with: 'belchers@burgers.com'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '11693'
    check 'user[agree_1]'
    check 'user[agree_2]'
    click_button 'Save User'
    expect(page).to have_content 'First Name cannot be blank'
    page.save_screenshot('screenshots/A02.png')
  end
end

# A03
describe "Test case A03: fill out all required fields with valid data and check all checkboxes. Attempt to fill in the first name field with 16 valid characters", :type => :feature do
  it "only the first 15 characters are entered in first name field" do
    visit ('/')
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Cook'
    fill_in 'user[email]', with: 'belchers@burgers.com'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '11693'
    check 'user[agree_1]'
    check 'user[agree_2]'
    #enter word with 16 characters (Programmatically) in First Name field
    fill_in 'user[first_name]', with: 'Programmatically'
    expect(page).to have_field('user[first_name]', :with =>'Programmaticall')
    page.save_screenshot('screenshots/A03.png')
  end
end

#A04
describe "Test case A04: fill out all required fields with valid data and check all checkboxes. Do not select a suffix.", :type => :feature do
  it "successfully registers new user with no errors" do
    visit('/')
    fill_in 'user[first_name]', with: 'Tina'
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Cook'
    fill_in 'user[email]', with: 'belchers@burgers.com'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '11693'
    check 'user[agree_1]'
    check 'user[agree_2]'
    expect(page).to have_field('user[first_name]', :with =>'Tina')
    expect(page).to have_field('user[last_name]', :with => 'Belcher')
    expect(page).to have_field('user[title]', :with => 'Cook')
    expect(page).to have_field('user[email]', :with => 'belchers@burgers.com')
    expect(page).to have_field('user[phone_number]', :with => '347-867-5309')
    expect(page).to have_field('user[business_name]', :with => 'Bobs Burgers')
    expect(page).to have_field('user[address_1]', :with => '568 Ocean Ave')
    expect(page).to have_field('user[zip]', :with => '11693')
    expect(page).to have_field("user[state]", :with =>"NY")
    expect(page).to have_field('user[agree_1]', checked: true)
    expect(page).to have_field('user[agree_2]', checked: true)
    page.save_screenshot('screenshots/A04.png')
  end
end

#A05
describe "Test case A05: select the save user button with required fields complete with valid data", :type => :feature do
  it "navigates to success page with no error message indicating a suffix is required" do
    visit('/')
    fill_in 'user[first_name]', with: 'Tina'
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Cook'
    fill_in 'user[email]', with: 'belchers@burgers.com'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '11693'
    check 'user[agree_1]'
    check 'user[agree_2]'
    click_button 'Save User'
    expect(page).to have_content 'Success! You have signed up. Register a user.'
    page.save_screenshot('screenshots/A05.png')
  end
end

# A06
describe "Test case A06: navigate to the testing page", :type => :feature do
  it "Page to register a new user is displayed." do
    visit ('/')
    expect(page).to have_content 'Register New User'
  end
end

#A07
describe "Test case A07: fill out required fields, except Title, with valid data and check all checkboxes. In title field, enter a value containing letters and at least one number. Select save user button.", :type => :feature do
  it "displays error message indicating title field only accepts letters and spaces" do
    visit('/')
    fill_in 'user[first_name]', with: 'Tina'
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Cook 123'
    fill_in 'user[email]', with: 'belchers@burgers.com'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '11693'
    check 'user[agree_1]'
    check 'user[agree_2]'
    click_button 'Save User'
    expect(page).to have_content 'Title can only contain letters and spaces'
    page.save_screenshot('screenshots/A07.png')
  end
end

#A08
describe "Test case A08: fill out required fields, except Title, with valid data and check all checkboxes. In title field, enter a value containing letters and at least one space. Select save user button.", :type => :feature do
  it "navigates to success page" do
    visit('/')
    fill_in 'user[first_name]', with: 'Tina'
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Line Cook'
    fill_in 'user[email]', with: 'belchers@burgers.com'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '11693'
    check 'user[agree_1]'
    check 'user[agree_2]'
    click_button 'Save User'
    expect(page).to have_content 'Success! You have signed up. Register a user.'
    page.save_screenshot('screenshots/A08.png')
  end
end

# A09
describe "Test case A09: navigate to the testing page", :type => :feature do
  it "Page to register a new user is displayed." do
    visit ('/')
    expect(page).to have_content 'Register New User'
  end
end

#A10
describe "Test case A10: fill out required fields, except Email, with valid data and check all checkboxes. Fill out Email field with abc. Select save user button.", :type => :feature do
  it "displays error message indicating Email field must be formatted as an email" do
    visit('/')
    fill_in 'user[first_name]', with: 'Tina'
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Line Cook'
    fill_in 'user[email]', with: 'abc'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '11693'
    check 'user[agree_1]'
    check 'user[agree_2]'
    click_button 'Save User'
    expect(page).to have_content 'Email must be formatted as a valid email address'
    page.save_screenshot('screenshots/A10.png')
  end
end

#A11
describe "Test case A11: fill out required fields, except Email, with valid data and check all checkboxes. Fill out Email field with a@bc. Select save user button.", :type => :feature do
  it "displays error message indicating Email field must be formatted as an email" do
    visit('/')
    fill_in 'user[first_name]', with: 'Tina'
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Line Cook'
    fill_in 'user[email]', with: 'a@bc'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '11693'
    check 'user[agree_1]'
    check 'user[agree_2]'
    click_button 'Save User'
    expect(page).to have_content 'Email must be formatted as a valid email address'
    page.save_screenshot('screenshots/A11.png')
  end
end

#A12
describe "Test case A12: fill out required fields, except Email, with valid data and check all checkboxes. Fill out Email field with a@b.c. Select save user button.", :type => :feature do
  it "displays error message indicating Email field must be formatted as an email" do
    visit('/')
    fill_in 'user[first_name]', with: 'Tina'
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Line Cook'
    fill_in 'user[email]', with: 'a@b.c'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '11693'
    check 'user[agree_1]'
    check 'user[agree_2]'
    click_button 'Save User'
    expect(page).to have_content 'Success! You have signed up. Register a user.'
    page.save_screenshot('screenshots/A12.png')
  end
end

# A13
describe "Test case A13: navigate to the testing page", :type => :feature do
  it "Page to register a new user is displayed." do
    visit ('/')
    expect(page).to have_content 'Register New User'
  end
end

#A14
describe "Test case A14: fill out required fields, except Zip, with valid data and check all checkboxes. Fill out Zip field with between 1 and 4 valid characters. Select save user button.", :type => :feature do
  it "displays error message indicating zip code must be between 5 and 20 characters" do
    visit('/')
    fill_in 'user[first_name]', with: 'Tina'
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Line Cook'
    fill_in 'user[email]', with: 'a@b.c'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: '123'
    check 'user[agree_1]'
    check 'user[agree_2]'
    click_button 'Save User'
    expect(page).to have_content 'Postal code must be between 5 and 20 characters'
    page.save_screenshot('screenshots/A14.png')
  end
end

#A15
describe "Test case A15: fill out required fields, except Zip, with valid data and check all checkboxes. Fill out Zip field with between 21 and 25 valid characters. Select save user button.", :type => :feature do
  it "displays error message indicating zip code must be between 5 and 20 characters" do
    visit('/')
    fill_in 'user[first_name]', with: 'Tina'
    fill_in 'user[last_name]', with: 'Belcher'
    fill_in 'user[title]', with: 'Line Cook'
    fill_in 'user[email]', with: 'a@b.c'
    fill_in 'user[phone_number]', with: '347-867-5309'
    fill_in 'user[business_name]', with: 'Bobs Burgers'
    fill_in 'user[address_1]', with: '568 Ocean Ave'
    fill_in 'user[city]', with: 'Rockaway Beach'
    select 'NY', from: 'user[state]'
    fill_in 'user[zip]', with: 'thisisa24charlongzipcode'
    check 'user[agree_1]'
    check 'user[agree_2]'
    click_button 'Save User'
    expect(page).to have_content 'Postal code must be between 5 and 20 characters'
    page.save_screenshot('screenshots/A15.png')
  end
end
