# Microsoft Security & Defender APIs 
<img src="https://img.shields.io/badge/M365D-APIs-142787.svg?logo=microsoft&style=popout"> <img src="https://img.shields.io/badge/MDE-APIs-142783.svg?logo=microsoft&style=popout"> <img src="https://img.shields.io/badge/PowerShell-%235391FE.svg?&style=popout&logo=powershell&logoColor=white" /> <img src="https://img.shields.io/badge/-Python-FFFFFF.svg?logo=python&style=popout"> <br>
In the beginning, there are a number of APIs such as Microsoft 365 Defender, Microsoft Defender for Endpoint, Microsoft Graph and so on in Microsoft Security.

| Product  | API |
| ------------- | ------------- |
| Microsoft Defender for Endpoint | - [Microsoft Defender for Endpoint APIs](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/apis-intro?view=o365-worldwide) |
| Microsoft 365 Defender | - [Incident APIs](https://learn.microsoft.com/en-us/microsoft-365/security/defender/api-incident?view=o365-worldwide) <br> - [Advanced Hunting API](https://learn.microsoft.com/en-us/microsoft-365/security/defender/api-advanced-hunting?view=o365-worldwide) <br> - [Streaming API](https://learn.microsoft.com/en-us/microsoft-365/security/defender/streaming-api?view=o365-worldwide) |
> Figure 1. Supported APIs in Microsoft 365 Defender & Microsoft Defender for Endpoint

### Best practices for leveraging Microsoft 365 Defender API
1. Best practices for leveraging Microsoft 365 Defender API's - [Episode One](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/best-practices-for-leveraging-microsoft-365-defender-api-s/ba-p/2102893)
2. Best practices for leveraging Microsoft 365 Defender API's - [Episode Two](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/best-practices-for-leveraging-microsoft-365-defender-api-s/ba-p/2198820)
3. Best practices for leveraging Microsoft 365 Defender API's - [Episode Three](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/best-practices-for-leveraging-microsoft-365-defender-api-s/ba-p/2290463)


## GUI for MDE API sample app
By advanced hunting KQL query, Computer name or CSV file, MDE API GUI calls APIs to automate incident response actions 
such as antivirus scan, device isolation and device tag.<br>

> Reference
> 1. [Simple GUI for Microsoft Defender for Endpoint API machine actions in PowerShell](https://github.com/microsoft/mde-api-gui)
> 2. [Build custom incident response actions with Microsoft 365 Defender APIs](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/build-custom-incident-response-actions-with-microsoft-365/ba-p/3710552)

| Machine action  | Link |
| :------------- | :------------- |
| Add machine tags | [GUI-MDE-API-DeviceTag.md](https://github.com/LearningKijo/Defender-APIs/blob/main/GUI-MDE-API/GUI-MDE-API-DeviceTag.md) |
| Run antivirus scan | [GUI-MDE-API-AntivirusScan.md](https://github.com/LearningKijo/Defender-APIs/blob/main/GUI-MDE-API/GUI-MDE-API-AntivirusScan.md) |
| Isolate machine | [GUI-MDE-API-DeviceIsolation.md](https://github.com/LearningKijo/Defender-APIs/blob/main/GUI-MDE-API/GUI-MDE-API-DeviceIsolation.md) |

## Power Automate / Azure Logic App 
Power Automate and Azure Logic App are cloud-based automation tools from Microsoft that allow users to create and automate workflows, integrating applications and services across platforms and systems, with Power Automate being a low-code option and Azure Logic App offering advanced customization and Azure integration.

**Power Automate folder** : [Power-Automate](https://github.com/LearningKijo/Defender-APIs/tree/main/Power-Automate)

![image](https://user-images.githubusercontent.com/120234772/223157118-f2068eb5-0b10-4031-94a7-d11db752ffb6.png)
> Power Automate portal

## MSTICPy
MSTICPy is a Python library of Cybersecurity tools built by Microsoft, which provides threat hunting and investigation functionality.

> Reference
> 1. GitHub : [MSTIC Jupyter and Python Security Tools](https://github.com/microsoft/msticpy)<br>
> 2. MSTIC docs : [MSTIC Jupyter and Python Security Tools](https://msticpy.readthedocs.io/en/latest/GettingStarted.html)

**MSTICPy GitHub repo** : [LearningKijo | MSTICPy](https://github.com/LearningKijo/MSTICPy)

## PowerBI & Defenders 
#WIP

#--- Big thank you for support, Mutsumi N.
#### Disclaimer 
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
