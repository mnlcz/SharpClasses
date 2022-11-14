using module './Types/ClassType.psm1'
using module './Types/Default.psm1'
using module './Types/Interface.psm1'
using module './Types/Validator.psm1'
using module './Types/Test.psm1'
using module './Types/Controller.psm1'

Param
(
    [Parameter(Mandatory = $True, Position = 0)]
    [String]$Class,

    [Parameter(Mandatory = $False, Position = 1)]
    [String]$Flag = ""
)

# Set $Namespace to current folder name. For example in "./OtherFolder/ProjectName" $Namespace will be "ProjectName"
$Namespace = Split-Path -Path $pwd -Leaf

# "Force" param is used to force the usage of the default template, ignoring naming conventions
if ($Flag -eq "Force")
{
    [Default]::Logic($Class, $Namespace)
    Exit
}

# Place here all the types that should be checked
[object[]]$types = [Interface], [Validator], [Test], [Controller]

# Flag used to verify if any of $types checks with $Class
[bool]$any = $false

foreach ($t in $types)
{
    if ($t::Check($Class))
    {
        $t::Logic($Class, $Namespace)
        $any = $true
        break
    }
}

# If no $type checks use [Default] template
if (-not $any)
{
    [Default]::Logic($Class, $Namespace)
}

