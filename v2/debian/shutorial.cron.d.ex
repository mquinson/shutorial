#
# Regular cron jobs for the shutorial package.
#
0 4	* * *	root	[ -x /usr/bin/shutorial_maintenance ] && /usr/bin/shutorial_maintenance
