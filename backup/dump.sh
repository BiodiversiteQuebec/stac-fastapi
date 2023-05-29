# Archive path
ARCHIVE_PATH="/backup"

# Archive filename
ARCHIVE_FILE="catalog-db_`date +%F_%H-%M-%S`.tar.gz"

# Archives older than this will be deleted
ARCHIVE_DAYS="30"

# Set or override config variables here
if [ -e $SYSCONFIG ]; then
        . $SYSCONFIG
fi

# Change working directory
cd $ARCHIVE_PATH



# Get all of the databases
# Use Nice to dump the database
#sudo su postgres
nice pg_dump -d catalogdb > catalogdb.sql

# Use Nice to create a tar compressed with bzip2
nice tar -zcvf $ARCHIVE_FILE *.sql

# Remove the SQL files
nice rm -rf *.sql

# Remove old archive files
nice find *.tar.gz -mtime +$ARCHIVE_DAYS -exec rm {} \;

