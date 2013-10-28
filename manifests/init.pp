# Public: Install PhantomJS

class phantomjs(
  $phantomenv_root    = $phantomjs::params::phantomenv_root,
  $phantomenv_user    = $phantomjs::params::phantomenv_user,
  $phantomenv_version = $phantomjs::params::phantomenv_version,
) inherits phantomjs::params {
  if $::osfamily == 'Darwin'{
    include homebrew

    package { 'phantomjs':
      ensure => absent
    }

    file { "${boxen::config::envdir}/phantomenv.sh":
      ensure => absent,
    }

    boxen::env_script { 'phantomjs':
      content  => template('phantomjs/phantomenv.sh.erb'),
      priority => 'higher',
    }
  }

  repository { $phantomenv_root:
    ensure => $phantomenv_version,
    force  => true,
    source => 'wfarr/phantomenv',
    user   => $phantomenv_user,
  }
}
