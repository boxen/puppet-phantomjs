# Public: Configuration for PhantomJS module

class phantomjs::params {
  case $::osfamily {
    Darwin: {
      include boxen::config

      $phantomenv_user = $::boxen_user
      $phantomenv_root = "${boxen::config::home}/phantomenv"
    }

    default: {
      $phantomenv_user = 'root'
      $phantomenv_root = '/usr/local/share/phantomenv'
    }
  }

  $phantomenv_repository = 'wfarr/phantomenv'
  $phantomenv_version    = 'v0.0.8'
}
