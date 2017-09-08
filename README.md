clone it:
https://github.com/GloriaFriesen/dexcom-challenge.git

requirements:
install ruby (2.0 or higher)
check with `ruby -v`
go here to install: https://www.ruby-lang.org/en/documentation/installation/

install bundler
check with `bundle version`
install with `gem install bundler`

install xcode commandline tools:
(I needed this for my bundler to install capybara which depends on nokogiri, which depends on xcode. From the documentation, it seems that not everyone will need this)
`xcode-select --install`

install chromedriver:
`brew install chromedriver`
if you don't have homebrew, install it with `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`


install gems:
run `bundle install`

run the tests:
`rspec`
