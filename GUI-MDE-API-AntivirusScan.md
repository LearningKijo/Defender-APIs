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
![image](https://user-images.githubusercontent.com/120234772/217770684-7e22b5fb-f891-42df-b5fb-9bf9cbd97167.png)

![image](https://user-images.githubusercontent.com/120234772/217771553-0cdd33fb-893b-4381-994d-aeb12da38de7.png)

![image](https://user-images.githubusercontent.com/120234772/217772067-14a05781-e22e-4f0c-be41-68cbf7299fed.png)

![image](https://user-images.githubusercontent.com/120234772/217774152-435a83ed-80f5-4b2b-af4c-4963f3fdfd05.png)


```
4 - Logs :
2/9/2023 6:22:20 PM Successfully connected to Tenant ID: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Quering 2 machines from CSV file.
2/9/2023 6:27:01 PM Devices selected count: 2
WIN10-21H-DETECTION-TEST
VM1CYBERLAB
2/9/2023 6:28:28 PM Quick AV Scan on Machine Name: WIN10-21H-DETECTION-TEST Status code: 201
2/9/2023 6:28:31 PM Quick AV Scan on Machine Name: VM1CYBERLAB Status code: 201
```


#--- Big thank you for support, Mutsumi N.
#### Disclaimer 
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
