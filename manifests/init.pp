define osx_notify (
  $message,
  $subject = $name,
  $url = false,
  $refreshonly = false,
  $schedule = false
  ) {

  if versioncmp($::macosx_productversion_major, '10.8') >= 0 {
    include osx_notify::setup

    # Notification must be sent to the logged in user, let's take the first one.
    # Todo: Run exec for all users.

    $first_user = split($::users_online, ',')

    exec { "osx_notify-${name}":
      command     => "terminal-notifier -title \"${subject}\" -message \"${message}\" -open $url",
      path        => ['/usr/bin', '/bin'],
      refreshonly => $refreshonly,
      require     => Package['terminal-notifier'],
      schedule    => $schedule,
      user        => $first_user,
    }
  } else {
    notify { $name:
      message  => "${subject}: ${message}",
      schedule => $schedule
    }
  }
}
