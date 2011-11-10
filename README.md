Installation
------------

Add this line to your Gemfile:

    gem 'email_format_validator'
    
Then run:

    bundle install
    
Usage
-----

Add the following to one of your models:

    validates :email, :email_format => true
    
You can turn on RFC 822 compliant email verification by passing on:

    validates :email, :email_format => { :rfc => true }

Be aware that this is disabled by default as websites will often need a less permissive email check than the RFC one (check out tests for more details).

You can also modify the default message if validation fails:

    validates :email, :email_format => { :message => "is not formatted properly" }

Tests
-----

    cd test
    ruby email_format_validator_test.rb
    
Credits
-------

Regular Expression tests based on [Comparing E-mail Address Validating Regular Expressions](http://fightingforalostcause.net/misc/2006/compare-email-regex.php)