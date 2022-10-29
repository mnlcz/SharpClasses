using module './ClassType.psm1'

class Default : ClassType
{
    static [bool]Check([string]$className)
    {
        return $true
    }

    static [void]Logic([string]$class, [string]$namespace)
    {
        $template = "class.cs"
        Copy-Item -Path $PSScriptRoot\Templates\$template -Destination .
        $Content = Get-Content .\$template
        $Content.Replace("_NAMESPACE_", $namespace).Replace("_CLASS_", $class) | Set-Content .\$class.cs
        Remove-Item .\$template
    }
}
