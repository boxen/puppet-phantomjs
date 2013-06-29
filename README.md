# PhantomJS Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-phantomjs.png?branch=master)](https://travis-ci.org/boxen/puppet-phantomjs)

## Usage

```puppet
include phantomjs

phantomjs::version { '1.9.0': }

include phantomjs::1_9_0

phantomjs::local { '/path/to/whatever':
  version => '1.9.0'
}
```

## Required Puppet Modules

* `boxen`
* `homebrew` (only on OS X)
* `repository`
* `stdlib`
