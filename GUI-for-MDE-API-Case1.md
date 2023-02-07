### flows


![image](https://user-images.githubusercontent.com/120234772/217184215-eb1fdfc9-87a4-4b63-8dc9-25f148779691.png)

```
DeviceInfo 
| where OSPlatform in ("Windows10", "Windows11")
| where DeviceName startswith "win"
| distinct DeviceId, DeviceName
```
![image](https://user-images.githubusercontent.com/120234772/217186076-0b8aae08-3342-499f-a8bb-9ce063a7b71a.png)

![image](https://user-images.githubusercontent.com/120234772/217187021-aada3fb6-ce23-4050-b00c-18313c7f7f4d.png)

![image](https://user-images.githubusercontent.com/120234772/217191791-0085b75b-fc3b-47bf-8612-714249241c2f.png)

![image](https://user-images.githubusercontent.com/120234772/217192593-349c03b5-058f-48f4-b730-fe2160dac64c.png)

![image](https://user-images.githubusercontent.com/120234772/217193632-f89c37c1-1303-40c6-bbe9-d238feb26a4d.png)


```
4 - Logs :
2/7/2023 5:20:22 PM Successfully connected to Tenant ID: 27913275-bca3-4f30-80b8-10d9e631cf40
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
