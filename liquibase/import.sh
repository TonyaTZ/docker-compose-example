#!/bin/sh

FILE="changelog.xml"

/bin/cat <<EOM >$FILE
<?xml version="1.0" encoding="UTF-8"?>
<databaseChangeLog
        xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
        http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.1.xsd">
    <changeSet author="atolbakova" id="adventure-setup">
        <sqlFile dbms="mysql"
                 path="./schema.sql"
                 relativeToChangelogFile="true"
                 splitStatements="true"
                 stripComments="true"/>
EOM
FILES=`ls ./data`
for f in $FILES
do
  filename="${f%.*}"
  echo "        <loadData file=\"./data/$f\" tableName=\"$filename\" encoding=\"UTF-16LE\" separator=\"   \"/>" >> $FILE
done
/bin/cat << EOM >>$FILE
    </changeSet>
</databaseChangeLog>
EOM