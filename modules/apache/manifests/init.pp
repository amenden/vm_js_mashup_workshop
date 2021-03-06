class apache {
    Exec['apt-get update'] -> Package <| |>

  package {
    "apache2":
        ensure => present;
  } ->
  exec {
    "apache2 mod rewrite":
        command => "/usr/sbin/a2enmod rewrite",
        notify => Service["apache2"],
        creates => "/etc/apache2/mods-enabled/rewrite.load";
  }

  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }
}
