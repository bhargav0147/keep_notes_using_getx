# keep_notes_using_getx

A new Flutter project.


## Getting Started

<p>
<img src="https://github.com/bhargav0147/keep_notes_using_getx/assets/119872080/af533040-bad7-461a-8eb5-127a677756c8" height="20%" width="30%" >
<img src="https://github.com/bhargav0147/keep_notes_using_getx/assets/119872080/4c79d31a-e420-4cbc-8897-95ea76ead98e" height="20%" width="30%" >
<img src="https://github.com/bhargav0147/keep_notes_using_getx/assets/119872080/50748b40-546c-45e5-8528-b2f29b9bb0e6" height="20%" width="30%" >
</p>

```xml
## AndroidMainfest 

<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

```xml
## Get Lat Log 

permission = await Geolocator.checkPermission();
if (permission == LocationPermission.denied) {
await Geolocator.requestPermission();
} else {
Position position = await Geolocator.getCurrentPosition(
desiredAccuracy: LocationAccuracy.high);
print(controller.lat.value = position.latitude);
controller.lat.value = position.latitude;
controller.log.value = position.longitude;
}
```

```xml
## Get Address 

List<Placemark> placeList = await placemarkFromCoordinates(
controller.lat.value, controller.log.value);
controller.currentLoc.value = placeList[1];
```

```xml
## Get Live Map 

<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />

<meta-data android:name="com.google.android.geo.API_KEY"
           android:value="YOUR API KEY"/>

GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(
controller.lat.value, controller.log.value),zoom: 11));
```
