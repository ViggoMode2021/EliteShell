 #Import-Module ActiveDirectory

Add-Type -AssemblyName System.Windows.Forms #Add .NET framework for Forms

Add-Type -AssemblyName PresentationCore,PresentationFramework #Add .NET framework for Presentation

$Date = Get-Date -format "MM-dd-yy" # Get date

$OS = (Get-WMIObject win32_operatingsystem) | Select-Object -expand Name | Out-String # Get OS

$OS = $OS.Replace("|C:\WINDOWS|\Device\Harddisk0\Partition3", "") # Remove superflous details

$Screen_Resolution = (Get-WmiObject -Class Win32_VideoController).VideoModeDescription; # Get screen res

$Architecture = $Env:PROCESSOR_ARCHITECTURE # Get processor type

$PowerShell_Version = (Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\PowerShell\3\PowerShellEngine -Name 'PowerShellVersion').PowerShellVersion # Find PS version

$ErrorActionPreference = 'SilentlyContinue' 

$Script_Or_Executable_Name = $MyInvocation.InvocationName # Find name of current script or executable

if($Screen_Resolution -ne "1925 x 1080 x 4294967296 colors"){

$Screen_Resolution = (Get-WmiObject -Class Win32_VideoController).VideoModeDescription;

}

if($Script_Or_Executable_Name -notmatch ".ps1"){

$Last_Accessed_Time = Get-ChildItem -Path ${env:ProgramFiles(x86)} -Filter "EliteShell.exe" -Recurse |
Get-ItemProperty | select lastaccesstime | Select-Object -expand lastaccesstime

}

else{

$Last_Accessed_Time = Get-ChildItem -Path $Script_Or_Executable_Name -Recurse |
Get-ItemProperty | select lastaccesstime | Select-Object -expand lastaccesstime

}

$DesktopPath = [Environment]::GetFolderPath("Desktop")
$urlimage = "https://raw.githubusercontent.com/ViggoMode2021/PowerShellScripts/main/LearnWindowsServerAndPowerShell/EliteShell-Logo-V1.png"
$pathimage = "$DesktopPath\EliteShell-Logo-V1.png"
Invoke-WebRequest $urlimage -OutFile $pathimage

$EliteShell_Logo = New-Object System.Windows.Forms.PictureBox
$EliteShell_Logo.Location = New-Object System.Drawing.Point(1700,750)
$EliteShell_Logo.Width =  $logo.Size.Width;
$EliteShell_Logo.Height =  $logo.Size.Height;
$logo = [System.Drawing.Image]::FromFile("$pathimage")
$EliteShell_Logo.Image = $logo

$Desktop_Path = [Environment]::GetFolderPath("Desktop")

$global:Game_Score_File = $null

$Form = New-Object System.Windows.Forms.Form
$Form.StartPosition = 'CenterScreen'

$Form.Text = "EleetShell - Practice Windows, Windows Server, PowerShell! and more! | No game score file currently selected"

$Form.BackColor = "White"

$Form.Font = 'Verdana,11,style=Bold'

$File_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem  # Main File dropdown
$Windows_General_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem # Main Windows General dropdown
$Windows_Registry_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem # Main Networking dropdown
$Active_Directory_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem  # Main Active Directory dropdown
$DHCP_DNS_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem  # Main DHCP DNS General dropdown
$Networking_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem # Main Networking dropdown

$Menu_Bar = New-Object System.Windows.Forms.MenuStrip
$New_Game_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem
$Load_Game_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem
$View_Score_And_Stats_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem
$View_My_System_Information_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem
$View_EliteShell_Answers_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem
$View_README_Strip_Menu_Item = New-Object System.Windows.Forms.ToolStripMenuItem
$Windows_General_Strip_Menu_Item_Learn = New-Object System.Windows.Forms.ToolStripMenuItem

$Windows_General_Strip_Menu_Item_2 = New-Object System.Windows.Forms.ToolStripMenuItem
$Windows_General_Strip_Menu_Item_3 = New-Object System.Windows.Forms.ToolStripMenuItem
$Windows_General_Strip_Menu_Item_4 = New-Object System.Windows.Forms.ToolStripMenuItem
$Windows_General_Strip_Menu_Item_5 = New-Object System.Windows.Forms.ToolStripMenuItem
$Windows_General_Strip_Menu_Item_6 = New-Object System.Windows.Forms.ToolStripMenuItem

$DHCP_DNS_Strip_Menu_Item_Practice = New-Object System.Windows.Forms.ToolStripMenuItem
$DHCP_DNS_Strip_Menu_Item_Practice_2 = New-Object System.Windows.Forms.ToolStripMenuItem
$DHCP_DNS_Strip_Menu_Item_Practice_3 = New-Object System.Windows.Forms.ToolStripMenuItem
$DHCP_DNS_Strip_Menu_Item_Practice_4 = New-Object System.Windows.Forms.ToolStripMenuItem
$DHCP_DNS_Strip_Menu_Item_Practice_5 = New-Object System.Windows.Forms.ToolStripMenuItem

$Networking_Strip_Menu_Item_Practice = New-Object System.Windows.Forms.ToolStripMenuItem
$Networking_Strip_Menu_Item_Practice_2 = New-Object System.Windows.Forms.ToolStripMenuItem
$Networking_Strip_Menu_Item_Practice_3 = New-Object System.Windows.Forms.ToolStripMenuItem
$Networking_Strip_Menu_Item_Practice_4 = New-Object System.Windows.Forms.ToolStripMenuItem
$Networking_Strip_Menu_Item_Practice_5 = New-Object System.Windows.Forms.ToolStripMenuItem
$Networking_Strip_Menu_Item_Practice_6 = New-Object System.Windows.Forms.ToolStripMenuItem
$Networking_Strip_Menu_Item_Practice_7 = New-Object System.Windows.Forms.ToolStripMenuItem
$Networking_Strip_Menu_Item_Practice_8 = New-Object System.Windows.Forms.ToolStripMenuItem
$Networking_Strip_Menu_Item_Practice_9 = New-Object System.Windows.Forms.ToolStripMenuItem
$Networking_Strip_Menu_Item_Practice_10 = New-Object System.Windows.Forms.ToolStripMenuItem

$Windows_Registry_Strip_Menu_Item_Practice = New-Object System.Windows.Forms.ToolStripMenuItem
$Windows_Registry_Strip_Menu_Item_Practice_2 = New-Object System.Windows.Forms.ToolStripMenuItem

$Score_Box = New-Object System.Windows.Forms.GroupBox
$Score_Box.Location = New-Object System.Drawing.Size(1540,50)
$Score_Box.Size = New-Object System.Drawing.Size(400,400)
$Score_Box.Text = "Current Stats:"

$Store_Box = New-Object System.Windows.Forms.GroupBox
$Store_Box.Location = New-Object System.Drawing.Size(25,700)
$Store_Box.Size = New-Object System.Drawing.Size(350,900)
$Store_Box.Text = "Buy Scripts:"
$Store_Box.ForeColor = 'Blue'
$Store_Box.Font = "Times,12,style=Bold"

$Script_Dropdown = New-Object System.Windows.Forms.ComboBox
$Script_Dropdown.Text = “Update-Windows-Version(10)”
$Script_Dropdown.Autosize = $True
$Script_Dropdown.Width = "300"
$Script_Dropdown.Location = New-Object System.Drawing.Point(30,725)
$Script_Dropdown.Font = ‘Microsoft Sans Serif,12’
@(‘AD-Password-Generator(10)’,’Update-Windows-Version(10)’,’Disable-and-Enable-AD-Users(25)’) | ForEach-Object {[void] $Script_Dropdown.Items.Add($_)}

function Buy_Scripts{

$Script_Name=$Script_Dropdown.SelectedItem

$Price = $Script_Name.Substring($Script_Name.Length-4)

$Price = $Price.Replace("(","")

$Price = $Price.Replace(")","")

$Price = [int]$Price

$Separator = "()"

$Selected_Script = $Script_Name.split($Separator)

$Selected_Script = $Selected_Script.Replace("$Price","")

$PS1 = ".ps1"

$Selected_Script = "$Selected_Script$PS1"

$Selected_Script =  $Selected_Script -Replace "\s", ""

if($Selected_Script -eq ".ps1" -and $Script_Dropdown.Text -eq “Update-Windows-Version(10)”){

$MessageBoxTitle = "Please select a script."

$MessageBoxBody = "Please select a script from the dropdown."

$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)
return

}

$Total_Score = [int]$Total_Score

if($Total_Score -lt $Price){

$MessageBoxTitle = "Not enough points to purchase script."

$MessageBoxBody = "You currently have $Total_Score and the script costs $Price."

$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

return 

}

if (Test-Path "$DesktopPath\EliteShell-Prize-Scripts") {
   
	if (Test-Path "$DesktopPath\EliteShell-Prize-Scripts\$Selected_Script"){
	
	$MessageBoxTitle = "$Selected_Script already purchased."

	$MessageBoxBody = "$Selected_Script already has been purchased and is located in the 'EliteShell-Prize-Scripts' directory."

	$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconWarning)

	return

	}

	else{

	$MessageBoxTitle = "$Selected_Script successfully purchased."

	$MessageBoxBody = "$Selected_Script has been purchased and is located in the 'EliteShell-Prize-Scripts' directory."

	$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconWarning)

	Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ViggoMode2021/PowerShellScripts/main/$Selected_Script" -OutFile "$DesktopPath\EliteShell-Prize-Scripts\$Selected_Script"
	    
    Invoke-Expression Check_Bought_Scripts
	
}
}

else {

	$MessageBoxTitle = "$Selected_Script successfully purchased."

	$MessageBoxBody = "$Selected_Script has been purchased and is located in the 'EliteShell-Prize-Scripts' directory."

	$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconWarning)
    
	New-Item -Path "$DesktopPath\EliteShell-Prize-Scripts" -ItemType Directory

	Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ViggoMode2021/PowerShellScripts/main/$Selected_Script" -OutFile "$DesktopPath\EliteShell-Prize-Scripts\$Selected_Script"
    
    Invoke-Expression Check_Bought_Scripts
}

}

$ButtonTypeOk = [System.Windows.MessageBoxButton]::Ok

$ButtonTypeYesNoCancel = [System.Windows.MessageBoxButton]::YesNoCancel

$MessageIconWarning = [System.Windows.MessageBoxImage]::Warning

$MessageIconError = [System.Windows.MessageBoxImage]::Error

$MessageIconSuccess = [System.Windows.MessageBoxImage]::Information

$Label_Object = [System.Windows.Forms.Label]


$Title = New-Object $Label_Object

$Title.Text= "Welcome to EliteShell"

$Title.AutoSize = $true

$Title.Font = 'Verdana,11,style=Bold'

$Title.ForeColor = 'Blue'

$Title.Location = New-Object System.Drawing.Point(30,45)


$Body = New-Object $Label_Object

$Body.Text= "Please create a new game, load a game, or just start practicing by selecting a `npractice problem from the dropdown below."

$Body.AutoSize = $true

$Body.Font = 'Verdana,11,style=Bold'

$Body.Location = New-Object System.Drawing.Point(30,90)


$Correct_Incorrect = New-Object $Label_Object

$Correct_Incorrect.Text= ""

$Correct_Incorrect.AutoSize = $true

$Correct_Incorrect.Font = 'Verdana,11,style=Bold'

$Correct_Incorrect.Location = New-Object System.Drawing.Point(30,300)


$Completed_In = New-Object $Label_Object

$Completed_In.Text= ""

$Completed_In.AutoSize = $true

$Completed_In.Font = 'Verdana,10,style=Italic,Bold'

$Completed_In.Location = New-Object System.Drawing.Point(30,350)


$Total_Number_Of_Answers_Label = New-Object $Label_Object

$Total_Number_Of_Answers_Label.Text = "No score file loaded"

$Total_Number_Of_Answers_Label.AutoSize = $true

$Total_Number_Of_Answers_Label.Font = 'Calibri,12,style=Bold'

$Total_Number_Of_Answers_Label.ForeColor = 'Blue'

$Total_Number_Of_Answers_Label.Location = New-Object System.Drawing.Point(1600,100)


$Total_Score_Label = New-Object $Label_Object

$Total_Score_Label.Text = ""

$Total_Score_Label.AutoSize = $true

$Total_Score_Label.Font = 'Calibri,12,style=Bold'

$Total_Score_Label.ForeColor = 'Blue'

