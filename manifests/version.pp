# Public: Install a PhantomJS version with phantomenv
#
# Usage: phantomjs::version { '1.2.3': }

define phantomjs::version($ensure = present) {
  require phantomjs

  validate_re($ensure, '^(present|absent)$',
    "Phantomjs::Version[${name}] ensure must be present|absent, is ${ensure}")

  $dest = "${phantomjs::phantomenv_root}/versions/${name}"

  if $ensure == absent {
    file { $dest:
      ensure => absent,
      force  => true,
    }
  } else {
    exec { "phantomenv install ${name}":
      command  => "${phantomjs::phantomenv_root}/bin/phantomenv install ${name}",
      creates  => $dest,
      provider => shell,
      user     => $phantomjs::phantomenv_user
    }

    Exec["phantomenv install ${name}"] {
      environment +> "PHANTOMENV_ROOT=${phantomjs::phantomenv_root}"
    }
  }
}
