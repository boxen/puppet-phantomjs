# Set a directory's default phantomjs version via phantomenv.
# Automatically ensures that phantomjs version is installed via phantomenv.
#
# Usage:
#
#     phantomjs::local { '/path/to/a/thing': version => '1.9.3-p194' }

define phantomjs::local($version = undef, $ensure = present) {
  validate_re($ensure, '^(present|absent)$',
    "Phantomjs::Local[${name}] ensure must be present|absent, is ${ensure}")

  validate_absolute_path($name)

  if $ensure == present {
    $klass = join(['phantomjs', join(split($version, '[.]'), '_')], '::')
    require $klass
  }

  file { "${name}/.phantom-version":
    ensure  => $ensure,
    content => "${version}\n",
    replace => true,
  }
}
