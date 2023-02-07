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
