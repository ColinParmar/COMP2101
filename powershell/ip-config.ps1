Get-WmiObject -Class Win32_NetworkAdapterConfiguration |
Where-Object {$_.IPEnabled} |
Select-Object -Property Index,
                        @{n="Adapter Description";e={$_.Description}},
                        @{n="IP Address(es)";e={$_.IPAddress}},
                        @{n="Subnet Mask(s)";e={$_.IPSubnet}},
                        @{n="DNS Domain Name";e={$_.DNSDomain}},
                        @{n="DNS Server";e={$_.DNSServerSearchOrder}} |
Format-Table