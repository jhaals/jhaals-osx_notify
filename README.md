OS X Notify
------
This module brings one resource type that let you send notifications to the Notification Center in Mac OS X Mountain Lion.

osx_notify uses the cli created by Eloy Durán https://github.com/alloy/terminal-notifier

Usage example
-----

    include osx_notify

    osx_notify { 'sublime_notify':
      subject     => 'New Application',
      message     => 'Sublime2 has been installed to your machine!',
      refreshonly => true
    }

    package { 'Sublime2':
      ensure   => installed,
      provider => appdmg,
      source   => 'http://apps.example.com/sublime.dmg',
      notify   => Osx_notify['sublime_notify']
    }
