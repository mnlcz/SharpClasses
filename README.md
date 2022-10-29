# SharpClasses
SharpClasses is a script that handles the creation of C# classes using naming conventions.

# Features
Currently the scripts supports:
- *Interfaces*
- *[xUnit](https://xunit.net/) tests*
- *[FluentValidation](https://docs.fluentvalidation.net/en/latest/) validators*
- *[ASP.MVC](https://learn.microsoft.com/en-us/aspnet/mvc/overview/older-versions-1/controllers-and-routing/aspnet-mvc-controllers-overview-cs) controllers*

# How to use
```ps1
nc.ps1 <Name> <Optional Flag>
```

The script decides which template is going to use based on the naming conventions that `Name` follows. Here are the rules:
- **Interfaces**: `Name` must start with "I" + an upper case letter.
    - Example: `nc.ps1 IAnimal`
- **xUnit tests**: `Name` must contain the word "Test"
    - Example: `nc.ps1 UnitTest`
- **Validator**: `Name` must end with the word "Validator"
    - Example: `nc.ps1 ClientValidator`
- **Controller**: `Name` must end with the word "Controller"
    - Example: `nc.ps1 HomeController`

**If `Name` does not match with the previous conventions the script will use the default template.**

## Optional flag
If for a particular reason you don't want to follow the convention, you can add the second parameter `Force` to **force the usage of the default template**. For example:
```ps1
nc.ps1 UnitTest Force
```
- This will ignore that the name follow the *xUnit* naming convention.