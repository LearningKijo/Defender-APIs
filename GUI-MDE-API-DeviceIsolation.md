# MDE API GUI - Device Isolation
The main purpose is to provide the process of isolating devices from the network via API calls.<br>
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

## Demo - Device Isolation
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

![image](https://user-images.githubusercontent.com/120234772/217971516-4406ae6f-0285-4250-b888-a760a92141f3.png)

![image](https://user-images.githubusercontent.com/120234772/217971757-f344710b-30ec-476d-b208-bd12d47e0d11.png)

![image](https://user-images.githubusercontent.com/120234772/217972351-a6390762-9ec6-4b55-8cba-6d6a2cbc08dc.png)

![image](https://user-images.githubusercontent.com/120234772/217972455-3202d2a6-ca36-4fc4-ba96-6e2426540de3.png)

```
4 - Logs :
2/10/2023 9:40:10 AM Successfully connected to Tenant ID: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Quering 2 machines from CSV file.
2/10/2023 9:41:02 AM Devices selected count: 2
WIN10-21H-DETECTION-TEST
VM1CYBERLAB
2/10/2023 9:41:21 AM Selective Isolation on:  Machine Name: WIN10-21H-DETECTION-TEST Status code: 201
2/10/2023 9:41:25 AM Selective Isolation on:  Machine Name: VM1CYBERLAB Status code: 201
 Releasing isolation on:  Machine Name: WIN10-21H-DETECTION-TEST Status code: 201
 Releasing isolation on:  Machine Name: VM1CYBERLAB Status code: 201
```

#--- Big thank you for support, Mutsumi N.
#### Disclaimer 
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
