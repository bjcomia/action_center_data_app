import 'dart:io';
import 'package:action_center_data_app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  @override
  void initState() {
    super.initState();
    // _determinePosition();
  }

  @override
  void dispose() {
    super.dispose();
    myMapController.dispose();
  }

  bool mapControllerInitialized = false;
  var currentLatitude = 0.0;
  var currentLongitude = 0.0;
  final reportFormGlobalKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  List<File?> mediaTemps = [null, null, null];
  final MapController myMapController = MapController();

  TileLayer get openStreetMapTileLayer => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      );

  //Capture Media Function
  Future<void> captureMedia(int index) async {
    try {
      final capturedImage = await picker.pickImage(source: ImageSource.camera);
      if (capturedImage == null) return;

      setState(() {
        mediaTemps[index] = File(capturedImage.path);
      });
    } catch (e) {
      print(e);
    }
  }

  //Get Location Function
  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        // forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.high);
    setState(
      () {
        currentLatitude = position.latitude;
        currentLongitude = position.longitude;

        print(currentLatitude);
        print(currentLongitude);
        print(mapControllerInitialized);

        mapControllerInitialized = true;
      },
    );

    // determineLiveLocation();
  }

  //Get Live Location
  void determineLiveLocation() {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 20);
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      setState(() {
        currentLatitude = position.latitude;
        currentLongitude = position.longitude;

        print(currentLatitude);
        print(currentLongitude);
        print(mapControllerInitialized);

        if (mapControllerInitialized == true) {
          myMapController.move(LatLng(currentLatitude, currentLongitude), 17);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Report Form"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: reportFormGlobalKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Photos',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                const SizedBox(height: 5),

                // Media Picker
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mediaTemps.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                          borderRadius: BorderRadius.circular(20),
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .shadow
                                  .withOpacity(0.4),
                              offset: const Offset(1, 1),
                              blurRadius: 3,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        margin: const EdgeInsets.all(5),
                        width: 250.0,
                        child: mediaTemps[index] != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  mediaTemps[index]!,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : IconButton(
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 50,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer,
                                ),
                                onPressed: () {
                                  captureMedia(index);
                                },
                              ),
                      );
                    },
                  ),
                ),

                //Location
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Location',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),

                Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary),
                    child: currentLatitude == 0.0 && currentLatitude == 0.0
                        ? ElevatedButton(
                            onPressed: () {
                              _determinePosition();
                            },
                            child: Text("Get Location"))
                        // const Center(child: CircularProgressIndicator())
                        : FlutterMap(
                            mapController: myMapController,
                            options: MapOptions(
                                initialCenter:
                                    LatLng(currentLatitude, currentLongitude),
                                initialZoom: 16.5,
                                interactionOptions: const InteractionOptions(
                                    flags: InteractiveFlag.none)
                                ),
                            children: [
                              openStreetMapTileLayer,
                              MarkerLayer(
                                  alignment: Alignment.center,
                                  markers: [
                                    Marker(
                                        alignment: Alignment.center,
                                        point: LatLng(
                                            currentLatitude, currentLongitude),
                                        child: Icon(
                                          Icons.location_pin,
                                          size: 50,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ))
                                  ])
                            ],
                          )),

                //Incident Type (Dropdown)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Incident Type',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),

                //Description of Incident
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onPrimary,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text(
                      'Username',
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // emailFinal = value!;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 40),
                      foregroundColor: Theme.of(context).colorScheme.tertiary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    if (reportFormGlobalKey.currentState!.validate()) {
                      reportFormGlobalKey.currentState!.save();
                      reportFormGlobalKey.currentState!.reset();

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const MainPage();
                      }));
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
