class osx_notify::setup {
  package { 'terminal-notifier':
    ensure   => 'latest',
    provider => 'gem',
  }
}
