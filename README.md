# Torutsume

[![Build Status](https://travis-ci.org/yuya-takeyama/torutsume.png?branch=develop)](https://travis-ci.org/yuya-takeyama/torutsume)
[![Coverage Status](https://coveralls.io/repos/yuya-takeyama/torutsume/badge.png?branch=develop)](https://coveralls.io/r/yuya-takeyama/torutsume?branch=develop)
[![Analytics](https://ga-beacon.appspot.com/UA-12392004-6/yuya-takeyama/torutsume)](https://github.com/igrigorik/ga-beacon)

Web-based proofreading tool

## Installation

    $ git clone https://github.com/yuya-takeyama/torutsume.git
    $ cd torutsume
    $ bundle
    $ bundle exec rake db:migrate

### Write your config

This requires [Facebook developer account](https://developers.facebook.com)

    $ cp config/application.example.yml config/application.yml
    $ vi config/application.yml

### Run

And then run as a Rack application

    $ bundle exec rackup

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

Yuya Takeyama [yuyat.jp](http://yuyat.jp)
