### knock

[![Gem Version](https://badge.fury.io/rb/knock.svg)](http://badge.fury.io/rb/knock)
[![Build Status](https://travis-ci.org/nsarno/knock.svg)](https://travis-ci.org/nsarno/knock)
[![Code Climate](https://codeclimate.com/github/nsarno/knock/badges/gpa.svg)](https://codeclimate.com/github/nsarno/knock)

Seamless JWT authentication for Rails API

### Description

Knock is an authentication solution for Rails API-only application based on JSON Web Tokens.

#### Installation

Add this line to your application's Gemfile:

```ruby
gem 'knock', github: 'ipoval/knock'
bundle install
```

#### Requirements

```ruby
class User < ActiveRecord::Base
  has_secure_password
end
```

Using `has_secure_password` is recommended, but you don't have to as long as your user model implements an `authenticate` instance method with the same behavior.

#### Usage

Include the `Knock::Authenticable` module in your `ApplicationController`

```ruby
class ApplicationController < ActionController::API
  include Knock::Authenticable
end
```