$Total_Score_Label.Location = New-Object System.Drawing.Point(1600,150)


$Total_Unique_Problems_Label = New-Object $Label_Object

$Total_Unique_Problems_Label.Text = ""

$Total_Unique_Problems_Label.AutoSize = $true

$Total_Unique_Problems_Label.Font = 'Calibri,12,style=Bold'

$Total_Unique_Problems_Label.ForeColor = 'Blue'

$Total_Unique_Problems_Label.Location = New-Object System.Drawing.Point(1550,210)


$Scripts_Purchased_Label = New-Object $Label_Object

$Scripts_Purchased_Label.Text= ""

$Scripts_Purchased_Label.AutoSize = $true

$Scripts_Purchased_Label.Font = 'Times,12'

$Scripts_Purchased_Label.ForeColor = 'Green'

$Scripts_Purchased_Label.Location = New-Object System.Drawing.Point(400,700)


$Score_File_Information = New-Object $Label_Object

$Score_File_Information.Text= ""

$Score_File_Information.AutoSize = $true

$Score_File_Information.Font = 'Verdana,11,style=Bold'

$Score_File_Information.Location = New-Object System.Drawing.Point(1550,450)

$Input_Box = New-Object System.Windows.Forms.TextBox
$Input_Box.Name = "Input_Box"
$Input_Box.Text = "Enter PowerShell code here"
$Input_Box.Font = 'Calibri,12,style=Bold'
$Input_Box.Location = New-Object System.Drawing.Point(30,150)
$Input_Box.Size = New-Object System.Drawing.Size(580,1800)

$Menu_Bar.Items.AddRange(@(
$File_Menu_Item,
$Windows_General_Strip_Menu_Item,
$Windows_Registry_Strip_Menu_Item,
$Active_Directory_Strip_Menu_Item,
$Networking_Strip_Menu_Item,
$DHCP_DNS_Strip_Menu_Item,
$Windows_General_Strip_Menu_Item_Learn))

function Check_Bought_Scripts{

if (Test-Path "$DesktopPath\EliteShell-Prize-Scripts\Update-Windows-Version.ps1"){

$Update_Windows_Version = "Update-Windows-Version.ps1"

}

if (Test-Path "$DesktopPath\EliteShell-Prize-Scripts\AD-Password-Generator.ps1"){

$AD_Password_Generator = "AD-Password-Generator.ps1"

}

if (Test-Path "$DesktopPath\EliteShell-Prize-Scripts\Disable-and-Enable-AD-Users.ps1"){

$Disable_and_Enable_AD_Users = "Disable-and-Enable-AD-Users.ps1"

}

$Scripts_Purchased_Label.Text = "Scripts Purchased: `n`n$Update_Windows_Version `n$AD_Password_Generator `n$Disable_and_Enable_AD_Users"

}


## start File menu item ##

$File_Menu_Item.Name = "File_Menu_Item"
$File_Menu_Item.Size = New-Object System.Drawing.Size(35, 20)
$File_Menu_Item.Text = "File"

$New_Game_Strip_Menu_Item.Name = "New_Game_Strip_Menu_Item"
$New_Game_Strip_Menu_Item.Size = New-Object System.Drawing.Size(152, 22)
$New_Game_Strip_Menu_Item.Text = "New Game"

$Load_Game_Strip_Menu_Item.Name = "Load_Game_Strip_Menu_Item"
$Load_Game_Strip_Menu_Item.Size = New-Object System.Drawing.Size(152, 22)
$Load_Game_Strip_Menu_Item.Text = "Load Game"

$View_Score_And_Stats_Strip_Menu_Item.Name= "View_Score_And_Stats_Strip_Menu_Item"
$View_Score_And_Stats_Strip_Menu_Item.Size = New-Object System.Drawing.Size(152, 22)
$View_Score_And_Stats_Strip_Menu_Item.Text = "View Score + Stats"

$View_My_System_Information_Strip_Menu_Item.Name= "View_My_System_Information_Strip_Menu_Item"
$View_My_System_Information_Strip_Menu_Item.Size = New-Object System.Drawing.Size(152, 22)
$View_My_System_Information_Strip_Menu_Item.Text = "View My System Information"

$View_EliteShell_Answers_Strip_Menu_Item.Name= "View_EliteShell_Answers_Strip_Menu_Item"
$View_EliteShell_Answers_Strip_Menu_Item.Size = New-Object System.Drawing.Size(152, 22)
$View_EliteShell_Answers_Strip_Menu_Item.Text = "View EliteShell Answers"

$View_README_Strip_Menu_Item.Name= "View_README_Strip_Menu_Item"
$View_README_Strip_Menu_Item.Size = New-Object System.Drawing.Size(152, 22)
$View_README_Strip_Menu_Item.Text = "Read Me"

$File_Menu_Item.DropDownItems.AddRange(@($New_Game_Strip_Menu_Item, $Load_Game_Strip_Menu_Item, $View_My_System_Information_Strip_Menu_Item, $View_EliteShell_Answers_Strip_Menu_Item, $View_README_Strip_Menu_Item))

function On_Click_New_Game_Strip_Menu_Item($Sender,$e){

    $Completed_In.Text= ""

	$Form.Controls.RemoveByKey("The_Submit_Button")

    $MessageBoxTitle = "New game file creation"

    $MessageBoxBody = "By starting a new game, a new csv file will be created on your desktop to track your score. Continue?"

	$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeYesNoCancel,$MessageIconWarning)

	if($Confirmation -eq 'Yes'){

	[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
	$New_Game_Filename = [Microsoft.VisualBasic.Interaction]::InputBox('Enter the filename', 'Enter the filename')

	if ($New_Game_Filename -eq ""){

	$MessageBoxTitle = "Please name your file."

    $MessageBoxBody = "Filename cannot be null. Please name your score file."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconWarning)

	Invoke-Expression On_Click_New_Game_Strip_Menu_Item

	}

	else{

    $New_Game_Filename_Csv = "$New_Game_Filename.csv"

    $New_Game_File_CheckSum = Get-ChildItem $Desktop_Path -recurse | Where {$_.name -match $New_Game_Filename_Csv} | select-object -ExpandProperty name

    if($New_Game_Filename_Csv -eq $New_Game_File_CheckSum){

	$Form.Controls.AddRange(@($Menu_Bar))

		## Fix This Part!

    $MessageBoxTitle = "File creation error."

    $MessageBoxBody = "$New_Game_File_CheckSum already exists. Creating a file with the same name and today's date appended."

    $New_Game_File = New-Item $Desktop_Path\$New_Game_Filename$Date.csv -ItemType File

	$New_Game_Filename_Csv_Rename = "$New_Game_Filename$Date.csv"

    $File = "$New_Game_File"
    $Data = Get-Content -Path $File
    $Header = "Problem,Description,Result,Date,CompletionTime,Points"
    Set-Content $File -Value $Header
    Add-Content -Path $File -Value $Data

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    $global:Game_Score_File = "$Desktop_Path\$New_Game_Filename_Csv_Rename"

    $Form.Text = "EleetShell - Current score file: $New_Game_Filename_Csv_Rename"

	$File_Menu_Item.DropDownItems.AddRange(@($New_Game_Strip_Menu_Item, $Load_Game_Strip_Menu_Item, $View_Score_And_Stats_Strip_Menu_Item))

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$global:Unique_Problems_Count = $Unique_Problems_Count

    $Total_Unique_Problems_Label.Text = "$Unique_Problems_Count total unique problems completed"

    }

    if($New_Game_Filename.IndexOfAny([System.IO.Path]::GetInvalidFileNameChars()) -ne -1)

    {

	$Form.Controls.AddRange(@($Menu_Bar))

    $MessageBoxTitle = "File name contains invalid characters"

    $MessageBoxBody = "$New_Game_Filename contains invalid characters. Please try again."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

	Invoke-Expression On_Click_New_Game_Strip_Menu_Item

    }

    else{

	$Form.Controls.AddRange(@($Menu_Bar))

    $New_Game_File = New-Item $Desktop_Path\$New_Game_Filename_Csv -ItemType File

    $File = "$New_Game_File"
    $Data = Get-Content -Path $File
    $Header = "Problem,Description,Result,Date,CompletionTime,Points"
    Set-Content $File -Value $Header
    Add-Content -Path $File -Value $Data

    $MessageBoxTitle = "New game created with the scorecard filename $New_Game_Filename_Csv"

    $MessageBoxBody = "New game created with the scorecard filename $New_Game_Filename_Csv"

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconSuccess)

    $global:Game_Score_File = "$Desktop_Path\$New_Game_Filename_Csv"

    $Form.Text = "EleetShell - Current score file: $New_Game_Filename_Csv"

	$File_Menu_Item.DropDownItems.AddRange(@($New_Game_Strip_Menu_Item, $Load_Game_Strip_Menu_Item, $View_Score_And_Stats_Strip_Menu_Item))

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Total_Number_Of_Answers_Label.Text = ""

    $Total_Score_Label.Text = ""

    $Created = (Get-ChildItem $Game_Score_File).CreationTime

    $Score_File_Information.Text= "Score File: $New_Game_Filename_Csv `nCreated on: $Created"

	$Buy_Script_Button = New-Object System.Windows.Forms.Button

	$Buy_Script_Button.Name = "Buy_Script_Button"

	$Buy_Script_Button.Text = "Buy Script"

	$Buy_Script_Button.AutoSize = $True

	$Buy_Script_Button.Font = ‘Microsoft Sans Serif,12,style=Bold’

	$Buy_Script_Button.ForeColor = 'Blue'

	$Buy_Script_Button.Location = New-Object System.Drawing.Point(40,825)

	$Buy_Script_Button.Add_Click({Buy_Scripts})

	$Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $Script_Dropdown, $Buy_Script_Button, $EliteShell_Logo, $The_Submit_Button, $The_Learn_More_Button, $Total_Number_Of_Answers_Label, $Total_Score_Label, $Total_Unique_Problems_Label, $Score_Box, $Store_Box, $Completed_In, $Correct_Incorrect, $Score_File_Information))
    
    Invoke-Expression Check_Bought_Scripts

    }

	}

	}
}

