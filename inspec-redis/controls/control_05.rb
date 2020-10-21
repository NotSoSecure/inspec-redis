control 'redis-05' do
    impact 6.7
    title 'Check if dangerous commands are disabled'
    desc ' The redis server should be configured to disable all dangerous commands i.e BGREWRITEAOF, BGSAVE, CONFIG, DEBUG, DEL, FLUSHALL, FLUSHDB, KEYS, PEXPIRE, RENAME, SAVE, SHUTDOWN, SPOP, SREM '
    cmds = ["BGREWRITEAOF", "BGSAVE", "CONFIG", "DEBUG", "DEL", "FLUSHALL", "FLUSHDB", "KEYS", "PEXPIRE", "RENAME", "SAVE", "SHUTDOWN", "SPOP", "SREM"] 
    #cmds = ["CONFIG", "DEBUG"]
    cmds.each do |cmd|
        describe file('/usr/local/etc/redis/redis.conf') do
            its('content') { should match "rename-command #{cmd} \"\"" }
        end
    end     
end
