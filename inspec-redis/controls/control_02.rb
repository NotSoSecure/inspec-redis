control 'redis-02' do
    impact 7.5
    title 'Check if redis is bound to localhost'
    desc 'The Redis server must be bound to localhost. The redis configuration should not allow connections from other remote connections '

    describe file('/usr/local/etc/redis/redis.conf') do
        its('content') { should match 'bind 127.0.0.1' }
    end    
end
