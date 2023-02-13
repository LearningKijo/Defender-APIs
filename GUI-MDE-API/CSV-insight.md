# CSV - GetDevicesFromCsv
When you select CSV in the MDE GUI API, you might receive an error like this. As you can see the error, there is a problem in [code:779].

![image](https://user-images.githubusercontent.com/120234772/218354084-1a8b55cf-7caf-47c4-b924-ff7fc1982f8b.png)
> Figure 1. An error in PowerShell 


[code:775] was written - $machine.Name. Therefore, in CSV file, column name must be "name", "Name" or "NAME".

![image](https://user-images.githubusercontent.com/120234772/218352863-c763cf3d-abd2-42b9-82c9-9e01e0752b7d.png)
> Figure 2. function GetDevicesFromCsv, mde-api-gui.ps1 | Visual Studio Code
<br>


#--- Big thank you for support, Mutsumi N.
#### Disclaimer 
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
