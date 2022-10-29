# Ideally this should be an interface. 
# PS does not have abstract classes so I simulated one following this guide https://xainey.github.io/2016/powershell-classes-and-concepts/#abstract-classes
class ClassType
{
    ClassType()
    {
        $type = $this.GetType()

        if ($type -eq [ClassType])
        {
            throw("Must override method")
        }
    }

    static [bool]Check([string]$className)
    {
        throw("Must override method")
    }

    static [void]Logic([string]$class, [string]$namespace)
    {
        throw("Must override method")
    }
}

