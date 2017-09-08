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
| ---------------------- | :------------------: | :----------------:| :---------------: |
| A01 | Navigate to the Testing Page. | Page to register a new user is displayed. | [A01.png](screenshots/A01.png) |

## Known Bugs
None that I know of.

## Support and contact details
Questions? Concerns? Suggestions? Reach out to me via github: <https://github.com/GloriaFriesen>.

## Technologies Used
* _Angular2.js_
* _TypeScript_
* _HTML_
* _CSS_
* _npm_
* _Bower_
* _Bootstrap_

## License
This software is licensed under the MIT license.
Copyright (c) 2017 Gloria Friesen.
