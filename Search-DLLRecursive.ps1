## User Defined
$start = "C:\Program Files (x86)\VstPlugins";
$save = "C:\temp";

## Main
$search,$plugin = $null;
$output = @(); cd $start;
$gather = Get-ChildItem *.dll -Filter * -Recurse;

foreach ($plugin in $gather)
{
    $search = New-Object System.Object;
    $search | Add-Member -MemberType NoteProperty -Name FileName -Value $plugin.FullName;
    $search | Add-Member -MemberType NoteProperty -Name FileVersion -Value $plugin.VersionInfo.FileVersion;
    $search | Add-Member -MemberType NoteProperty -Name ProductName -Value $plugin.VersionInfo.ProductName;
    $search | Add-Member -MemberType NoteProperty -Name ProductVersion -Value $plugin.VersionInfo.ProductVersion;
    $search | Add-Member -MemberType NoteProperty -Name CompanyName -Value $plugin.VersionInfo.CompanyName;
    $output += $search;
}

$output | Out-File -FilePath "$save\pluginInfo.txt" -Force;
explorer /select,"$save\pluginInfo.txt";