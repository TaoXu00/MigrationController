##!/bin/bash
 mkdir log
 mkdir lookUpTables
 echo "start program..."
 cd plot
 chmod +x plot.py
 cd ..
 mvn verify
 mvn exec:java -Dexec.mainClass=Application -Dexec.cleanupDaemonThreads=false