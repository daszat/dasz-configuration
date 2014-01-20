node 'jenkins.dasz.at' {
  class {
    'dasz::defaults':
      location         => tech21,
      force_nullmailer => true;

    'dasz::snips::jenkins':
      url => 'http://jenkins:8080';
  }

  apt::repository { 'jenkins':
    url        => 'http://pkg.jenkins-ci.org/debian',
    distro     => '',
    repository => 'binary/',
    key        => 'D50582E6',
    key_url    => 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key';
  }

  munin::plugin { 'zetbox_exceptions_ini50':
    source        => 'puppet:///modules/dasz/munin/zetbox_exceptions_',
    config_source => 'puppet:///modules/dasz/munin/zetbox_exceptions_ini50';
  }

  # required for the zetbox_ plugins
  # package { "libwww-perl": ensure => installed }

  dasz::zetbox::monitor { 'zetbox-nh':
    url => "http://jenkins:7007/zetbox/develop/PerfMon.facade";
  #    'zetbox_zetbox-ef':
  #      url => "http://build01-win7/jenkins/zetbox-develop/PerfMon.facade";
  }

  package { 'postgresql-client-8.4': ensure => present; }
}
