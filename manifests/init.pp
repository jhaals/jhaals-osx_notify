define osx_notify($message, $subject = $name, $refreshonly = false ) {

  if versioncmp($::macosx_productversion_major, '10.8') >= 0 {
    include osx_notify::setup

    exec { "osx_notify-${name}":
      command     => "terminal-notifier -title \"${subject}\" -message \"${message}\"",
      path        => ['/usr/bin', '/bin'],
      refreshonly => $refreshonly,
      require     => Package['terminal-notifier'],
    }
  } else {
    notify { $name:
      message => "${subject}: ${message}",
    }
  }
}
