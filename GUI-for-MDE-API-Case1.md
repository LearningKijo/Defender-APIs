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
