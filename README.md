# Dexcom Code Challenge

#### _By Gloria Friesen_

### Current Version:
1.0 - 09.08.2017

### Description
Front-end automation test code challenge for Dexcom. Duplicates "Register New User Test", running against  <https://shrouded-lowlands-66853.herokuapp.com/>

## Installation/Setup

#### Requirements
  * Ruby 2.0 or higher
    * Check your version: `$ ruby -v`
    * If you need to install or update: <https://www.ruby-lang.org/en/documentation/installation/>
  * Bundler
    * Not sure if you have it, check: `$ bundle version`
    * If you don't, install: `$ gem install bundler`
  * Xcode commandline tools
    * I needed to install this directly. Otherwise, my bundler could not install Capybara, which depends on Nokogiri, which depends on xcode commandline tools for installation. From the documentation, most people should not need to install it explicitly.
    * But, if you run into issues when installing Capybara via the Gemfile, try installing xcode: `$xcode-select --install`
  * Chromedriver
    * This will run the tests in a Chrome browser. I needed a web driver to direct the tests toward a remote website. Selenium defaulted to Firefox which had issues connecting to the heroku app. Switching the default driver to Selenium-Chrome and installing Chromedriver worked beautifully.
    * install: `$ brew install chromedriver`
    * if you don't have homebrew, install it with the command `$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

#### Run it
  * clone the repository: `$ git clone <https://github.com/GloriaFriesen/dexcom-challenge.git>`
  * navigate to project folder: `$ cd dexcom-challenge`
  * install gems: `$ bundle install`
  * run the tests: `$ rspec`

## Test Cases

| Test Step | Action | Expected Result | Screenshot |
| :----------------------: | :----------------------: | :----------------------: | :----------------------: |
| A01 | Navigate to the Testing Page. | Page to register a new user is displayed. | [A01.png](screenshots/A01.png) |
| A02 | Fill out all required fields except for First Name with valid data and check all checkboxes. Select the Save User button. | An error message displays indicating that the First Name field requires a value. | [A02.png](screenshots/A02.png) |
| A03 | Clear all fields. Fill out all required fields except for First Name with valid data and check all checkboxes. Attempt to fill in the First Name field with 16 valid characters. | Only the first 15 characters are entered. Record the value you attempted to enter. Record the value which was actually entered. | [A03.png](screenshots/A03.png) |
| A04 | Clear all fields. Fill out all required fields with valid data and check all checkboxes. Do not select a suffix. | | [A04.png](screenshots/A04.png) |
| A05 | Select the Save User button. | The app navigates to the Success page. There is no error message indicating that a suffix is required. | [A05.png](screenshots/A05.png) |
| A06 | Navigate to the Testing Page. | | |
| A07 | Clear all fields. Fill out all required fields except for Title with valid data and check all checkboxes. In the Title field, enter a value containing letters and at least one number. Select the Save User button. | An error message displays indicating that the Title field only accepts letters and spaces. | [A06.png](screenshots/A06.png) |
| A08 | Clear all fields. Fill out all required fields except for Title with valid data and check all checkboxes. In the Title field, enter a value containing letters and at least one space. Select the Save User button. | The app navigates to the Success page. | [A07.png](screenshots/A07.png) |
| A09 | Navigate to the Testing Page. | | |
| A10 | Fill out all required fields except for Email with valid data and check all checkboxes. Fill out the Email field with abc. Select the Save User button. | An error message displays indicating that the Email field must be formatted as an email. | [A10.png](screenshots/A10.png) |
| A11 | Clear all fields. Fill out all required fields except for Email with valid data and check all checkboxes. Fill out the Email field with a@bc. Select the Save User button. | An error message displays indicating that the Email field must be formatted as an email. | [A11.png](screenshots/A11.png) |
| A12 | Clear all fields. Fill out all required fields except for Email with valid data and check all checkboxes. Fill out the Email field with a@b.c. Select the Save User button. | The app navigates to the Success page. | [A12.png](screenshots/A12.png) |
| A13 | Navigate to the Testing Page. | | |
| A14 | Clear all fields. Fill out all required fields except for Zip with valid data and check all checkboxes. Fill out the Zip field with between 1 and 4 valid characters. Select the Save User button. | An error message displays indicating that the length of the zip code must be between 5 and 20 characters. | [A14.png](screenshots/A14.png) |
| A15 | Clear all fields. Fill out all required fields except for Zip with valid data and check all checkboxes. Fill out the Zip field with between 21 and 25 valid characters. Select the Save User button. | An error message displays indicating that the length of the zip code must be between 5 and 20 characters. | [A15.png](screenshots/A15.png) |

## Known Bugs
None that I know of.

## Support and contact details
Questions? Concerns? Suggestions? Reach out to me via github: <https://github.com/GloriaFriesen>.

## Technologies Used
* _Ruby_
* _Capybara_
* _RSPEC_
* _Selenium_

## License
This software is licensed under the MIT license.
Copyright (c) 2017 Gloria Friesen.
