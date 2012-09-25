class mashupapp {

    include nodejs

    file {
		"/opt/jsapp":
			ensure => "directory",
			owner => "vagrant";
        "/etc/apache2/sites-enabled/000-default":
            ensure => absent,
            require => Package["apache2"];
        "/etc/apache2/sites-available/mashupapp":
            ensure => present,
            source => "puppet:///modules/mashupapp/vhost",
            require => Package["apache2"];
        "/etc/apache2/sites-enabled/mashupapp":
            ensure => link,
            target => "/etc/apache2/sites-available/mashupapp",
            require => Package["apache2"],
            notify => Service["apache2"];
    }
}