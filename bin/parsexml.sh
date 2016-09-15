#!/bin/bash

# set the scan type to Full and very deep ultimate
export scanType='"74db13d6-7489-11df-91b9-002264764cea"'
while read line; do
  serverName="$(echo $line | awk -v FS="(</make_unique>|</name>)" '{print $2}')"
  echo "Processing server: $serverName"
  echo "Creating target for: $line"
  # create target host and save the target id returned
  target_cmd="omp -u admin -w openvas --xml='<create_target>${line}</create_target>'"
  target_res="$(eval $target_cmd)"
  targetId="$(echo $target_res | awk -v FS="(id=|status)" '{print $2}')"
  echo "Target id is: $targetId"
  echo "Creating the scanner task for: $targetId"
  # create the scanner task linking the target host to the scan config and save the task id returned 
  task_cmd="omp -u admin -w openvas --xml='<create_task><name>Openports -scan of ${serverName}</name><comment>Deep scan on Server ${serverName}</comment><config id=${scanType}/><target id=${targetId}/></create_task>'"
  task_res="$(eval $task_cmd)"
  taskId="$(echo $task_res | awk -v FS="(id=|status)" '{print $2}')"
  echo "Task id is: $taskId"
  echo "Starting scan for: $taskId"
  # start the scanning process
  start_cmd="omp -u admin -w openvas --xml='<start_task task_id=${taskId}/>'"
  start_res="$(eval $start_cmd)"
  echo "Start response: $start_res"
done