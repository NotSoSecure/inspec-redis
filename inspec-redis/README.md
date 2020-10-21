## Example Redis Server Baseline

Chef InSpec profile for runing the below compliance checks on a Redis Server:

1. The Redis Configuration file should be owned by root and only root user should have write privileges. 
1. The Redis server should only bind to the localhost.
1. The Redis server should not run on the default port (6379)
1. The Redis server should have authentication enabled and if so, the password must contain at least one letter, at least one number, and be longer than 18 charaters.
1. The Redis server must disable dangerous commands.

