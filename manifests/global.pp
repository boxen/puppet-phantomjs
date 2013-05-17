# Public: Set the global default phantomjs version
#
# Usage: phantomjs::global { '1.9.0': }
class phantomjs::global($version) {
  require phantomjs
  require join(['phantomjs', join(split($version, '[.]'), '_')], '::')

  file { "${phantomjs::phantomenv_root}/version":
    content => "${version}\n",
    replace => true,
  }
}
