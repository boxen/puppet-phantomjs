# Public: Set the global default phantomjs version
#
# Usage: phantomjs::global { '1.9.0': }
define phantomjs::global($version = $title) {
  require phantomjs
  $klass = join(['phantomjs', join(split($version, '[.]'), '_')], '::')
  require $klass

  file { "${phantomjs::phantomenv_root}/version":
    content => "${version}\n",
    replace => true,
  }
}