function Dropdown_Problem_Completed_Check{

$Timer_Start_Time.Stop()

$Problem_Completed_Hostname = "hostname"

$Problem_Completed_Hostname = Select-String $Game_Score_File -Pattern $Problem_Completed_Hostname

if($Problem_Completed_Hostname -ne $null -and $Game_Score_File -ne $null){
$Windows_General_Strip_Menu_Item_Learn.Text = 'Windows General #1 (hostname)'
$Windows_General_Strip_Menu_Item_Learn.ForeColor = 'Green'
}

else{

$Windows_General_Strip_Menu_Item_Learn.Text = 'Windows General #1 (hostname)'
$Windows_General_Strip_Menu_Item_Learn.ForeColor = 'Blue'
}

$Problem_Completed_Uptime = "systeminfo | find 'Boot Time'"

$Problem_Completed_Uptime = Select-String $Game_Score_File -Pattern $Problem_Completed_Uptime

if($Problem_Completed_Uptime -ne $null -and $Game_Score_File -ne $null){
$Windows_General_Strip_Menu_Item_2.Text = 'Windows General #2 (uptime)'
$Windows_General_Strip_Menu_Item_2.ForeColor = 'Green'
}

else{

$Windows_General_Strip_Menu_Item_2.Text = 'Windows General #2 (uptime)'
$Windows_General_Strip_Menu_Item_2.ForeColor = 'Blue'

}

$Problem_Completed_Env = "dir env:"

$Problem_Completed_Env = Select-String $Game_Score_File -Pattern $Problem_Completed_Env

if($Problem_Completed_Env -ne $null -and $Game_Score_File -ne $null){
$Windows_General_Strip_Menu_Item_3.Text = 'Windows General #3 (env)'
$Windows_General_Strip_Menu_Item_3.ForeColor = 'Green'
}

else{

$Windows_General_Strip_Menu_Item_3.Text = 'Windows General #3 (env)'
$Windows_General_Strip_Menu_Item_3.ForeColor = 'Blue'

}

$Problem_Completed_Cpu = "Get-Process | Where-Object { $_.CPU -gt 20 }"

$Problem_Completed_Cpu = Select-String $Game_Score_File -Pattern $Problem_Completed_Cpu

if($Problem_Completed_Cpu -ne $null -and $Game_Score_File -ne $null){
$Windows_General_Strip_Menu_Item_4.Text = 'Windows General #4 (cpu)'
$Windows_General_Strip_Menu_Item_4.ForeColor = 'Green'
}

else{

$Windows_General_Strip_Menu_Item_4.Text = 'Windows General #4 (cpu)'
$Windows_General_Strip_Menu_Item_4.ForeColor = 'Blue'

}

$Problem_Completed_Disk_Space = "Get-PSDrive C"

$Problem_Completed_Disk_Space = Select-String $Game_Score_File -Pattern $Problem_Completed_Disk_Space

if($Problem_Completed_Disk_Space -ne $null -and $Game_Score_File -ne $null){
$Windows_General_Strip_Menu_Item_5.Text = 'Windows General #5 (disk space)'
$Windows_General_Strip_Menu_Item_5.ForeColor = 'Green'
}

else{

$Windows_General_Strip_Menu_Item_5.Text = 'Windows General #5 (disk space)'
$Windows_General_Strip_Menu_Item_5.ForeColor = 'Blue'

}

$Problem_Completed_Serial_Number = "Get-WmiObject win32_bios | Select-Object -ExpandProperty SerialNumber"

$Problem_Completed_Serial_Number = Select-String $Game_Score_File -Pattern $Problem_Completed_Serial_Number

if($Problem_Completed_Serial_Number -ne $null -and $Game_Score_File -ne $null){
$Windows_General_Strip_Menu_Item_6.Text = 'Windows General #6 (serial number)'
$Windows_General_Strip_Menu_Item_6.ForeColor = 'Green'
}

else{

$Windows_General_Strip_Menu_Item_6.Text = 'Windows General #6 (serial number)'
$Windows_General_Strip_Menu_Item_6.ForeColor = 'Blue'

}

$Problem_Completed_DHCP = "Add-DhcpServerInDC -DNSName dhcp-practice -IPAddress 172.16.0.50"

$Problem_Completed_DHCP = Select-String $Game_Score_File -Pattern $Problem_Completed_DHCP

if($Problem_Completed_DHCP -ne $null -and $Game_Score_File -ne $null){
$DHCP_DNS_Strip_Menu_Item_Practice.Text = 'DHCP #1 (server)'
$DHCP_DNS_Strip_Menu_Item_Practice.ForeColor = 'Green'
}

else{

$DHCP_DNS_Strip_Menu_Item_Practice.Text = 'DHCP #1 (server)'
$DHCP_DNS_Strip_Menu_Item_Practice.ForeColor = 'Blue'

}

$Problem_Completed_DHCP_2 = "Add-DhcpServerV4Scope -name 'test' -StartRange 172.16.0.100 -Endrange 172.16.0.200 -SubnetMask 255.255.255.0 -State Active"

$Problem_Completed_DHCP_2 = Select-String $Game_Score_File -Pattern $Problem_Completed_DHCP_2

if($Problem_Completed_DHCP_2 -ne $null -and $Game_Score_File -ne $null){
$DHCP_DNS_Strip_Menu_Item_Practice_2.Text = 'DHCP #2 (scope)'
$DHCP_DNS_Strip_Menu_Item_Practice_2.ForeColor = 'Green'
}

else{

$DHCP_DNS_Strip_Menu_Item_Practice_2.Text = 'DHCP #2 (scope)'
$DHCP_DNS_Strip_Menu_Item_Practice_2.ForeColor = 'Blue'

}

$Problem_Completed_DNS_1 = "Get-WindowsFeature -Name"

$Problem_Completed_DNS_1 = Select-String $Game_Score_File -Pattern $Problem_Completed_DNS_1

if($Problem_Completed_DNS_1 -ne $null -and $Game_Score_File -ne $null){

$DHCP_DNS_Strip_Menu_Item_Practice_3.Text = 'DNS #1 (check install)'
$DHCP_DNS_Strip_Menu_Item_Practice_3.ForeColor = 'Green'
}

else{

$DHCP_DNS_Strip_Menu_Item_Practice_3.Text = 'DNS #1 (check install)'
$DHCP_DNS_Strip_Menu_Item_Practice_3.ForeColor = 'Blue'

}

$Problem_Completed_DNS_2 = "Install-WindowsFeature -Name DNS -IncludeManagementTools"

$Problem_Completed_DNS_2 = Select-String $Game_Score_File -Pattern $Problem_Completed_DNS_2

if($Problem_Completed_DNS_2 -ne $null -and $Game_Score_File -ne $null){
$DHCP_DNS_Strip_Menu_Item_Practice_4.Text = 'DNS #2 (install DNS)'
$DHCP_DNS_Strip_Menu_Item_Practice_4.ForeColor = 'Green'

}

else{

$DHCP_DNS_Strip_Menu_Item_Practice_4.Text = 'DNS #2 (install DNS)'
$DHCP_DNS_Strip_Menu_Item_Practice_4.ForeColor = 'Blue'

}

$Problem_Completed_DNS_3 = "Add-DnsServerPrimaryZone -Name Eliteshell.org -Zonefile Eliteshell.org.DNS -DynamicUpdate NonsecureAndSecure"

$Problem_Completed_DNS_3 = Select-String $Game_Score_File -Pattern $Problem_Completed_DNS_3

if($Problem_Completed_DNS_3 -ne $null -and $Game_Score_File -ne $null){
$DHCP_DNS_Strip_Menu_Item_Practice_5.Text = 'DNS #3 (forward lookup zone)'
$DHCP_DNS_Strip_Menu_Item_Practice_5.ForeColor = 'Green'
}

else{

$DHCP_DNS_Strip_Menu_Item_Practice_5.Text = 'DNS #3 (forward lookup zone)'
$DHCP_DNS_Strip_Menu_Item_Practice_5.ForeColor = 'Blue'

}

$Problem_Completed_Networking_1 = "ipconfig /all"

$Problem_Completed_Networking_1 = Select-String $Game_Score_File -Pattern $Problem_Completed_Networking_1

if($Problem_Completed_Networking_1 -ne $null -and $Game_Score_File -ne $null){
$Networking_Strip_Menu_Item_Practice.Text = 'Networking #1 (ip address)'
$Networking_Strip_Menu_Item_Practice.ForeColor = 'Green'
}

else{

$Networking_Strip_Menu_Item_Practice.Text = 'Networking #1 (ip address)'
$Networking_Strip_Menu_Item_Practice.ForeColor = 'Blue'

}

$Problem_Completed_Networking_2 = "ipconfig /displaydns"

$Problem_Completed_Networking_2 = Select-String $Game_Score_File -Pattern $Problem_Completed_Networking_2

if($Problem_Completed_Networking_2 -ne $null -and $Game_Score_File -ne $null){
$Networking_Strip_Menu_Item_Practice_2.Text = 'Networking #2 (ip / dns)'
$Networking_Strip_Menu_Item_Practice_2.ForeColor = 'Green'
}

else{

$Networking_Strip_Menu_Item_Practice_2.Text = 'Networking #2 (ip / dns)'
$Networking_Strip_Menu_Item_Practice_2.ForeColor = 'Blue'

}

$Problem_Completed_Networking_3 = "ipconfig /flushdns"

$Problem_Completed_Networking_3 = Select-String $Game_Score_File -Pattern $Problem_Completed_Networking_3

if($Problem_Completed_Networking_3 -ne $null -and $Game_Score_File -ne $null){
$Networking_Strip_Menu_Item_Practice_3.Text = 'Networking #3 (ip / dns)'
$Networking_Strip_Menu_Item_Practice_3.ForeColor = 'Green'
}

else{

$Networking_Strip_Menu_Item_Practice_3.Text = 'Networking #3 (ip / dns)'
$Networking_Strip_Menu_Item_Practice_3.ForeColor = 'Blue'

}

$Problem_Completed_Networking_4 = "ipconfig /renew"

$Problem_Completed_Networking_4 = Select-String $Game_Score_File -Pattern $Problem_Completed_Networking_4

if($Problem_Completed_Networking_4 -ne $null -and $Game_Score_File -ne $null){
$Networking_Strip_Menu_Item_Practice_4.Text = 'Networking #4 (ip)'
$Networking_Strip_Menu_Item_Practice_4.ForeColor = 'Green'
}

else{

$Networking_Strip_Menu_Item_Practice_4.Text = 'Networking #4 (ip)'
$Networking_Strip_Menu_Item_Practice_4.ForeColor = 'Blue'

}

$Problem_Completed_Networking_5 = "ipconfig /registerdns"

$Problem_Completed_Networking_5 = Select-String $Game_Score_File -Pattern $Problem_Completed_Networking_5

if($Problem_Completed_Networking_5 -ne $null -and $Game_Score_File -ne $null){
$Networking_Strip_Menu_Item_Practice_5.Text = 'Networking #5 (dhcp / dns)'
$Networking_Strip_Menu_Item_Practice_5.ForeColor = 'Green'
}

else{

$Networking_Strip_Menu_Item_Practice_5.Text = 'Networking #5 (dhcp / dns)'
$Networking_Strip_Menu_Item_Practice_5.ForeColor = 'Blue'

}

$Problem_Completed_Networking_6 = "Get-NetTCPConnection"

$Problem_Completed_Networking_6 = Select-String $Game_Score_File -Pattern $Problem_Completed_Networking_6

if($Problem_Completed_Networking_6 -ne $null -and $Game_Score_File -ne $null){
$Networking_Strip_Menu_Item_Practice_6.Text = 'Networking #6 (ports)'
$Networking_Strip_Menu_Item_Practice_6.ForeColor = 'Green'
}

else{

$Networking_Strip_Menu_Item_Practice_6.Text = 'Networking #6 (ports)'
$Networking_Strip_Menu_Item_Practice_6.ForeColor = 'Blue'

}

$Problem_Completed_Networking_7 = "Test-NetConnection -ComputerName google.com -TraceRoute"

$Problem_Completed_Networking_7 = Select-String $Game_Score_File -Pattern $Problem_Completed_Networking_7

if($Problem_Completed_Networking_7 -ne $null -and $Game_Score_File -ne $null){
$Networking_Strip_Menu_Item_Practice_7.Text = 'Networking #7 (traceroute)'
$Networking_Strip_Menu_Item_Practice_7.ForeColor = 'Green'
}

else{

$Networking_Strip_Menu_Item_Practice_7.Text = 'Networking #7 (traceroute)'
$Networking_Strip_Menu_Item_Practice_7.ForeColor = 'Blue'

}

$Problem_Completed_Networking_8 = "netsh wlan show profiles"

$Problem_Completed_Networking_8 = Select-String $Game_Score_File -Pattern $Problem_Completed_Networking_8

if($Problem_Completed_Networking_8 -ne $null -and $Game_Score_File -ne $null){
$Networking_Strip_Menu_Item_Practice_8.Text = 'Networking #8 (wireless network profiles)'
$Networking_Strip_Menu_Item_Practice_8.ForeColor = 'Green'
}

else{

$Networking_Strip_Menu_Item_Practice_8.Text = 'Networking #8 (wireless network profiles)'
$Networking_Strip_Menu_Item_Practice_8.ForeColor = 'Blue'

}

$Problem_Completed_Windows_Registry = "set-location -path HKLM:SOFTWARE"

$Problem_Completed_Windows_Registry = Select-String $Game_Score_File -Pattern $Problem_Completed_Windows_Registry

if($Problem_Completed_Windows_Registry -ne $null -and $Game_Score_File -ne $null){
$Windows_Registry_Strip_Menu_Item_Practice.Text = 'Windows Registry #1 (path)'
$Windows_Registry_Strip_Menu_Item_Practice.ForeColor = 'Green'
}

else{

$Windows_Registry_Strip_Menu_Item_Practice.Text = 'Windows Registry #1 (path)'
$Windows_Registry_Strip_Menu_Item_Practice.ForeColor = 'Blue'

}

$Problem_Completed_Windows_Registry_2 = "Get-PSDrive -PSProvider 'Registry' | Select-Object -Property Name, Root"

$Problem_Completed_Windows_Registry_2 = Select-String $Game_Score_File -Pattern $Problem_Completed_Windows_Registry_2

if($Problem_Completed_Windows_Registry_2 -ne $null -and $Game_Score_File -ne $null){
$Windows_Registry_Strip_Menu_Item_Practice_2.Text = 'Windows Registry #2 (root keys)'
$Windows_Registry_Strip_Menu_Item_Practice_2.ForeColor = 'Green'
}

else{

$Windows_Registry_Strip_Menu_Item_Practice_2.Text = 'Windows Registry #2 (root keys)'
$Windows_Registry_Strip_Menu_Item_Practice_2.ForeColor = 'Blue'

}

}

