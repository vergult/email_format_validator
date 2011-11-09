Installation
------------

Add this line to your Gemfile:

    gem 'email_format_validator'
    
Then run:

    bundle install
    
Usage
-----

Add the following to one of your model:

    validates :email, :email_format => true
    
Tests
-----

    cd test
    ruby email_format_validator_test.rb
    
Credits
-------

Regular Expression tests based on [Comparing E-mail Address Validating Regular Expressions](http://fightingforalostcause.net/misc/2006/compare-email-regex.php)