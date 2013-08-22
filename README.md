# PhantomJS Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-phantomjs.png?branch=master)](https://travis-ci.org/boxen/puppet-phantomjs)

Install [PhantomJS](http://phantomjs.org/) a headless WebKit scriptable with a JavaScript API. This module uses [Phantomenv](https://github.com/wfarr/phantomenv) to manage versions.

## Usage

```puppet
# Installs Phantomenv for PhantomJS version management
include phantomjs

# Install PhantomJS version 1.9.0
phantomjs::version { '1.9.0': }

# The two commands above in one line
include phantomjs::1_9_0

# Sets local version of PhantomJS, writes .phantomenv file to directory specified (version should be installed already)
phantomjs::local { '/path/to/whatever':
  version => '1.9.0'
}

# Set the global version of PhantomJS (version should be installed already)
phantomjs::global { '1.9.0': }
```

## Required Puppet Modules

* `boxen`
* `homebrew` (only on OS X)
* `repository`
* `stdlib`

Then write some code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
