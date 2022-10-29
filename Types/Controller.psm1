using module './ClassType.psm1'

class Controller : ClassType
{
    static [bool]Check([string]$className)
    {
        return $className.EndsWith("Controller")
    }

    static [void]Logic([string]$class, [string]$namespace)
    {
        $template = "controller.cs"
        Copy-Item -Path $PSScriptRoot\Templates\$template -Destination .
        $Content = Get-Content .\$template
        $Content.Replace("_NAMESPACE_", $namespace).Replace("_CLASS_", $class) | Set-Content .\$class.cs
        Remove-Item .\$template
    }
}
