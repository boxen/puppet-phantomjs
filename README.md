# PhantomJS Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-phantomjs.png?branch=master)](https://travis-ci.org/boxen/puppet-phantomjs)

Install [PhantomJS](http://phantomjs.org/) a headless WebKit scriptable with a JavaScript API.

## Usage

```puppet
include phantomjs
```

## Required Puppet Modules

* `boxen`
* `homebrew` (only on OS X)
* `repository`
* `stdlib`

Then write some code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
