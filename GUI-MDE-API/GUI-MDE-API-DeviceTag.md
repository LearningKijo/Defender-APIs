# MDE API GUI - Device tag
The main purpose is to provide the process of adding tags to devices via API calls.<br>
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

## Demo - Device tag
#After downloading ["mde-api-gui.ps1"](https://github.com/microsoft/mde-api-gui/blob/main/mde-api-gui.ps1), run the script on the local PC. <br>
#To connect with MDE API credentials, put Azure AD Tenant ID, Application ID and Application Secret.  

![image](https://user-images.githubusercontent.com/120234772/217184215-eb1fdfc9-87a4-4b63-8dc9-25f148779691.png)
> Figure 1. MDE API GUI | Connection
<br>

Ex) KQL query for targeting devices.
```
DeviceInfo 
| where OSPlatform in ("Windows10", "Windows11")
| where DeviceName startswith "win"
| distinct DeviceId, DeviceName
```
#To be sure, run the above query in Microsoft 365 Defender, Advanced Hunting.
![image](https://user-images.githubusercontent.com/120234772/217186076-0b8aae08-3342-499f-a8bb-9ce063a7b71a.png)
> Figure 2. the output of the above query
<br>

#After selecting "AH Query" and enter the query, click "Get Devices".<br>
#Confirm selection in PowerShell forms pop-up.
![image](https://user-images.githubusercontent.com/120234772/217187021-aada3fb6-ce23-4050-b00c-18313c7f7f4d.png)
> Figure 3. "AH Query" in MDE API GUI
<br>

![image](https://user-images.githubusercontent.com/120234772/217191791-0085b75b-fc3b-47bf-8612-714249241c2f.png)
> Figure 4. PowerShell - device selection

#Put a device tag which you want to add to devices and click "Apply Tag".<br>
#In this case, put "API" as a device tag.

![image](https://user-images.githubusercontent.com/120234772/217773436-9c9f3273-22df-4bb8-9181-7bf57eb6f3a4.png)
> Figure 5. MDE API GUI | Apply Tag

#After clicking "Apply Tag", you can confirm the device tag in Microsoft 365 Defender portal.<br>

![image](https://user-images.githubusercontent.com/120234772/217193632-f89c37c1-1303-40c6-bbe9-d238feb26a4d.png)
> Figure 6. Device page in Microsoft 365 Defender portal
<br>

#Also, you can confirm whether API has successfully done or not in "4 - Logs".
```
4 - Logs :
2/7/2023 5:20:22 PM Successfully connected to Tenant ID: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
2/7/2023 5:20:57 PM Executing query: DeviceInfo 
| where OSPlatform in ("Windows10", "Windows11")
| where DeviceName startswith "win"
| distinct DeviceId, DeviceName
Query results returned: 5
2/7/2023 5:22:56 PM Devices selected count: 5
win10-21h-detection-test
win10b
win10a
win10-21h1-asr
win11a
2/7/2023 5:30:45 PM Applying machine tag: API Machine Name: win10-21h-detection-test Status code: 200
2/7/2023 5:30:48 PM Applying machine tag: API Machine Name: win10b Status code: 200
2/7/2023 5:30:51 PM Applying machine tag: API Machine Name: win10a Status code: 200
2/7/2023 5:30:54 PM Applying machine tag: API Machine Name: win10-21h1-asr Status code: 200
2/7/2023 5:31:09 PM Applying machine tag: API Machine Name: win11a Status code: 200
```

#### Disclaimer 
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
