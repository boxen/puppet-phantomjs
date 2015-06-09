# Public: Set the global default phantomjs version
#
# Usage: phantomjs::global { '1.9.8': }
define phantomjs::global {
  require phantomjs
  ensure_resource('phantomjs::version', $title)

  file { "${phantomjs::phantomenv_root}/version":
    content => "${title}\n",
    replace => true,
  }
}