function On_Click_Load_Game_Strip_Menu_Item($Sender,$e){

$Completed_In.Text= ""

$Timer_Start_Time.Stop()

$Form.Controls.AddRange(@($Menu_Bar))

Add-Type -AssemblyName System.Windows.Forms
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.Title = "Please Select File"
$OpenFileDialog.InitialDirectory = $initialDirectory
$OpenFileDialog.filter = "(*.csv)|*.csv|SpreadSheet (*.xlsx)|*.xlsx'"

$OpenFileDialog.ShowDialog() | Out-Null

$CSV_Header_Check = (Get-Content $OpenFileDialog.FileName | Select-Object -First 1).Split($csvdelimiter)

if($CSV_Header_Check -ne "Problem,Description,Result,Date,CompletionTime,Points"){

$MessageBoxTitle = "Incompatible csv file"

$MessageBoxBody = "Selected CSV file is incompatible with EleetShell due to header mismatch. Please select appropriate CSV."

$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconSuccess)

}

else{

$global:Game_Score_File = $OpenFileDialog.FileName

$CSV_Filename = Split-Path $Game_Score_File -Leaf

$Form.Text = "EleetShell - Current score file: $CSV_Filename"

$Score_File_Information.Text= "Score File: $CSV_Filename"

$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

$global:Number_Of_Correct_Answers = $CSV_Length

$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

$CSV_Stuff = Import-CSV -Path $Game_Score_File

$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

$global:Total_Score = $Total_Score

$Total_Score_Label.Text = "$Total_Score total points"

$Unique_Problems = $CSV_Stuff | Select-Object -ExpandProperty Problem -Unique

$Unique_Problems_Count = $Unique_Problems.Count

$global:Unique_Problems_Count = $Unique_Problems_Count

$Total_Unique_Problems_Label.Text = "$Unique_Problems_Count total unique problems completed"

$File_Menu_Item.DropDownItems.AddRange(@($New_Game_Strip_Menu_Item, $Load_Game_Strip_Menu_Item, $View_Score_And_Stats_Strip_Menu_Item))

Invoke-Expression Dropdown_Problem_Completed_Check

$Created = (Get-ChildItem $Game_Score_File).CreationTime

$Score_File_Information.Text= "Score File: $CSV_Filename `nCreated on: $Created"

$Buy_Script_Button = New-Object System.Windows.Forms.Button

$Buy_Script_Button.Name = "Buy_Script_Button"

$Buy_Script_Button.Text = "Buy Script"

$Buy_Script_Button.AutoSize = $True

$Buy_Script_Button.Font = ‘Microsoft Sans Serif,12,style=Bold’

$Buy_Script_Button.ForeColor = 'Blue'

$Buy_Script_Button.Location = New-Object System.Drawing.Point(40,825)

$Buy_Script_Button.Add_Click({Buy_Scripts})

Invoke-Expression Check_Bought_Scripts

$Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $Script_Dropdown, $Buy_Script_Button, $EliteShell_Logo, $The_Submit_Button, $The_Learn_More_Button, $Total_Number_Of_Answers_Label, $Total_Score_Label, $Total_Unique_Problems_Label, $Score_Box, $Store_Box, $Completed_In, $Correct_Incorrect, $Score_File_Information))

if($Unique_Problems_Count -gt 5){

$MessageBoxTitle = "You are halfway there!"

$MessageBoxBody = "You have completed $Unique_Problems_Count out of xx!"

$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconSuccess)

}

}
}

function On_Click_View_README{

Start-Process "https://github.com/ViggoMode2021/EliteShell/tree/main#readme"

}

function On_Click_View_Score_And_Stats_Strip_Menu_Item{

if($Number_Of_Correct_Answers -eq 0){

$MessageBoxTitle = "No score information for $Game_Score_File"

$MessageBoxBody = "There currently are no solved problems for this game file. Please complete some problems and check back!"

$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

}

$Timer_Start_Time.Stop()

$Table_Data = Import-CSV -Path $Game_Score_File | Out-GridView

$CSV_Stuff = Import-CSV -Path $Game_Score_File

$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

$global:Number_Of_Correct_Answers = $CSV_Length

$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

$CSV_Stuff = Import-CSV -Path $Game_Score_File

$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

$global:Total_Score = $Total_Score

$Total_Score_Label.Text = "$Total_Score total points"

$global:Total_Score = $Total_Score

$Unique_Problems = $CSV_Stuff | Select-Object -ExpandProperty Problem -Unique

$Unique_Problems_Count = $Unique_Problems.Count

$global:Unique_Problems_Count = $Unique_Problems_Count

$Total_Unique_Problems_Label.Text = "$Unique_Problems_Count total unique problems completed"

}

function On_Click_View_My_System_Information_Strip_Menu_Item{

$MessageBoxTitle = "My System Information:"

$MessageBoxBody = "OS: $OS `nLast Run Time: $Last_Accessed_Time `n`nScreen Resolution: $Screen_Resolution
`nArchitecture: $Architecture `n`nPowerShell Version: $PowerShell_Version"

$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconSuccess)

}

function On_Click_View_EliteShell_Answers_Strip_Menu_Item{

$MessageBoxTitle = "View answers on GitHub"

$MessageBoxBody = "By clicking yes, you will be sent to GitHub.com to view EliteShell answers."

$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeYesNoCancel,$MessageIconSuccess)

if($Confirmation -eq 'Yes'){

$Test_Connection = Test-Connection -ComputerName www.github.com -Count 1 -ErrorAction "SilentlyContinue"

Start-Process "https://raw.githubusercontent.com/ViggoMode2021/PowerShellScripts/main/LearnWindowsServerAndPowerShell/Answers-EliteShell.ps1"

if ($Test_Connection -eq $null){

$MessageBoxTitle = "No internet connection"

$MessageBoxBody = "Your device currently does not have internet connection. EliteShell answers are available on www.GitHub.com."

$Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

}

}

}

$New_Game_Strip_Menu_Item.Add_Click( { On_Click_New_Game_Strip_Menu_Item $New_Game_Strip_Menu_Item $EventArgs} )

$Load_Game_Strip_Menu_Item.Add_Click( { On_Click_Load_Game_Strip_Menu_Item $Load_Game_Strip_Menu_Item $EventArgs} )

$View_Score_And_Stats_Strip_Menu_Item.Add_Click( { On_Click_View_Score_And_Stats_Strip_Menu_Item $View_Score_And_Stats_Strip_Menu_Item $EventArgs} )

$View_My_System_Information_Strip_Menu_Item.Add_Click( { On_Click_View_My_System_Information_Strip_Menu_Item $View_My_System_Information_Strip_Menu_Item $EventArgs} )

$View_EliteShell_Answers_Strip_Menu_Item.Add_Click( { On_Click_View_EliteShell_Answers_Strip_Menu_Item $View_My_EliteShell_Answers_Strip_Menu_Item $EventArgs} )

$View_README_Strip_Menu_Item.Add_Click( { On_Click_View_README $View_README_Strip_Menu_Item $EventArgs} )

## end File menu item ##

## start Windows General menu item ##

$Windows_General_Strip_Menu_Item.Name = "Windows_General_Strip_Menu_Item"
$Windows_General_Strip_Menu_Item.Size = New-Object System.Drawing.Size(35, 20)
$Windows_General_Strip_Menu_Item.Text = "Windows General"

$Windows_General_Strip_Menu_Item_Learn.Name = "Windows_General_Strip_Menu_Item_Learn"
$Windows_General_Strip_Menu_Item_Learn.Size = New-Object System.Drawing.Size(152, 22)
$Windows_General_Strip_Menu_Item_Learn.Text = "Windows General #1 (hostname)"

$Windows_General_Strip_Menu_Item_2.Name = "Windows_General_Strip_Menu_Item_2"
$Windows_General_Strip_Menu_Item_2.Size = New-Object System.Drawing.Size(152, 22)
$Windows_General_Strip_Menu_Item_2.Text = "Windows General #2 (uptime)"

$Windows_General_Strip_Menu_Item_3.Name = "Windows_General_Strip_Menu_Item_3"
$Windows_General_Strip_Menu_Item_3.Size = New-Object System.Drawing.Size(152, 22)
$Windows_General_Strip_Menu_Item_3.Text = "Windows General #3 (env vars)"

$Windows_General_Strip_Menu_Item_4.Name = "Windows_General_Strip_Menu_Item_4"
$Windows_General_Strip_Menu_Item_4.Size = New-Object System.Drawing.Size(152, 22)
$Windows_General_Strip_Menu_Item_4.Text = "Windows General #4 (cpu)"

$Windows_General_Strip_Menu_Item_5.Name = "Windows_General_Strip_Menu_Item_5"
$Windows_General_Strip_Menu_Item_5.Size = New-Object System.Drawing.Size(152, 22)
$Windows_General_Strip_Menu_Item_5.Text = "Windows General #5 (disk space)"

$Windows_General_Strip_Menu_Item_6.Name = "Windows_General_Strip_Menu_Item_6"
$Windows_General_Strip_Menu_Item_6.Size = New-Object System.Drawing.Size(152, 22)
$Windows_General_Strip_Menu_Item_6.Text = "Windows General #6 (serial number)"

$Windows_General_Strip_Menu_Item.DropDownItems.AddRange(@($Windows_General_Strip_Menu_Item_Learn, $Windows_General_Strip_Menu_Item_2, $Windows_General_Strip_Menu_Item_3
$Windows_General_Strip_Menu_Item_4, $Windows_General_Strip_Menu_Item_5, $Windows_General_Strip_Menu_Item_6))

## end Windows General menu item ##

## Windows General #1 ##

function On_Click_Hostname_Strip_Menu_Item_Learn($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text = "Windows General #1"
	$Title.ForeColor = 'Blue'

	$Body.Text = "Find the computer name (hostname) of this device."

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Practice_Problem})

    $Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

	$The_Learn_More_Button.Name = "The_Learn_More_Button"

	$The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

	$The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

	$The_Learn_More_Button.ForeColor = 'Blue'

	$The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

	$The_Learn_More_Button.Add_Click({Start-Process "https://www.lifewire.com/what-is-a-hostname-2625906"})

	$Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "hostname"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Windows General #1 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Windows General #1"

	}
}

function Selected_Practice_Problem{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Find the computer name (hostname) of your Windows machine. Use PowerShell."){
	if($Answer -eq "hostname"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$Timer_New = [int]$Timer

	Write-Host $Timer_New.GetType()

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Windows General #1" ; Description = "Find the computer name (hostname) of your Windows machine" ;Result = "hostname" ; CompletionTime = $Timer ; Date = $Date ; Points = "1"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	$Unique_Problems = $CSV_Stuff | Select-Object -ExpandProperty Problem -Unique

    $Unique_Problems_Count = $Unique_Problems.Count

    $global:Unique_Problems_Count = $Unique_Problems_Count

    $Total_Unique_Problems_Label.Text = "$Unique_Problems_Count total unique problems completed"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Find the computer name (hostname) of your Windows machine"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'

    $Completed_In.Text = "Completed in $Timer"

    }

	else{

     $Body.Text = "Find the computer name (hostname) of your Windows machine"

     $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."

     $Correct_Incorrect.ForeColor = 'Red'

        }
    $Input_Box.Clear()
}}

## Windows General #2 ##

function On_Click_Uptime_Strip_Menu_Item($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text = "Windows General #2"
	$Title.ForeColor = 'Blue'

	$Description = "Find the uptime of this device. Note, use the 'systeminfo' command and a | (pipe). `nMake sure there is proper spacing on both sides of |"

	$Body.Text = $Description

	$global:Description = $Description

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Windows_General_Problem_2})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

	$The_Learn_More_Button = New-Object System.Windows.Forms.Button

	$The_Learn_More_Button.Name = "The_Learn_More_Button"

	$The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

	$The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

	$The_Learn_More_Button.ForeColor = 'Blue'

	$The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

	$The_Learn_More_Button.Add_Click({Start-Process "https://www.atera.com/blog/how-to-check-system-uptime-on-windows/"})

	$Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "systeminfo | find 'Boot Time'"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Windows General #2 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Windows General #2"

	}
}

