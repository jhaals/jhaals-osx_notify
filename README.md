OS X Notify
------
[![Build Status](https://travis-ci.org/JHaals/jhaals-osx_notify.png?branch=master)](https://travis-ci.org/JHaals/jhaals-osx_notify)

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


Send notifications on schedule


    include osx_notify

    schedule { 'cake_schedule':
      range   => '12:00 - 13:00',
      weekday => 'Friday',
    }

    osx_notify { 'cake_notice':
      subject     => 'Cake',
      message     => "There's cake in the cafeteria, grab some!",
      refreshonly => false,
      url         => 'http://en.wikipedia.org/wiki/Cake',
      schedule    => 'cake_schedule',
    }


This is how it looks:

![Example image](http://haals.se/notification_example.png)
