##!/bin/bash
 mkdir log
 mkdir lookUpTables
 echo "start program..."
 mvn verify
 mvn exec:java -Dexec.mainClass=Application -Dexec.cleanupDaemonThreads=false