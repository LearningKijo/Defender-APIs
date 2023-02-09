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
| distinct DeviceId, DeviceName
```

![image](https://user-images.githubusercontent.com/120234772/217682938-d980b794-52e8-4ca0-aaa5-c204f93ede3c.png)
