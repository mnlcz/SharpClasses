using module './ClassType.psm1'

class Interface : ClassType
{
    static [bool]Check([string]$className)
    {
        $secondChar = $className[1]
        return $className.StartsWith("I") -and $secondChar -ceq "$secondChar".ToUpper()
    }

    static [void]Logic([string]$class, [string]$namespace)
    {
        $template = "interface.cs"
        Copy-Item -Path $PSScriptRoot\Templates\$template -Destination .
        $Content = Get-Content .\$template
        $Content.Replace("_NAMESPACE_", $namespace).Replace("_CLASS_", $class) | Set-Content .\$class.cs
        Remove-Item .\$template
    }
}
