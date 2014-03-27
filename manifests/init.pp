# Public: Install PhantomJS

class phantomjs(
  $phantomenv_root       = $phantomjs::params::phantomenv_root,
  $phantomenv_user       = $phantomjs::params::phantomenv_user,
  $phantomenv_version    = $phantomjs::params::phantomenv_version,
  $phantomenv_repository = $phantomjs::params::phantomenv_repository,
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
    source => $phantomenv_repository,
    user   => $phantomenv_user,
  }
}
