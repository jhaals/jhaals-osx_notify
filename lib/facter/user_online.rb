# Outputs all users online separated by comma
# Facts Provided
#   users_online => jhaals,testing

Facter.add('users_online') do
    confine :kernel => 'Darwin'
    setcode do
        Facter::Util::Resolution.exec('users').gsub(' ', ',')
    end
end

# Not much love behind this baby
Facter.add('users_online') do
    confine :kernel => 'Windows'
    setcode do
        ENV['USERNAME']
    end
end
