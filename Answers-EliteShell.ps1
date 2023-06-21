                                                                            # EliteShell Answers ##

# ------------------------------------------------------------------------------------------------#

# Windows General #

    # Windows General #1 (hostname)

    hostname

    # Windows General #2 (boot time)

    systeminfo | find 'Boot Time'

    # Windows General #3 (env)

    dir env:

    # Windows General #4 (cpu)

    Get-Process | Where-Object { $_.CPU -gt 20 }

    #Windows General #5 (disk space)

    Get-PSDrive C

    # Windows General #6 (serial number)

    Get-WmiObject win32_bios | Select-Object -ExpandProperty SerialNumber

# ------------------------------------------------------------------------------------------------#

# Windows Registry #

    # Windows Registry #1 (path)

    Set-Location -path HKLM:SOFTWARE

    # Windows Registry #2 (root keys)

    Get-PSDrive -PSProvider 'Registry' | Select-Object -Property Name, Root

# ------------------------------------------------------------------------------------------------#

# Active Directory #

# ------------------------------------------------------------------------------------------------#

# Networking #

    # Networking #1 (ip address)

    ipconfig /all

    # Networking #2 (ip / dns)

    ipconfig /displaydns

    # Networking #3 (ip / dns)

    ipconfig /flushdns

    # Networking #4 (change ip)

    ipconfig /renew
    
    # Networking #5 (dhcp / dns)

    ipconfig /registerdns

    # Networking #6 (ports)

    Get-NetTCPConnection

    # Networking #7 (traceroute)

    Test-NetConnection -ComputerName GitHub.com -TraceRoute

    # Networking #8 (wireless network profiles)

    netsh wlan show profiles

# ------------------------------------------------------------------------------------------------#

# DHCP + DNS #

    # DHCP #1 (server)

    Add-DhcpServerV4Scope -name 'test' -StartRange 172.16.0.100 -Endrange 172.16.0.200 -SubnetMask 255.255.255.0 -State Active

    # DHCP #2 (scope)
    
    Add-DhcpServerV4Scope -name 'test' -StartRange 172.16.0.100 -Endrange 172.16.0.200 -SubnetMask 255.255.255.0 -State Active

    # DNS #1 (check install)

    Get-WindowsFeature -Name *DNS*

    # DNS #2

    Install-WindowsFeature -Name DNS -IncludeManagementTools

    # DNS #3 (forward lookup zone)

    Add-DnsServerPrimaryZone -Name Eliteshell.org -Zonefile Eliteshell.org.DNS -DynamicUpdate NonsecureAndSecure
