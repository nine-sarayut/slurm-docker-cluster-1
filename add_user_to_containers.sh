#!/bin/bash

# List of container names
containers=("slurmctld" "c1" "c2" "c3" "c4" "c5")

# Loop through the container names and add the user
for container in "${containers[@]}"; do
  echo "Adding user sw7v6 to $container"
  docker exec -it $container groupadd -g 100475781 sw7v6
  docker exec -it $container useradd -u 100475781 -g 100475781 -m -s /bin/bash sw7v6
  docker exec -it $container chown sw7v6:sw7v6 /home/sw7v6/
  # docker exec -it $container usermod -aG video sw7v6
done