function Selected_Windows_General_Problem_2{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = $Description){
	if($Input_Box.Text -eq "systeminfo | find 'Boot Time'"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Windows General #2" ; Description = "Find the uptime of this device. Note, use the 'systeminfo' command and a | (pipe). Make sure there is proper spacing on both sides of |" ; Result = "systeminfo | find 'Boot Time'" ; CompletionTime = $Timer ; Date = $Date ; Points = "2"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "$Description"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = $Description
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Windows General #3 ##

function On_Click_Env_Strip_Menu_Item($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text = "Windows General #3"
	$Title.ForeColor = 'Blue'

	$Body.Text = "Find the environment variables on this system using a command `nthat has two different three letter words and a :"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Windows_General_Problem_3})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

	$The_Learn_More_Button = New-Object System.Windows.Forms.Button

	$The_Learn_More_Button.Name = "The_Learn_More_Button"

	$The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

	$The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

	$The_Learn_More_Button.ForeColor = 'Blue'

	$The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

	$The_Learn_More_Button.Add_Click({Start-Process "https://www.digitalcitizen.life/simple-questions-what-are-environment-variables/"})

	$Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "dir env:"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Windows General #3 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Windows General #3"

	}
}

function Selected_Windows_General_Problem_3{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Find the environment variables on this system using a command `nthat has two different three letter words and a :"){

	if($Input_Box.Text -eq "dir env:"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Windows General #3" ; Description = "Find the environment variables on this system using a command `nthat has two different three letter words and a :" ;Result = "dir env:" ; CompletionTime = $Timer ; Date = $Date ; Points = "2"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Find the environment variables on this system using a command `nthat has two different three letter words and a :"

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    }

	else{

		$Body.Text = "Find the environment variables on this system using a command `nthat has two different three letter words and a :"

        $Correct_Incorrect.ForeColor = 'Red'

        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."

        }
	}

	$Input_Box.Clear()
}

## Windows General #4 ##

function On_Click_Cpu_Strip_Menu_Item($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text = "Windows General #4"
	$Title.ForeColor = 'Blue'

	$Body.Text = "Find the processes on this machine where the cpu consumption is greater than 20%. `nNote: Use Get-Process and Where-Object separated by a |"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Windows_General_Problem_4})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

	$The_Learn_More_Button = New-Object System.Windows.Forms.Button

	$The_Learn_More_Button.Name = "The_Learn_More_Button"

	$The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

	$The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

	$The_Learn_More_Button.ForeColor = 'Blue'

	$The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

	$The_Learn_More_Button.Add_Click({Start-Process "https://www.howtogeek.com/405806/windows-task-manager-the-complete-guide/"})

	$Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Get-Process | Where-Object { $_.CPU -gt 20 }"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Windows General #4 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Windows General #4"

	}
}

function Selected_Windows_General_Problem_4{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Find the processes on this machine where the cpu consumption is greater than 20%. `nNote: Use Get-Process and Where-Object separated by a |"){

	$CPU = 'Get-Process | Where-Object { $_.CPU -gt 20 }'

	if($Input_Box.Text -eq $CPU){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Windows General #4" ; Description = "Find the processes on this machine where the cpu consumption is greater than 20%. `nNote: Use Get-Process and Where-Object separated by a |" ; Result = "$CPU" ; CompletionTime = $Timer ; Date = $Date ; Points = "3"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Find the processes on this machine where the cpu consumption is greater than 20%. `nNote: Use Get-Process and Where-Object separated by a |"

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    }

	else{

		$Body.Text = "Find the processes on this machine where the cpu consumption is greater than 20%. `nNote: Use Get-Process and Where-Object separated by a |"

        $Correct_Incorrect.ForeColor = 'Red'

        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."

        }
	}

	$Input_Box.Clear()
}

## Windows General #5 ##

function On_Click_Disk_Space_Strip_Menu_Item($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text = "Windows General #5"
	$Title.ForeColor = 'Blue'

	$Body.Text = "Find the disk space of the current machine's C drive"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Windows_General_Problem_5})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

	$The_Learn_More_Button = New-Object System.Windows.Forms.Button

	$The_Learn_More_Button.Name = "The_Learn_More_Button"

	$The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

	$The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

	$The_Learn_More_Button.ForeColor = 'Blue'

	$The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

	$The_Learn_More_Button.Add_Click({Start-Process "https://www.computerhope.com/jargon/d/diskcapa.htm"})

	$Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Get-PSDrive C"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Windows General #5 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Windows General #5"

	}
}

function Selected_Windows_General_Problem_5{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Find the disk space of the current machine's C drive"){

	if($Input_Box.Text -eq "Get-PSDrive C"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Windows General #5" ; Description = "Find the disk space of the current machine's C drive" ; Result = "Get-PSDrive C" ; CompletionTime = $Timer ; Date = $Date ; Points = "3"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Find the disk space of the current machine's C drive"

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    }

	else{

		$Body.Text = "Find the disk space of the current machine's C drive"

        $Correct_Incorrect.ForeColor = 'Red'

        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."

        }
	}

	$Input_Box.Clear()
}

## Windows General #6 ##

function On_Click_Serial_Number_Strip_Menu_Item($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text = "Windows General #6"
	$Title.ForeColor = 'Blue'

	$Body.Text = "Find the serial number of this device using the Get-WmiObject cmdlet, a pipe, and Select-Object -ExpandProperty"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Windows_General_Problem_6})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://myshadow.org/computer-serial-number"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Get-WmiObject win32_bios | Select-Object -ExpandProperty SerialNumber"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Windows General #6 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Windows General #6"

	}
}

function Selected_Windows_General_Problem_6{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Find the serial number of this device using the Get-WmiObject cmdlet, a pipe, and Select-Object -ExpandProperty"){

	if($Input_Box.Text -eq "Get-WmiObject win32_bios | Select-Object -ExpandProperty SerialNumber"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Windows General #6" ; Description = "Find the serial number of this device using the Get-WmiObject cmdlet, a pipe, and Select-Object -ExpandProperty" ; Result = "Get-WmiObject win32_bios | Select-Object -ExpandProperty SerialNumber" ; CompletionTime = $Timer ; Date = $Date ; Points = "3"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Find the serial number of this device using the Get-WmiObject cmdlet, a pipe, and Select-Object -ExpandProperty"

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    }

	else{

		$Body.Text = "Find the serial number of this device using the Get-WmiObject cmdlet, a pipe, and Select-Object -ExpandProperty"

        $Correct_Incorrect.ForeColor = 'Red'

        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."

        $Correct_Answer = "Get-WmiObject win32_bios | Select-Object -ExpandProperty SerialNumber"

        if ( $Input_Box.Text -ceq $Correct_Answer ) {
        return -1
          }
          for ( $i = 0; $i -lt $Answer.Length; $i++ ) {
            if ( $Input_Box.Text[$i] -cne $Correct_Answer[$i] ) {
              return $i
            }
          }
          $Length_Off = $Input_Box.Text.Length | Out-String

          Write-Host $Length_Off

            }
	    }

	$Input_Box.Clear()
}

$Windows_General_Strip_Menu_Item_Learn.Add_Click( { On_Click_Hostname_Strip_Menu_Item_Learn $Windows_General_Strip_Menu_Item_Learn $EventArgs} )

$Windows_General_Strip_Menu_Item_2.Add_Click( { On_Click_Uptime_Strip_Menu_Item $Windows_General_Strip_Menu_Item_2 $EventArgs} )

$Windows_General_Strip_Menu_Item_3.Add_Click( { On_Click_Env_Strip_Menu_Item $Windows_General_Strip_Menu_Item_3 $EventArgs} )

$Windows_General_Strip_Menu_Item_4.Add_Click( { On_Click_Cpu_Strip_Menu_Item $Windows_General_Strip_Menu_Item_4 $EventArgs} )

$Windows_General_Strip_Menu_Item_5.Add_Click( { On_Click_Disk_Space_Strip_Menu_Item $Windows_General_Strip_Menu_Item_5 $EventArgs} )

$Windows_General_Strip_Menu_Item_6.Add_Click( { On_Click_Serial_Number_Strip_Menu_Item $Windows_General_Strip_Menu_Item_6 $EventArgs} )

## DHCP & DNS #1 (check install) ##

$DHCP_DNS_Strip_Menu_Item.Name = "DHCP_DNS_Strip_Menu_Item"
$DHCP_DNS_Strip_Menu_Item.Size = New-Object System.Drawing.Size(51, 20)
$DHCP_DNS_Strip_Menu_Item.Text = "DHCP + DNS"

$DHCP_DNS_Strip_Menu_Item_Practice.Name = "DHCP_DNS_Strip_Menu_Item_Practice"
$DHCP_DNS_Strip_Menu_Item_Practice.Size = New-Object System.Drawing.Size(152, 22)
$DHCP_DNS_Strip_Menu_Item_Practice.Text = "DHCP #1 (server)"

function On_Click_DHCP_DNS_Strip_Menu_Item_Practice($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    if ($OS -notmatch "Windows Server"){

    $MessageBoxTitle = "Incorrect Operating System."

    $MessageBoxBody = "This system is not running Windows Server. You can still practice these problems, but you will not receive proper PowerShell results."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "DHCP #1"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Create a DHCP server in the Domain controller named dhcp-practice with an IP address of 172.16.0.50"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_DHCP_DNS_Practice_Problem})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://activedirectorypro.com/configure-dhcp-server/"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Add-DhcpServerInDC -DNSName dhcp-practice -IPAddress 172.16.0.50"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "DHCP #1 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "DHCP #1"

	}
}

function Selected_DHCP_DNS_Practice_Problem{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Create a DHCP server in the Domain controller named dhcp-practice with an IP address of 172.16.0.50"){
	if($Input_Box.Text -eq "Add-DhcpServerInDC -DNSName dhcp-practice -IPAddress 172.16.0.50"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "DHCP #1" ; Description = "Create a DHCP server in the Domain controller named dhcp-practice with an IP address of 172.16.0.50" ; Result = "Add-DhcpServerInDC -DNSName dhcp-practice -IPAddress 172.16.0.50" ; CompletionTime = $Timer ; Date = $Date ; Points = "5"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Create a DHCP server in the Domain controller named dhcp-practice with an IP address of 172.16.0.50"

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    }

	else{

		$Body.Text =  "Create a DHCP server in the Domain controller named dhcp-practice with an IP address of 172.16.0.50"

        $Correct_Incorrect.ForeColor = 'Red'

        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."

        }
	}

	$Input_Box.Clear()
}

## DHCP & DNS #2 (install DNS) ##

$DHCP_DNS_Strip_Menu_Item_Practice_2.Name = "DHCP_DNS_Strip_Menu_Item_Practice_2"
$DHCP_DNS_Strip_Menu_Item_Practice_2.Size = New-Object System.Drawing.Size(152, 22)
$DHCP_DNS_Strip_Menu_Item_Practice_2.Text = "DHCP #2 (scope)"

function On_Click_DHCP_DNS_Strip_Menu_Item_Practice_2($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    if ($OS -notmatch "Windows Server"){

    $MessageBoxTitle = "Incorrect Operating System."

    $MessageBoxBody = "This system is not running Windows Server. You can still practice these problems, but you will not receive proper PowerShell results."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

	$Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "DHCP #2"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Create an active IPv4 DHCP scope named 'test' with a start range of 172.16.0.100, `nend range of 172.16.0.200 and subnet mask of 255.255.255.0"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_DHCP_DNS_Practice_Problem_2})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.serverlab.ca/tutorials/windows/network-services-windows/step-step-creating-windows-server-dhcp-scope/"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Add-DhcpServerV4Scope -name 'test' -StartRange 172.16.0.100 -Endrange 172.16.0.200 -SubnetMask 255.255.255.0 -State Active"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "DHCP #2 (scope) (COMPLETED)" ## Fix this!
	$Title.ForeColor = 'Green' }

	else {

	$Title.Text = "DHCP #2 (scope)"
    $Body.Text = "Create an active IPv4 DHCP scope named 'test' with a start range of 172.16.0.100, `nend range of 172.16.0.200 and subnet mask of 255.255.255.0"

	}

}

