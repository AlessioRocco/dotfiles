# Restart PostgreSQL

# Sometimes PostgreSQL hangs on boot and, to make it run again,
# I've to stop the brew service, remove the postmaster.pid,
# and start the server again.
#
# This helper function runs all the needed commands.

function restart_postgresql
    brew services stop postgresql

    if test -e /opt/homebrew/var/postgres/postmaster.pid
        rm /opt/homebrew/var/postgres/postmaster.pid
    end

    brew services start postgresql
end
