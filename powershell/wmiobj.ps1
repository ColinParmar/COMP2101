"================System Hardware Description==================" 
get-wmiobject -Class win32_ComputerSystem | Select Manufacturer,Model | Format-table

"================Info of Operating System===================="
get-wmiobject -Class win32_operatingsystem | select Name,Version | Format-Table

"==================Processor Info======================"
get-wmiobject -Class win32_processor | select Description,MaxClockSpeed,NumberOfCores,L1CacheSize,L2CacheSize,L3CacheSize


"=====================Summary of the Installed RAM========================"
$totalcapacity = 0
get-wmiobject -class win32_physicalmemory |
foreach {
 new-object -TypeName psobject -Property @{
 Manufacturer = $_.manufacturer
 "Size(MB)" = $_.capacity/1mb
 Bank = $_.banklabel
 Slot = $_.devicelocator
 Descprition = $_.description
 }
 $totalcapacity += $_.capacity/1mb
} |
ft -auto Manufacturer, "Size(MB)", Bank, Slot, Description
"Total RAM: ${totalcapacity}MB"

"================Summary of Physical Disk Drives=============="
$diskdrives = Get-CIMInstance CIM_diskdrive
 foreach ($disk in $diskdrives) { 
  $partitions = $disk|
   get-cimassociatedinstance -resultclassname CIM_diskpartition 
   foreach ($partition in $partitions) { 
     $logicaldisks = $partition | 
      get-cimassociatedinstance -resultclassname CIM_logicaldisk 
        foreach ($logicaldisk in $logicaldisks) { 
          new-object -typename psobject -property @{Manufacturer=$disk.Manufacturer 
                                                    Location=$partition.deviceid 
                                                    Drive=$logicaldisk.deviceid 
                                                    “Size(GB)”=$logicaldisk.size / 1gb -as [int]
                                                    Model=$disk.model
                                                    "FreeSpace(GB)"=$logicaldisk.freespace / 1gb -as [int] 
                                                    "PrecentageFree"=($logicaldisk.freespace / $logicaldisk.size) * 100 -as [int]
                                                    } | format-table
                                                 } 
                                         } 
                                  }

"========================Network Adapter Configuration=================="
Get-WmiObject -Class Win32_NetworkAdapterConfiguration |
Where-Object {$_.IPEnabled} |
Select-Object -Property Index,
                        @{n="Adapter Description";e={$_.Description}},
                        @{n="IP Address(es)";e={$_.IPAddress}},
                        @{n="Subnet Mask(s)";e={$_.IPSubnet}},
                        @{n="DNS Domain Name";e={$_.DNSDomain}},
                        @{n="DNS Server";e={$_.DNSServerSearchOrder}} |
Format-Table

"========================Video Card Info=========================" 
Get-WmiObject Win32_VideoController | Select Name, Description, VideoModeDescription