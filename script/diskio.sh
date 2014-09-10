   #!/bin/bash
     uprio=0
     upwio=0
     #while true
     # do
        rio=$(grep '\bsda\b' /proc/diskstats | awk '{print $4}')
        wio=$(grep '\bsda\b' /proc/diskstats | awk '{print $8}')
        Real_rio=$[ $rio - $uprio ]
        Real_wio=$[ $wio - $upwio ]
        Iops=$[$Real_rio + $Real_wio]
        echo "Iops:$Iops   Read : $Real_rio   Write: $Real_wio"
        uprio=$rio
        upwio=$wio
      #  sleep 1
     # done
