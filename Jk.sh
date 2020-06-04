echo ########search metasploit########
 cd metasploit-framework
echo ########start database for metasploit########
pg_ctl -D $PREFIX/var/lib/postgresql start
echo ########start metasploit framework########
