# SharpClasses
***SharpClasses*** is a script that handles the creation of C# classes using naming conventions. It also handles the *namespace* and the *usings*.

# Features
Currently the scripts supports:
- *Interfaces*
- *[xUnit](https://xunit.net/) tests*
- *[FluentValidation](https://docs.fluentvalidation.net/en/latest/) validators*
- *[ASP.MVC](https://learn.microsoft.com/en-us/aspnet/mvc/overview/older-versions-1/controllers-and-routing/aspnet-mvc-controllers-overview-cs) controllers*

# How to use
```ps1
New-Class <Name> <Optional Flag>
```
- `Name`: name of the class you want to create. This will also be the filename.
- `Optional Flag`: read Optional Flag explanation below.

## Naming rules
The script decides which template is going to use based on the naming conventions that `Name` follows. Here are the rules:
- **Interfaces**: `Name` must start with "I" + an upper case letter.
    - Example: *IAnimal*
- **xUnit tests**: `Name` must contain the word "Test"
    - Example: *UnitTest*
- **Validator**: `Name` must end with the word "Validator"
    - Example: *ClientValidator*
- **Controller**: `Name` must end with the word "Controller"
    - Example: *HomeController*

## Important information
- **If `Name` does not match with the previous conventions the script will use the default template.**
- The namespace will be named the same way as the folder that is executing the script.
- The templates that use aditional libraries (*xUnit*, *FluentValidation*) assume that you already added the *NuGet* packages to the project.

## Optional flag
If for a particular reason you don't want to follow the convention, you can add the second parameter `Force` to **force the usage of the default template**. For example:
```ps1
New-Class UnitTest Force
```
- This will ignore that the name follows the *xUnit* naming convention.

# TODO
- Change the main implementation to use `CmdletBinding()`.
- Add logic to handle missing dependencies.
    - Option 1: manually editing the `.csproj` file.
    - Option 2: running `dotnet add package <PACKAGE>`.
