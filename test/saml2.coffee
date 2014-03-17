_             = require 'underscore'
saml2         = require "#{__dirname}/../index"
assert        = require 'assert'
async         = require 'async'
url           = require 'url'

describe 'saml2', ->

  describe 'xml metadata', ->
    xit 'is valid xml', (done) ->
      assert false
      done()
    xit 'contains expected fields', (done) ->
      assert false
      done()

  # Login
  describe 'login url', ->
    xit 'creates an AuthRequest that is base64 encoded and compressed', (done) ->
      assert false
      done()
    xit 'includes relay URL', (done) ->
      assert false
      done()
    xit 'is configured according to the identity provider', (done) ->
      assert false
      done()

  # Auth Request, before it is compressed and base-64 encoded
  describe 'AuthRequest', ->
    xit 'is valid xml', (done) ->
      assert false
      done()
    xit 'contains expected fields', (done) ->
      assert false
      done()

  describe 'pretty_assertion_attributes', ->
    it 'creates a correct user object', ->
      test_attributes =
        "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress": [ "tuser@example.com" ]
        "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name": [ "Test User" ]
        "http://schemas.xmlsoap.org/claims/Group": [ "Test Group" ]

      expected =
        email: "tuser@example.com"
        name: "Test User"
        group: "Test Group"

      assert.deepEqual saml2.pretty_assertion_attributes(test_attributes), expected

  # Assert
  describe 'assert', ->
    xit 'expects properly formatted XML', (done) ->
      assert false
      done()
    xit 'expects base64 encoded SAMLResponse', (done) ->
      assert false
      done()
    xit 'finds encrypted data in SAMLResponse', (done) ->
      assert false
      done()
    xit 'can decode encrypted data in SAMLResponse', (done) ->
      assert false
      done()
    xit 'fails to decode encrypted data with private key', (done) ->
      assert false
      done()
    xit 'returns claims and their values', (done) ->
      assert false
      done()
    xit 'errors if no claims are found', (done) ->
      assert false
      done()
    xit 'allows claims with single or multiple value(s)', (done) ->
      assert false
      done()
    xit 'does not verify the assertions session ID, by default', (done) ->
      assert false
      done()
    xit 'verifies the assertions session ID, if specified by user', (done) ->
      assert false
      done()
    xit 'verifies the documents signature', (done) ->
      assert false
      done()

  describe 'check_signature', ->
    xit 'verifies document is signed', (done) ->
      assert false
      done()

    # Other tests that *strictly* enforce the signature. For example...
    # - checks that correct part of document is signed
    # - checks that correct part of document is signed with correct signature

  describe 'IdentityProvider', ->
    xit 'validates configuration passed to constructor (urls, certificate)', (done) ->
      assert false
      done()

  describe 'ServiceProvider', ->
    it 'can be constructed', (done) ->
      sp = new saml2.ServiceProvider 'private_key', 'cert'
      done()

    xit 'validates configuration given to constructor (private key, certificate)', (done) ->
      assert false
      done()

    it 'can create login url', (done) ->
      sp = new saml2.ServiceProvider 'private_key', 'cert'
      idp = new saml2.IdentityProvider 'login_url', 'logout_url', 'other_service_cert'

      async.waterfall [
        (cb_wf) => sp.create_login_url idp, 'assert_url', cb_wf
      ], (err, login_url, id) ->
        assert not err?, "Error creating login URL: #{err}"
        parsed_url = url.parse login_url, true
        saml_request = parsed_url.query?.SAMLRequest?
        assert saml_request, 'Could not find SAMLRequest in url query parameters'
        done()

    login_url_errors =
      'assert URL not given':'response1'
      'not HTTPS':'response2'

    _.each login_url_errors, (response_text, error_type) ->
      xit "returns correct 'login_url' error for #{error_type} ", (done) ->
        sp = new saml2.ServiceProvider 'private_key', 'cert'
        idp = new saml2.IdentityProvider 'login_url', 'logout_url', 'other_service_cert'
        assert false
        done()

    xit 'can assert', (done) ->
      sp = new saml2.ServiceProvider 'private_key', 'cert'
      idp = new saml2.IdentityProvider 'login_url', 'logout_url', 'other_service_cert'

      async.waterfall [
        (cb_wf) => sp.create_login_url idp, request_body, cb_wf
      ], (err, user) ->
        assert not err?, "Error asserting: #{err}"
        done()

    assert_errors =
      'error1' : 'response1'

    _.each assert_errors, (response_text, error_type) ->
      xit "returns correct 'assert' error for #{error_type} ", (done) ->
        assert false
        done()
