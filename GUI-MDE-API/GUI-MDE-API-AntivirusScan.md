# MDE API GUI - Antivirus Scan
The main purpose is to provide the process of initiating antivirus scan to devices via API calls.<br>
Before starting MDE API GUI, please create [Azure AD application](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/apis-intro?view=o365-worldwide).

## MDE API GUI - [Usage](https://github.com/microsoft/mde-api-gui#usage)
1. Connect with AAD Tenant ID, Application Id and Application Secret of the application created earlier.
2. Get Devices that you want to perform actions on, using one of the following methods:
      - Advanced Hunting query (query result should contain DeviceName and DeviceId fields)
      - CSV file (single Name column with machine FQDNs)
      - Devices list separated with commas
3. Confirm selection in PowerShell forms pop-up.
4. Choose action that you want to perform on Selected Devices, the following actions are currently available:
      - Specify device tag in text box and Apply tag.
      - Run AV Scan.
      - Isolate/Release device.
5. Verify actions result with Logs text box.

## Demo - Antivirus Scan
#After downloading ["mde-api-gui.ps1"](https://github.com/microsoft/mde-api-gui/blob/main/mde-api-gui.ps1), run the script on the local PC. <br>
#To connect with MDE API credentials, put Azure AD Tenant ID, Application ID and Application Secret.  

![image](https://user-images.githubusercontent.com/120234772/217184215-eb1fdfc9-87a4-4b63-8dc9-25f148779691.png)
> Figure 1. MDE API GUI | Connection
<br>

Ex) KQL query for targeting devices.
```
let InfectedDevice = AlertEvidence
| where isnotempty(DeviceId) and isnotempty(DeviceName)
| project AlertId, DeviceId, DeviceName;
AlertInfo
| where ServiceSource == "Microsoft Defender for Endpoint"
| where Severity in ("Medium", "High")
| join InfectedDevice on AlertId
| project DeviceId, name = toupper(DeviceName)
| distinct DeviceId, name
```
#In Advanced Hunting, Microsoft 365 Defender, run the query and export it as a CSV file.<br>
**[Important]** - Column name must be "name" or "Name" 

![image](https://user-images.githubusercontent.com/120234772/217770684-7e22b5fb-f891-42df-b5fb-9bf9cbd97167.png)
> Figure 2. Advanced Hunting | Export

#Enter a csv file directory path and click "Get Devices".<br>
#Confirm selection in PowerShell forms pop-up.

![image](https://user-images.githubusercontent.com/120234772/217771553-0cdd33fb-893b-4381-994d-aeb12da38de7.png)
> Figure 3. "CSV" in MDE API GUI

![image](https://user-images.githubusercontent.com/120234772/217772067-14a05781-e22e-4f0c-be41-68cbf7299fed.png)
> Figure 4. PowerShell - device selection

#Select "Quick Scan" and click "AV Scan".<br>

![image](https://user-images.githubusercontent.com/120234772/217774152-435a83ed-80f5-4b2b-af4c-4963f3fdfd05.png)
> Figure 5. MDE API GUI | AV Scan

#You can confirm the logs in Action Center, Advanced Hunting query and Device Timeline in Microsoft 365 Defender portal.

![image](https://user-images.githubusercontent.com/120234772/217968585-aba1a8df-ce4f-43dc-ad6b-60c8faa4de66.png)
> Figure 6. Microsoft 365 Defender | Action Center

![image](https://user-images.githubusercontent.com/120234772/217969093-341bcf83-8091-4ac7-afd9-be453f96a402.png)
> Figure 7. Microsoft 365 Defender | Advanced Hunting

![image](https://user-images.githubusercontent.com/120234772/217969959-1578933e-0a43-495a-b41f-62bc9f3f3c65.png)
> Figure 8. Microsoft 365 Defender | Device Timeline

```
4 - Logs :
2/10/2023 9:11:42 AM Successfully connected to Tenant ID: 27913275-bca3-4f30-80b8-10d9e631cf40
Quering 2 machines from CSV file.
2/10/2023 9:12:45 AM Devices selected count: 2
WIN10-21H-DETECTION-TEST
VM1CYBERLAB
2/10/2023 9:12:55 AM Quick AV Scan on Machine Name: WIN10-21H-DETECTION-TEST Status code: 201
2/10/2023 9:12:58 AM Quick AV Scan on Machine Name: VM1CYBERLAB Status code: 201
```


#--- Big thank you for support, Mutsumi N.
#### Disclaimer 
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