function Selected_DHCP_DNS_Practice_Problem_2{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Create an active IPv4 DHCP scope named 'test' with a start range of 172.16.0.100, `nend range of 172.16.0.200 and subnet mask of 255.255.255.0"){
	if($Input_Box.Text -eq "Add-DhcpServerV4Scope -name 'test' -StartRange 172.16.0.100 -Endrange 172.16.0.200 -SubnetMask 255.255.255.0 -State Active"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "DHCP #2" ; Description = "Create an active IPv4 DHCP scope named 'test' with a start range of 172.16.0.100, `nend range of 172.16.0.200 and subnet mask of 255.255.255.0" ; Result = "Add-DhcpServerV4Scope -name 'test' -StartRange 172.16.0.100 -Endrange 172.16.0.200 -SubnetMask 255.255.255.0 -State Active" ; CompletionTime = $Timer ; Date = $Date ; Points = "5"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Create an active IPv4 DHCP scope named 'test' with a start range of 172.16.0.100, `nend range of 172.16.0.200 and subnet mask of 255.255.255.0"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Create an active IPv4 DHCP scope named 'test' with a start range of 172.16.0.100, `nend range of 172.16.0.200 and subnet mask of 255.255.255.0"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## DHCP & DNS #3 (forward lookup zone) ##

$DHCP_DNS_Strip_Menu_Item_Practice_3.Name = "DHCP_DNS_Strip_Menu_Item_Practice_3"
$DHCP_DNS_Strip_Menu_Item_Practice_3.Size = New-Object System.Drawing.Size(152, 22)
$DHCP_DNS_Strip_Menu_Item_Practice_3.Text = "DNS #1 (check install)"

function On_Click_DHCP_DNS_Strip_Menu_Item_Practice_3($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    if ($OS -notmatch "Windows Server"){

    $MessageBoxTitle = "Incorrect Operating System."

    $MessageBoxBody = "This system is not running Windows Server. You can still practice these problems, but you will not receive proper PowerShell results."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

	$Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text = "DNS #1 (check install)"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Check if DNS is installed on this system."

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_DHCP_DNS_Practice_Problem_3})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.hostwinds.com/tutorials/setup-configure-dns-windows-server"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Get-WindowsFeature -Name *DNS*"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "DNS #1 (check install) (COMPLETED)"
	$Title.ForeColor = 'Green'} ## Fix this!

	else {

	$Title.Text = "DNS #1 (check install)"

	}

}

function Selected_DHCP_DNS_Practice_Problem_3{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Check if DNS is installed on this system."){
	if($Input_Box.Text -eq "Get-WindowsFeature -Name *DNS*"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "DNS #1 (check install)" ; Description = "Check if DNS is installed on this system" ; Result = "Get-WindowsFeature -Name *DNS*" ; CompletionTime = $Timer ; Date = $Date ; Points = "1"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Check if DNS is installed on this system."

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Check if DNS is installed on this system."
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## DHCP & DNS #4 ##

$DHCP_DNS_Strip_Menu_Item_Practice_4.Name = "DHCP_DNS_Strip_Menu_Item_Practice_4"
$DHCP_DNS_Strip_Menu_Item_Practice_4.Size = New-Object System.Drawing.Size(152, 22)
$DHCP_DNS_Strip_Menu_Item_Practice_4.Text = "DNS #2 (install DNS)"

function On_Click_DHCP_DNS_Strip_Menu_Item_Practice_4($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    if ($OS -notmatch "Windows Server"){

    $MessageBoxTitle = "Incorrect Operating System."

    $MessageBoxBody = "This system is not running Windows Server. You can still practice these problems, but you will not receive proper PowerShell results."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

	$Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "DNS #1 (check install)"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Install DNS and management tools on this system"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_DHCP_DNS_Practice_Problem_4})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://learn.microsoft.com/en-us/iis/web-hosting/installing-infrastructure-components/dns-server"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Install-WindowsFeature -Name DNS -IncludeManagementTools"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "DNS #2 (install DNS) (COMPLETED)"
	$Title.ForeColor = 'Green'} ## Fix this!

	else {

	$Title.Text = "DNS #2 (install DNS)"

	}

	$Input_Box.Clear()
}

function Selected_DHCP_DNS_Practice_Problem_4{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Install DNS and management tools on this system"){
	if($Input_Box.Text -eq "Install-WindowsFeature -Name DNS -IncludeManagementTools"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "DNS #2 (install DNS)" ; Description = "Install DNS and management tools on this system" ; Result = "Install-WindowsFeature -Name DNS -IncludeManagementTools" ; CompletionTime = $Timer ; Date = $Date ; Points = "1"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Install DNS and management tools on this system"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = $Description
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## DHCP & DNS #5 ##

$DHCP_DNS_Strip_Menu_Item_Practice_5.Name = "DHCP_DNS_Strip_Menu_Item_Practice_5"
$DHCP_DNS_Strip_Menu_Item_Practice_5.Size = New-Object System.Drawing.Size(152, 22)
$DHCP_DNS_Strip_Menu_Item_Practice_5.Text = "DNS #3 (forward lookup zone)"

function On_Click_DHCP_DNS_Strip_Menu_Item_Practice_5($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    if ($OS -notmatch "Windows Server"){

    $MessageBoxTitle = "Incorrect Operating System."

    $MessageBoxBody = "This system is not running Windows Server. You can still practice these problems, but you will not receive proper PowerShell results."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

	$Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "DNS #3 (forward lookup zone)"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Add a forward lookup zone with DynamicUpdate for Eliteshell.org `nwith secure and nonsecure dynamic updates"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_DHCP_DNS_Practice_Problem_5})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.sciencedirect.com/topics/computer-science/forward-lookup-zone"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Add-DnsServerPrimaryZone -Name Eliteshell.org -Zonefile Eliteshell.org.DNS -DynamicUpdate NonsecureAndSecure"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "DNS #3 (forward lookup zone) (COMPLETED)"
	$Title.ForeColor = 'Green'} ## Fix this!

	else {

	$Title.Text = "DNS #3 (forward lookup zone)"

	}
}

