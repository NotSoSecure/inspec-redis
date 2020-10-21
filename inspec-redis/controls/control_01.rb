control 'redis-01' do 
    impact 7.0
    title 'Check redis.conf file ownership & permissions'
    desc 'The redis configuration file should be owned by root, root should have write access while others should have read-only access. '

    describe file('/usr/local/etc/redis/redis.conf') do 
        its('owner') { should eq "redis_admin" }
        its('group') { should eq "redis_admin" }
        its('mode') { should cmp '0600' }
    end

end
