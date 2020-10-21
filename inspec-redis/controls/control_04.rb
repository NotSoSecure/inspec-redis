control 'redis-04' do
    impact 8.2
    title 'Check if Redis authentication is enabled and if so, check for the password complexity '
    desc 'Redis server must be configured for authenticated access. The defined password must contain at least one letter, at least one number, and be longer than 18 characters.'
    describe file('/usr/local/etc/redis/redis.conf') do
        its('content') { should match(%r{^requirepass}) }
    end
    describe command('cat /usr/local/etc/redis/redis.conf | grep  "^requirepass" | awk \'{print $2}\'') do
        its('stdout') { should match(%r{^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]\{18,\}$}) }
    end
 end