function Selected_DHCP_DNS_Practice_Problem_5{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Add a forward lookup zone with DynamicUpdate for Eliteshell.org `nwith secure and nonsecure dynamic updates"){

	if($Input_Box.Text -eq "Add-DnsServerPrimaryZone -Name Eliteshell.org -Zonefile Eliteshell.org.DNS -DynamicUpdate NonsecureAndSecure"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "DNS #3 (forward lookup zone)" ; Description = "Add a forward lookup zone with DynamicUpdate for Eliteshell.org `nwith secure and nonsecure dynamic updates" ; Result = "Add-DnsServerPrimaryZone -Name Eliteshell.org -Zonefile Eliteshell.org.DNS -DynamicUpdate NonsecureAndSecure" ; CompletionTime = $Timer ; Date = $Date ; Points = "4"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Add a forward lookup zone with DynamicUpdate for Eliteshell.org `nwith secure and nonsecure dynamic updates"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Add a forward lookup zone with DynamicUpdate for Eliteshell.org `nwith secure and nonsecure dynamic updates"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

$DHCP_DNS_Strip_Menu_Item_Practice.Add_Click( { On_Click_DHCP_DNS_Strip_Menu_Item_Practice $DHCP_DNS_Strip_Menu_Item_Practice $EventArgs} )

$DHCP_DNS_Strip_Menu_Item_Practice_2.Add_Click( { On_Click_DHCP_DNS_Strip_Menu_Item_Practice_2 $DHCP_DNS_Strip_Menu_Item_Practice_2 $EventArgs} )

$DHCP_DNS_Strip_Menu_Item_Practice_3.Add_Click( { On_Click_DHCP_DNS_Strip_Menu_Item_Practice_3 $DHCP_DNS_Strip_Menu_Item_Practice_3 $EventArgs} )

$DHCP_DNS_Strip_Menu_Item_Practice_4.Add_Click( { On_Click_DHCP_DNS_Strip_Menu_Item_Practice_4 $DHCP_DNS_Strip_Menu_Item_Practice_4 $EventArgs} )

$DHCP_DNS_Strip_Menu_Item_Practice_5.Add_Click( { On_Click_DHCP_DNS_Strip_Menu_Item_Practice_5 $DHCP_DNS_Strip_Menu_Item_Practice_5 $EventArgs} )

$DHCP_DNS_Strip_Menu_Item.DropDownItems.AddRange(@($DHCP_DNS_Strip_Menu_Item_Practice, $DHCP_DNS_Strip_Menu_Item_Practice_2, $DHCP_DNS_Strip_Menu_Item_Practice_3, $DHCP_DNS_Strip_Menu_Item_Practice_4, $DHCP_DNS_Strip_Menu_Item_Practice_5))

## Networking ##

$Networking_Strip_Menu_Item.Name = "Networking_Strip_Menu_Item"
$Networking_Strip_Menu_Item.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item.Text = "Networking"

$Networking_Strip_Menu_Item_Practice.Name = "Networking_Strip_Menu_Item_Practice"
$Networking_Strip_Menu_Item_Practice.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice.Text = "Networking #1 (ip address)"

function On_Click_Networking_Strip_Menu_Item($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #1"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Find the IP address of this machine and all corresponding information"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://usa.kaspersky.com/resource-center/definitions/what-is-an-ip-address"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "ipconfig /all"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Networking #1 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Networking #1"

	}
}

function Selected_Networking_Practice_Problem{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Find the IP address of this machine and all corresponding information"){
	if($Input_Box.Text -eq "ipconfig /all"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #1" ; Description = "Find the IP address of this machine and all corresponding information" ; Result = "ipconfig /all" ; CompletionTime = $Timer ; Date = $Date ; Points = "2"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Find the IP address of this machine and all corresponding information"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Find the IP address of this machine and all corresponding information"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Networking 2 ##

$Networking_Strip_Menu_Item_Practice_2.Name = "Networking_Strip_Menu_Item_Practice_2"
$Networking_Strip_Menu_Item_Practice_2.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice_2.Text = "Networking #2 (ip / dns)"

function On_Click_Networking_Strip_Menu_Item_2($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #2"

	$Title.ForeColor = 'Blue'

	$Body.Text = "View the DNS cache on this system"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem_2})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.cloudns.net/blog/dns-cache-explained/"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "ipconfig /displaydns"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Networking #2 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Networking #2"

	}
}

function Selected_Networking_Practice_Problem_2{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "View the DNS cache on this system"){
	if($Input_Box.Text -eq "ipconfig /displaydns"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #2" ; Description = "View the DNS cache on this system" ; Result = "ipconfig /displaydns" ; CompletionTime = $Timer ; Date = $Date ; Points = "2"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "View the DNS cache on this system"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "View the DNS cache on this system"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Networking 3 ##

$Networking_Strip_Menu_Item_Practice_3.Name = "Networking_Strip_Menu_Item_Practice_3"
$Networking_Strip_Menu_Item_Practice_3.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice_3.Text = "Networking #3 (ip / dns)"

function On_Click_Networking_Strip_Menu_Item_3($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #3"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Flush the DNS cache on this system"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem_3})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://blog.hubspot.com/website/flush-dns"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "ipconfig /flushdns"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Networking #3 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Networking #3"

	}
}

function Selected_Networking_Practice_Problem_3{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Flush the DNS cache on this system"){
	if($Input_Box.Text -eq "ipconfig /flushdns"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #3" ; Description = "Flush the DNS cache on this system" ; Result = "ipconfig /flushdns" ; CompletionTime = $Timer ; Date = $Date ; Points = "2"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Flush the DNS cache on this system"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Flush the DNS cache on this system"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Networking 4 ##

$Networking_Strip_Menu_Item_Practice_4.Name = "Networking_Strip_Menu_Item_Practice_4"
$Networking_Strip_Menu_Item_Practice_4.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice_4.Text = "Networking #4 (ip)"

function On_Click_Networking_Strip_Menu_Item_4($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #4"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Change the ip address of this machine"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem_4})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.tp-link.com/us/support/faq/840/"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "ipconfig /renew"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Networking #4 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Networking #4"

	}
}

function Selected_Networking_Practice_Problem_4{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Change the ip address of this machine"){
	if($Input_Box.Text -eq "ipconfig /renew"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #4" ; Description = "Change the ip address of this machine" ; Result = "ipconfig /renew" ; CompletionTime = $Timer ; Date = $Date ; Points = "2"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Change the ip address of this machine"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Change the ip address of this machine"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Networking 5 ##

$Networking_Strip_Menu_Item_Practice_5.Name = "Networking_Strip_Menu_Item_Practice_5"
$Networking_Strip_Menu_Item_Practice_5.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice_5.Text = "Networking #5 (dhcp / dns)"

function On_Click_Networking_Strip_Menu_Item_5($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #5"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Register (refresh) DHCP leases and DNS names for system network adapters"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem_5})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://social.technet.microsoft.com/Forums/windowsserver/en-US/ad80ec4b-af7a-4d99-b06b-6c7a4013aa39/what-does-quotipconfig-registerdnsquot-actually-do?forum=winserverDS"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "ipconfig /registerdns"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Networking #5 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Networking #5"

	}
}

function Selected_Networking_Practice_Problem_5{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Register (refresh) DHCP leases and DNS names for system network adapters"){
	if($Input_Box.Text -eq "ipconfig /registerdns"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #5" ; Description = "Register (refresh) DHCP leases and DNS names for system network adapters" ; Result = "ipconfig /registerdns" ; CompletionTime = $Timer ; Date = $Date ; Points = "2"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Register (refresh) DHCP leases and DNS names for system network adapters"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Register (refresh) DHCP leases and DNS names for system network adapters"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Networking 6##

$Networking_Strip_Menu_Item_Practice_6.Name = "Networking_Strip_Menu_Item_Practice_6"
$Networking_Strip_Menu_Item_Practice_6.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice_6.Text = "Networking #6 (ports)"

function On_Click_Networking_Strip_Menu_Item_6($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #5"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Find all active listening ports. Hint, don't use the 'netstat' command."

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem_6})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.upguard.com/blog/open-port"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Get-NetTCPConnection"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Networking #6 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Networking #6"

	}
}

function Selected_Networking_Practice_Problem_6{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Find all active listening ports. Hint, don't use the 'netstat' command."){
	if($Input_Box.Text -eq "Get-NetTCPConnection"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #6" ; Description = "Find all active listening ports. Hint, don't use the 'netstat' command." ; Result = "Get-NetTCPConnection" ; CompletionTime = $Timer ; Date = $Date ; Points = "2"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Find all active listening ports. Hint, don't use the 'netstat' command."

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Find all active listening ports. Hint, don't use the 'netstat' command."
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Networking 7 ##

$Networking_Strip_Menu_Item_Practice_7.Name = "Networking_Strip_Menu_Item_Practice_7"
$Networking_Strip_Menu_Item_Practice_7.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice_7.Text = "Networking #7 (traceroute)"

function On_Click_Networking_Strip_Menu_Item_7($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #7"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Using the 'Test-NetConnection' cmdlet, find the traceroute to GitHub.com"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem_7})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.hostinger.com/tutorials/traceroute-command"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Test-NetConnection -ComputerName google.com -TraceRoute"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Networking #7 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Networking #7"

	}
}

function Selected_Networking_Practice_Problem_7{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Using the 'Test-NetConnection' cmdlet, find the traceroute to GitHub.com"){
	if($Input_Box.Text -eq "Test-NetConnection -ComputerName GitHub.com -TraceRoute"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #7" ; Description = "Using the 'Test-NetConnection' cmdlet, find the traceroute to GitHub.com." ; Result = "Test-NetConnection -ComputerName google.com -TraceRoute" ; CompletionTime = $Timer ; Date = $Date ; Points = "3"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Using the 'Test-NetConnection' cmdlet, find the traceroute to GitHub.com"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Using the 'Test-NetConnection' cmdlet, find the traceroute to GitHub.com"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Networking 8 ##

$Networking_Strip_Menu_Item_Practice_8.Name = "Networking_Strip_Menu_Item_Practice_8"
$Networking_Strip_Menu_Item_Practice_8.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice_8.Text = "Networking #8 (wireless network profiles)"

function On_Click_Networking_Strip_Menu_Item_8($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #8"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Complete the 'netsh' command to show all stored WLAN profiles on this machine"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem_8})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.serverwatch.com/guides/netsh-commands/"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "netsh wlan show profiles"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Networking #8 (COMPLETED)"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Networking #8"

	}
}

function Selected_Networking_Practice_Problem_8{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Complete the 'netsh' command to show all stored WLAN profiles on this machine"){
	if($Input_Box.Text -eq "netsh wlan show profiles"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #8" ; Description = "Complete the 'netsh' command to show all stored WLAN profiles on this machine" ; Result = "netsh wlan show profiles" ; CompletionTime = $Timer ; Date = $Date ; Points = "1"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Complete the 'netsh' command to show all stored WLAN profiles on this machine"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Complete the 'netsh' command to show all stored WLAN profiles on this machine"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Networking 9 ##

$Networking_Strip_Menu_Item_Practice_9.Name = "Networking_Strip_Menu_Item_Practice_9"
$Networking_Strip_Menu_Item_Practice_9.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice_9.Text = "Networking #9 (OSI Model - No PowerShell)"
$Networking_Strip_Menu_Item_Practice_9.ForeColor = 'Blue'

function On_Click_Networking_Strip_Menu_Item_9($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #9"

	$Title.ForeColor = 'Blue'

	$OSI_Questions = "What is layer 1 of the OSI Model?", "What is layer 2 of the OSI Model?", "What is layer 3 of the OSI Model?", "What is layer 4 of the OSI Model?", "What is layer 5 of the OSI Model?", "What is layer 6 of the OSI Model?", "What is layer 7 of the OSI Model?"

    $Random_OSI_Question = $OSI_Questions | Get-Random

    $global:Random_OSI_Question = $Random_OSI_Question

	$Body.Text = $Random_OSI_Question
	
    if($Random_OSI_Question -eq "What is layer 1 of the OSI Model?"){
    
    $Correct_Answer = "Physical"

	$global:Correct_Answer = $Correct_Answer
    
    }
    
    if($Random_OSI_Question -eq "What is layer 2 of the OSI Model?"){
  
	$Correct_Answer = "Data Link"

	$global:Correct_Answer = $Correct_Answer
    
    }
    
    if($Random_OSI_Question -eq "What is layer 3 of the OSI Model?"){
    
    $Correct_Answer = "Network"

	$global:Correct_Answer = $Correct_Answer
    
    }
    
    if($Random_OSI_Question -eq "What is layer 4 of the OSI Model?"){
    
    $Correct_Answer = "Transport"

	$global:Correct_Answer = $Correct_Answer
    
    }
    
    if($Random_OSI_Question -eq "What is layer 5 of the OSI Model?"){

	$Correct_Answer = "Session"

	$global:Correct_Answer = $Correct_Answer
    
    }
    
    if($Random_OSI_Question -eq "What is layer 6 of the OSI Model?"){

	$Correct_Answer = "Presentation"

	$global:Correct_Answer = $Correct_Answer
    
    }
    
    if($Random_OSI_Question -eq "What is layer 7 of the OSI Model?"){

	$Correct_Answer = "Application"

	$global:Correct_Answer = $Correct_Answer
    
    }

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem_9})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.imperva.com/learn/application-security/osi-model/"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed_Physical = "Physical"

	$Problem_Completed_Physical_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Physical

	$Problem_Completed_Data_Link = "Data Link"

	$Problem_Completed_Data_Link_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Data_Link

	$Problem_Completed_Network = "Network"

	$Problem_Completed_Network_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Network

	$Problem_Completed_Transport = "Transport"

	$Problem_Completed_Transport_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Transport

	$Problem_Completed_Session = "Session"

	$Problem_Completed_Session_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Session

	$Problem_Completed_Presentation = "Presentation"

	$Problem_Completed_Presentation_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Presentation

	$Problem_Completed_Application = "Application"

	$Problem_Completed_Application_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Application

	if($Problem_Completed_Physical_Check -and $Problem_Completed_Data_Link_Check -and $Problem_Completed_Network_Check -and $Problem_Completed_Transport_Check -and 
	$Problem_Completed_Transport_Check -and $Problem_Completed_Session_Check -and $Problem_Completed_Presentation_Check -and $Problem_Completed_Application_Check -ne $null) {

	$Title.Text = "Networking #9 (COMPLETED)"
	$Title.ForeColor = 'Green'
	
	$Networking_Strip_Menu_Item_Practice_9.Text = 'Networking #9 (OSI Model - No PowerShell)'
	$Networking_Strip_Menu_Item_Practice_9.ForeColor = 'Green'

}
	
	}

	else {

	$Title.Text = "Networking #9"

	}

function Selected_Networking_Practice_Problem_9{

$Answer = @($Input_Box.Text)

if ($Body.Text = $Random_OSI_Question){
	if($Input_Box.Text -eq $Correct_Answer){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #9" ; Description = $Random_OSI_Question ; Result = $Correct_Answer ; CompletionTime = $Timer ; Date = $Date ; Points = "1"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = $Random_OSI_Question

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = $Random_OSI_Question
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

## Networking 10 ##

$Networking_Strip_Menu_Item_Practice_10.Name = "Networking_Strip_Menu_Item_Practice_10"
$Networking_Strip_Menu_Item_Practice_10.Size = New-Object System.Drawing.Size(35, 20)
$Networking_Strip_Menu_Item_Practice_10.Text = "Networking #10 (OSI Model #2 - No PowerShell)"
$Networking_Strip_Menu_Item_Practice_10.ForeColor = 'Blue'

function On_Click_Networking_Strip_Menu_Item_10($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Networking #10"

	$Title.ForeColor = 'Blue'

	$OSI_Questions = "What layer allows hosts and applications to use a common language; `nperforms data formatting, encryption, and compression?", "What layer establishes, maintains, and terminates user connections?", "What layer ensures accurate delivery of data through flow control, segmentation and reassembly, error correction, and acknowledgement?", "What layer establishes network connections; translates network addresses into their physical counterparts and determines routing?", "What layer
    packages data in frames appropriate to network transmission method?", "What layer manages signaling to and from physical network connections?"

    $Random_OSI_Question = $OSI_Questions | Get-Random

    $global:Random_OSI_Question = $Random_OSI_Question

	$Body.Text = $Random_OSI_Question

    if($Random_OSI_Question -eq "What layer allows hosts and applications to use a common language; `nperforms data formatting, encryption, and compression?"){

    $Correct_Answer = "Presentation"

	$global:Correct_Answer = $Correct_Answer

    }

    if($Random_OSI_Question -eq "What layer establishes, maintains, and terminates user connections?"){

	$Correct_Answer = "Session"

	$global:Correct_Answer = $Correct_Answer

    }

    if($Random_OSI_Question -eq "What layer ensures accurate delivery of data through flow control, segmentation and reassembly, error correction, and acknowledgement?"){
    
    $Correct_Answer = "Transport"

	$global:Correct_Answer = $Correct_Answer
    
    }
    
    if($Random_OSI_Question -eq "What layer establishes network connections; translates network addresses into their physical counterparts and determines routing?"){
    
    $Correct_Answer = "Network"

	$global:Correct_Answer = $Correct_Answer
    
    }
    
    if($Random_OSI_Question -eq "What layer packages data in frames appropriate to network transmission method?"){

	$Correct_Answer = "Data Link"

	$global:Correct_Answer = $Correct_Answer
    
    }
    
    if($Random_OSI_Question -eq "What layer manages signaling to and from physical network connections?"){

	$Correct_Answer = "Physical"

	$global:Correct_Answer = $Correct_Answer
    
    }
    

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Networking_Practice_Problem_10})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.imperva.com/learn/application-security/osi-model/"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed_Physical = "Physical"

	$Problem_Completed_Physical_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Physical

	$Problem_Completed_Data_Link = "Data Link"

	$Problem_Completed_Data_Link_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Data_Link

	$Problem_Completed_Network = "Network"

	$Problem_Completed_Network_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Network

	$Problem_Completed_Transport = "Transport"

	$Problem_Completed_Transport_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Transport

	$Problem_Completed_Session = "Session"

	$Problem_Completed_Session_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Session

	$Problem_Completed_Presentation = "Presentation"

	$Problem_Completed_Presentation_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Presentation

	$Problem_Completed_Application = "Application"

	$Problem_Completed_Application_Check = Select-String $Game_Score_File -Pattern $Problem_Completed_Application

	if($Problem_Completed_Physical_Check -and $Problem_Completed_Data_Link_Check -and $Problem_Completed_Network_Check -and $Problem_Completed_Transport_Check -and 
	$Problem_Completed_Transport_Check -and $Problem_Completed_Session_Check -and $Problem_Completed_Presentation_Check -and $Problem_Completed_Application_Check -ne $null) {

	$Title.Text = "Networking #10 (COMPLETED)"
	$Title.ForeColor = 'Green'
	
	$Networking_Strip_Menu_Item_Practice_10.Text = 'Networking #10 (OSI Model #2 - No PowerShell)'
	$Networking_Strip_Menu_Item_Practice_10.ForeColor = 'Green'

}
	
	}

	else {

	$Title.Text = "Networking #10"

	}

