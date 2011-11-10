# -*- encoding: utf-8 -*-

require_relative 'test_helper'

class TestUser < TestModel
  validates :email, :email_format => true
end

class TestUserWithRfcCompliantEmail < TestModel
  validates :email, :email_format => { :rfc => true }
end

class TestUserAllowsNilToTrue < TestModel
  validates :email, :email_format => { :allow_nil => true }
end

class TestUserAllowsNilToFalse < TestModel
  validates :email, :email_format => { :allow_nil => false }
end

class TestUserWithMessage < TestModel
  validates :email, :email_format => { :message => 'is not formatted properly' }
end

class TestEmailFormatValidator < MiniTest::Unit::TestCase
  def rfc_valid_emails
    [
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@letters-in-local.org',
      '01234567890@numbers-in-local.net',
      '&\'*+-./=?^_{}~@other-valid-characters-in-local.net',
      'mixed-1234-in-{+^}-local@sld.net',
      'a@single-character-in-local.org',
      '"quoted"@sld.com',
      '"\e\s\c\a\p\e\d"@sld.com',
      '"quoted-at-sign@sld.org"@sld.com',
      '"escaped\"quote"@sld.com',
      '"back\slash"@sld.com',
      'one-character-third-level@a.example.com',
      'single-character-in-sld@x.org',
      'local@dash-in-sld.com',
      'letters-in-sld@123.com',
      'one-letter-sld@x.org',
      'uncommon-tld@sld.museum',
      'uncommon-tld@sld.travel',
      'uncommon-tld@sld.mobi',
      'country-code-tld@sld.uk',
      'country-code-tld@sld.rw',
      'local@sld.newTLD',
      'punycode-numbers-in-tld@sld.xn--3e0b707e',
      'the-total-length@of-an-entire-address-cannot-be-longer-than-two-hundred-and-fifty-four-characters' +
        '-and-this-address-is-254-characters-exactly-so-it-should-be-valid-and-im-going-to-add-some-more' +
        '-words-here-to-increase-the-lenght-blah-blah-blah-blah-bla.org',
      # 'bracketed-IP-instead-of-domain@[127.0.0.1]',
      'local@sub.domains.com'
    ]
  end

  def rfc_invalid_emails
    [
      '',
      # 'foo@bar',
      # 'foo@bar.c',
      'foo@bar.com@bar.com',
      'foo@',
      '@missing-local.org',
      '! #$%`|@invalid-characters-in-local.org',
      '(),:;`|@more-invalid-characters-in-local.org',
      '<>@[]\`|@even-more-invalid-characters-in-local.org',
      '.local-starts-with-dot@sld.com',
      'local-ends-with-dot.@sld.com',
      'two..consecutive-dots@sld.com',
      # 'partially."quoted"@sld.com',
      # 'the-local-part-is-invalid-if-it-is-longer-than-sixty-four-characters@sld.net',
      'missing-sld@.com',
      'sld-starts-with-dashsh@-sld.com',
      'sld-ends-with-dash@sld-.com',
      'invalid-characters-in-sld@! "#$%(),/;<>_[]`|.org',
      # 'missing-dot-before-tld@com',
      # 'missing-tld@sld.',
      # 'the-total-length@of-an-entire-address-cannot-be-longer-than-two-hundred-and-fifty-four-characters-and' +
      #   '-this-address-is-255-characters-exactly-so-it-should-be-invalid-and-im-going-to-add-some-more-words' +
      #   '-here-to-increase-the-lenght-blah-blah-blah-blah-bl.org',
      'missing-at-sign.net',
      'unbracketed-IP@127.0.0.1',
      'invalid-ip@127.0.0.1.26',
      'another-invalid-ip@127.0.0.256',
      'IP-and-port@127.0.0.1:25'
    ]
  end

  def valid_emails
    [
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@letters-in-local.org',
      '01234567890@numbers-in-local.net',
      # '&\'*+-./=?^_{}~@other-valid-characters-in-local.net',
      # 'mixed-1234-in-{+^}-local@sld.net',
      'a@single-character-in-local.org',
      # '"quoted"@sld.com',
      # '"\e\s\c\a\p\e\d"@sld.com',
      # '"quoted-at-sign@sld.org"@sld.com',
      # '"escaped\"quote"@sld.com',
      # '"back\slash"@sld.com',
      'one-character-third-level@a.example.com',
      'single-character-in-sld@x.org',
      'local@dash-in-sld.com',
      'letters-in-sld@123.com',
      'one-letter-sld@x.org',
      'uncommon-tld@sld.museum',
      'uncommon-tld@sld.travel',
      'uncommon-tld@sld.mobi',
      'country-code-tld@sld.uk',
      'country-code-tld@sld.rw',
      'local@sld.newTLD',
      # 'punycode-numbers-in-tld@sld.xn--3e0b707e',
      'the-total-length@of-an-entire-address-cannot-be-longer-than-two-hundred-and-fifty-four-characters' +
        '-and-this-address-is-254-characters-exactly-so-it-should-be-valid-and-im-going-to-add-some-more' +
        '-words-here-to-increase-the-lenght-blah-blah-blah-blah-bla.org',
      # 'bracketed-IP-instead-of-domain@[127.0.0.1]',
      'local@sub.domains.com'
    ]
  end

  def invalid_emails
    [
      '',
      'foo@bar',
      'foo@bar.c',
      'foo@bar.com@bar.com',
      'foo@',
      '@missing-local.org',
      '! #$%`|@invalid-characters-in-local.org',
      '(),:;`|@more-invalid-characters-in-local.org',
      '<>@[]\`|@even-more-invalid-characters-in-local.org',
      # '.local-starts-with-dot@sld.com',
      # 'local-ends-with-dot.@sld.com',
      # 'two..consecutive-dots@sld.com',
      'partially."quoted"@sld.com',
      # 'the-local-part-is-invalid-if-it-is-longer-than-sixty-four-characters@sld.net',
      'missing-sld@.com',
      # 'sld-starts-with-dashsh@-sld.com',
      # 'sld-ends-with-dash@sld-.com',
      'invalid-characters-in-sld@! "#$%(),/;<>_[]`|.org',
      'missing-dot-before-tld@com',
      'missing-tld@sld.',
      # 'the-total-length@of-an-entire-address-cannot-be-longer-than-two-hundred-and-fifty-four-characters-and' +
      #   '-this-address-is-255-characters-exactly-so-it-should-be-invalid-and-im-going-to-add-some-more-words' +
      #   '-here-to-increase-the-lenght-blah-blah-blah-blah-bl.org',
      'missing-at-sign.net',
      'unbracketed-IP@127.0.0.1',
      'invalid-ip@127.0.0.1.26',
      'another-invalid-ip@127.0.0.256',
      'IP-and-port@127.0.0.1:25'
    ]
  end

  def test_valid_emails
    valid_emails.each { |email| assert TestUser.new(:email => email).valid? }
  end

  def test_invalid_emails
    invalid_emails.each { |email| refute TestUser.new(:email => email).valid? }
  end

  def test_valid_emails_with_rfc_compliant
    rfc_valid_emails.each { |email| assert TestUserWithRfcCompliantEmail.new(:email => email).valid? }
  end

  def test_invalid_emails_with_rfc_compliant
    rfc_invalid_emails.each { |email| refute TestUserWithRfcCompliantEmail.new(:email => email).valid? }
  end

  def test_default_message_on_error
    test_user = TestUser.new(:email => "invalid_email@")
    refute test_user.valid?
    assert test_user.errors[:email].include?("is invalid")
  end

  def test_custom_message_on_error
    test_user = TestUserWithMessage.new(:email => "invalid_email@")
    refute test_user.valid?
    assert test_user.errors[:email].include?("is not formatted properly")
  end

  def test_nil_email_when_allow_nil_option_is_not_set
    refute TestUser.new(:email => nil).valid?
  end

  def test_nil_email_when_allow_nil_option_is_set_to_true
    assert TestUserAllowsNilToTrue.new(:email => nil).valid?
  end

  def test_nil_email_when_allow_nil_option_is_set_to_false
    refute TestUserAllowsNilToFalse.new(:email => nil).valid?
  end

end
