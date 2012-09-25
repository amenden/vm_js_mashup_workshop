class environment {
    exec {
        'apt-get update':
            command => '/usr/bin/apt-get update'
    } ->
    package {
        "curl":
            ensure => present;
        "git":
            ensure => "present";
        "vim":
            ensure => "present";
    }
    include apache
    include mashupapp
}

include environment

