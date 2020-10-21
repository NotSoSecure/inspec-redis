control 'redis-03' do
    impact 6.5
    title 'Check if Redis Server is using the default port 6379'
    desc 'The Redis server must be configured such that it does not run on the default port 6379. '
    describe file('/usr/local/etc/redis/redis.conf') do
        its('content') { should_not match(%r{^port\ 6379}) }
        its('content') { should_not match(%r{^port\ 0}) }
        end
    describe port(6379) do
    it { should_not be_listening }
    end
end