function Selected_Networking_Practice_Problem_10{

$Answer = @($Input_Box.Text)

if ($Body.Text = $Random_OSI_Question){
	if($Input_Box.Text -eq $Correct_Answer){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Networking #10" ; Description = $Random_OSI_Question ; Result = $Correct_Answer ; CompletionTime = $Timer ; Date = $Date ; Points = "2"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = $Random_OSI_Question

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = $Random_OSI_Question
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

$Networking_Strip_Menu_Item_Practice.Add_Click( { On_Click_Networking_Strip_Menu_Item $Networking_Strip_Menu_Item_Practice $EventArgs} )

$Networking_Strip_Menu_Item_Practice_2.Add_Click( { On_Click_Networking_Strip_Menu_Item_2 $Networking_Strip_Menu_Item_Practice_2 $EventArgs} )

$Networking_Strip_Menu_Item_Practice_3.Add_Click( { On_Click_Networking_Strip_Menu_Item_3 $Networking_Strip_Menu_Item_Practice_3 $EventArgs} )

$Networking_Strip_Menu_Item_Practice_4.Add_Click( { On_Click_Networking_Strip_Menu_Item_4 $Networking_Strip_Menu_Item_Practice_4 $EventArgs} )

$Networking_Strip_Menu_Item_Practice_5.Add_Click( { On_Click_Networking_Strip_Menu_Item_5 $Networking_Strip_Menu_Item_Practice_5 $EventArgs} )

$Networking_Strip_Menu_Item_Practice_6.Add_Click( { On_Click_Networking_Strip_Menu_Item_6 $Networking_Strip_Menu_Item_Practice_6 $EventArgs} )

$Networking_Strip_Menu_Item_Practice_7.Add_Click( { On_Click_Networking_Strip_Menu_Item_7 $Networking_Strip_Menu_Item_Practice_7 $EventArgs} )

$Networking_Strip_Menu_Item_Practice_8.Add_Click( { On_Click_Networking_Strip_Menu_Item_8 $Networking_Strip_Menu_Item_Practice_8 $EventArgs} )

$Networking_Strip_Menu_Item_Practice_9.Add_Click( { On_Click_Networking_Strip_Menu_Item_9 $Networking_Strip_Menu_Item_Practice_9 $EventArgs} )

$Networking_Strip_Menu_Item_Practice_10.Add_Click( { On_Click_Networking_Strip_Menu_Item_10 $Networking_Strip_Menu_Item_Practice_10 $EventArgs} )

$Networking_Strip_Menu_Item.DropDownItems.AddRange(@($Networking_Strip_Menu_Item_Practice, $Networking_Strip_Menu_Item_Practice_2, $Networking_Strip_Menu_Item_Practice_3, $Networking_Strip_Menu_Item_Practice_4, $Networking_Strip_Menu_Item_Practice_5, $Networking_Strip_Menu_Item_Practice_6, $Networking_Strip_Menu_Item_Practice_7, $Networking_Strip_Menu_Item_Practice_8, $Networking_Strip_Menu_Item_Practice_9, $Networking_Strip_Menu_Item_Practice_10))

## start Windows General menu item ##

$Windows_Registry_Strip_Menu_Item.Name = "Windows_Registry_Strip_Menu_Item"
$Windows_Registry_Strip_Menu_Item.Size = New-Object System.Drawing.Size(35, 20)
$Windows_Registry_Strip_Menu_Item.Text = "Windows Registry"

$Windows_Registry_Strip_Menu_Item_Practice.Name = "Windows_Registry_Strip_Menu_Item_Practice"
$Windows_Registry_Strip_Menu_Item_Practice.Size = New-Object System.Drawing.Size(35, 20)
$Windows_Registry_Strip_Menu_Item_Practice.Text = "Windows Registry #1 (path)"

$Windows_Registry_Strip_Menu_Item_Practice_2.Name = "Windows_Registry_Strip_Menu_Item_Practice_2"
$Windows_Registry_Strip_Menu_Item_Practice_2.Size = New-Object System.Drawing.Size(35, 20)
$Windows_Registry_Strip_Menu_Item_Practice_2.Text = "Windows Registry #2 (root keys)"

function On_Click_Windows_Registry_Strip_Menu_Item($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Windows Registry #1"

	$Title.ForeColor = 'Blue'

	$Body.Text = "Using the set-location cmdlet, set the location to HKey Local Machine's Software subkey"

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Windows_Registry_Practice_Problem})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.digitalcitizen.life/simple-questions-what-are-environment-variables/"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "set-location -path HKLM:SOFTWARE"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Windows Registry #1 ( COMPLETED )"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Windows Registry #1 (path)"

	}
}

function Selected_Windows_Registry_Practice_Problem{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "Using the set-location cmdlet, set the location to HKey Local Machine's Software subkey"){
	if($Input_Box.Text -eq "set-location -path HKLM:SOFTWARE"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Windows Registry #1 (path)" ; Description = "Using the set-location cmdlet, set the location to HKey Local Machine's Software subkey" ; Result = "set-location -path HKLM:SOFTWARE" ; CompletionTime = $Timer ; Date = $Date ; Points = "3"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "Using the set-location cmdlet, set the location to HKey Local Machine's Software subkey"

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "Using the set-location cmdlet, set the location to HKey Local Machine's Software subkey"
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
}

function On_Click_Windows_Registry_Strip_Menu_Item_2($Sender,$e){

    if($Game_Score_File -eq $null){

    $MessageBoxTitle = "No score file loaded."

    $MessageBoxBody = "No game is loaded. Your results will not be recorded."

    $Confirmation = [System.Windows.MessageBox]::Show($MessageBoxBody,$MessageBoxTitle,$ButtonTypeOk,$MessageIconError)

    }

    $Completed_In.Text= ""

    $Correct_Incorrect.Text= ""

	$Timer_Start_Time.Stop()

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

	$global:Timer_Start_Time = $Timer

    $Title.Text= "Windows Registry #2"

	$Title.ForeColor = 'Blue'

	$Body.Text = "List all of the roots available to the Registry PSProvider to see the entry points using the Get-PSDrive cmdlet and a pipe |."

    $Form.Controls.RemoveByKey("The_Submit_Button")

	$The_Submit_Button = New-Object System.Windows.Forms.Button

	$The_Submit_Button.Name = "The_Submit_Button"

	$The_Submit_Button.Text = "Submit"

	$The_Submit_Button.AutoSize = $True

	$The_Submit_Button.Font = 'Verdana,12,style=Bold'

	$The_Submit_Button.ForeColor = 'Blue'

	$The_Submit_Button.Location = New-Object System.Drawing.Point(30,200)

	$The_Submit_Button.Add_Click({Selected_Windows_Registry_Practice_Problem_2})

	$Form.Controls.RemoveByKey("The_Learn_More_Button")

    $The_Learn_More_Button = New-Object System.Windows.Forms.Button

    $The_Learn_More_Button.Name = "The_Learn_More_Button"

    $The_Learn_More_Button.Text = "Learn More"

    $The_Learn_More_Button.AutoSize = $True

    $The_Learn_More_Button.Font = 'Calibri,12,style=Bold'

    $The_Learn_More_Button.ForeColor = 'Blue'

    $The_Learn_More_Button.Location = New-Object System.Drawing.Point(200,200)

    $The_Learn_More_Button.Add_Click({Start-Process "https://www.digitalcitizen.life/simple-questions-what-are-environment-variables/"})

    $Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $The_Submit_Button, $The_Learn_More_Button, $Input_Box))

	$Problem_Completed = "Get-PSDrive -PSProvider 'Registry' | Select-Object -Property Name, Root"

	$Problem_Completed_Check = Select-String $Game_Score_File -Pattern $Problem_Completed

	if($Problem_Completed_Check -ne $null) {
	$Title.Text = "Windows Registry #2 ( COMPLETED )"
	$Title.ForeColor = 'Green'}

	else {

	$Title.Text = "Windows Registry #2 (root keys)"

	}
}

function Selected_Windows_Registry_Practice_Problem_2{

$Answer = @($Input_Box.Text)

Start-Process Powershell -ArgumentList "-NoExit -command ""& $Answer""" -Verb runAs

if ($Body.Text = "List all of the roots available to the Registry PSProvider to see the entry points using the Get-PSDrive cmdlet and a pipe |."){
	if($Input_Box.Text -eq "Get-PSDrive -PSProvider 'Registry' | Select-Object -Property Name, Root"){

	$Time_Elapsed = $Timer_Start_Time.Elapsed

	$Timer = $([string]::Format("`{0:d2}:{1:d2}:{2:d2}",
	$Time_Elapsed.hours,
	$Time_Elapsed.minutes,
	$Time_Elapsed.seconds))

	$New_Row | Add-Content -Path $Game_Score_File

    $New_Row = New-Object PsObject -Property @{Problem = "Windows Registry #2 (root keys)" ; Description = "List all of the roots available to the Registry PSProvider to see the entry points using the Get-PSDrive cmdlet and a pipe |." ; Result = "Get-PSDrive -PSProvider 'Registry' | Select-Object -Property Name, Root" ; CompletionTime = $Timer ; Date = $Date ; Points = "3"}

    $New_Results += $New_Row

    $New_Results | Export-CSV -append $Game_Score_File

	$Timer.Stop

	$CSV_Length = Import-CSV $Game_Score_File | Measure-Object | Select-Object -expand Count

	$global:Number_Of_Correct_Answers = $CSV_Length

	$Total_Number_Of_Answers_Label.Text = "$Number_Of_Correct_Answers total problems solved"

	$CSV_Stuff = Import-CSV -Path $Game_Score_File

	$Total_Score = $CSV_Stuff | Measure-Object Points -Sum | Select-Object -expand Sum | Out-String

	$global:Total_Score = $Total_Score

	$Total_Score_Label.Text = "$Total_Score total points"

	if($Game_Score_File -eq $null){

	$Total_Score_Label.Text = ""
	$Total_Number_Of_Answers_Label.Text = ""
	}

    Invoke-Expression Dropdown_Problem_Completed_Check

    $Body.Text = "List all of the roots available to the Registry PSProvider to see the entry points using the Get-PSDrive cmdlet and a pipe |."

    $Correct_Incorrect.Text = "Correct, your answer was $Answer."

    $Correct_Incorrect.ForeColor = 'Green'
    $Completed_In.Text = "Completed in $Timer"

    }

	else{
		$Body.Text = "List all of the roots available to the Registry PSProvider to see the entry points using the Get-PSDrive cmdlet and a pipe |."
        $Correct_Incorrect.Text = "Incorrect, your answer was $Answer."
        $Correct_Incorrect.ForeColor = 'Red'
        }
	}

	$Input_Box.Clear()
} 

$Windows_Registry_Strip_Menu_Item_Practice.Add_Click( { On_Click_Windows_Registry_Strip_Menu_Item $Windows_Registry_Strip_Menu_Item_Practice $EventArgs} )

$Windows_Registry_Strip_Menu_Item_Practice_2.Add_Click( { On_Click_Windows_Registry_Strip_Menu_Item_2 $Windows_Registry_Strip_Menu_Item_Practice_2 $EventArgs} )

$Windows_Registry_Strip_Menu_Item.DropDownItems.AddRange(@($Windows_Registry_Strip_Menu_Item_Practice, $Windows_Registry_Strip_Menu_Item_Practice_2))

## Active Directory ##

$Active_Directory_Strip_Menu_Item.Name = "Active_Directory_Strip_Menu_Item"
$Active_Directory_Strip_Menu_Item.Size = New-Object System.Drawing.Size(51, 20)
$Active_Directory_Strip_Menu_Item.Text = "Active Directory"

$Form.Controls.AddRange(@($Menu_Bar, $Title, $Body, $EliteShell_Logo, $The_Submit_Button, $The_Learn_More_Button, $Total_Number_Of_Answers_Label, $Total_Score_Label, $Scripts_Purchased_Label, $Total_Unique_Problems_Label, $Score_Box, $Completed_In, $Correct_Incorrect, $Score_File_Information))

## Form dialog
$Form.AutoScale = $true
$Form.AutoScaleMode = "Font"
$Form.ShowDialog()
