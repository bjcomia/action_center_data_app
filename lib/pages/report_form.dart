import 'dart:io';
import 'package:action_center_data_app/pages/main_page.dart';
import 'package:action_center_data_app/tempData/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:quickalert/quickalert.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    myMapController.dispose();
  }

  bool mapControllerInitialized = false;
  bool isLoading = false;
  bool isOthers = false;
  List<File?> mediaTemps = [null, null, null];
  String? incidentType;
  String? incidentDescription;
  String? otherType;
  var currentLatitude = 0.0;
  var currentLongitude = 0.0;
  final reportFormGlobalKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
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
      //CHANGE THIS TO ERROR HANDLING
      return;
    }
  }

  //Get Location Function
  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    setState(() {
      isLoading = true;
    });
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
        mapControllerInitialized = true;
        isLoading = false;
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

        // print(currentLatitude);
        // print(currentLongitude);
        // print(mapControllerInitialized);

        if (mapControllerInitialized == true) {
          myMapController.move(LatLng(currentLatitude, currentLongitude), 17);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop == true) {
          return;
        }
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          headerBackgroundColor: Theme.of(context).colorScheme.primary,
          customAsset: 'images/question2.gif',
          text: "Your changes will not be saved",
          title: "Warning",
          showCancelBtn: true,
          confirmBtnText: 'Yes',
          cancelBtnText: 'No',
          confirmBtnColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          titleColor: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.secondary,
          onConfirmBtnTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MainPage()),
                (Route<dynamic> route) => false);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text("Report Form"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: reportFormGlobalKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Photos',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),

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
                        margin: const EdgeInsets.only(
                            top: 2, left: 8, bottom: 8, right: 4),
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
                Container(
                  padding: const EdgeInsets.all(8),
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
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: currentLatitude == 0.0 && currentLatitude == 0.0
                      ? isLoading
                          ? SizedBox(
                              height: 80,
                              width: 80,
                              child: CircularProgressIndicator(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                strokeWidth: 5,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer),
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
                              child: ElevatedButton.icon(
                                label: const Text("Get Location"),
                                icon: const Icon(Icons.my_location),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(300, 50),
                                    foregroundColor: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  _determinePosition();
                                },
                              ),
                            )
                      : Container(
                          height: 400,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
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
                          child: FlutterMap(
                            mapController: myMapController,
                            options: MapOptions(
                                initialCenter:
                                    LatLng(currentLatitude, currentLongitude),
                                initialZoom: 16.5,
                                interactionOptions: const InteractionOptions(
                                    flags: InteractiveFlag.none)),
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                ),

                //Incident Type (Dropdown)
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 13),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Incident Type',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    hint: Text(
                      'Select Incident Type',
                      style: GoogleFonts.poppins(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                    ),
                    items: incidentTypes
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return ' Please select an Incident Type';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(
                        () {
                          incidentType = value!;
                          if (value == "Others") {
                            isOthers = true;
                          } else {
                            isOthers = false;
                          }
                        },
                      );
                    },
                    onSaved: (value) {
                      incidentType = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15),
                  ),
                ),

                isOthers
                    ? Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        margin: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Please specify the type of incident: ", style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                            TextFormField(
                              decoration: InputDecoration(
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: 'E.g. Earthquake Damages, ...',
                                alignLabelWithHint: true,
                                labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    fontSize: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 15),
                              validator: (value) {
                                if (isOthers &&
                                    (value == null || value.isEmpty)) {
                                  return 'Please specify the incident type.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                otherType = value;
                              },
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                    
                //Description of Incident
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Brief Description of the Incident',
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLength: 250,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15),
                    onSaved: (value) {
                      incidentDescription = value.toString();
                    },
                  ),
                ),

                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 40),
                    foregroundColor: Theme.of(context).colorScheme.tertiary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    if (reportFormGlobalKey.currentState!.validate()) {
                      if (mediaTemps.every((file) => file == null)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please capture at least one photo.'),
                          ),
                        );
                        return;
                      }
                      if (currentLatitude == 0.0 && currentLongitude == 0.0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please get your location by pressing the button.'),
                          ),
                        );
                        return;
                      }

                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        customAsset: 'images/question2.gif',
                        headerBackgroundColor: Theme.of(context).colorScheme.primary,
                        title: "Confirmation",
                        text: "Do you want to submit the report?",
                        confirmBtnText: 'Yes',
                        cancelBtnText: 'No',
                        confirmBtnColor: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        titleColor: Theme.of(context).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.secondary,
                        barrierDismissible: false,
                        onConfirmBtnTap: () async {
                          reportFormGlobalKey.currentState!.save();
                          if (!context.mounted) return;
                          Navigator.pop(context);
                          await QuickAlert.show(
                              context: context,
                              type: QuickAlertType.loading,
                              title: 'Loading',
                              text: 'Sending your data',
                              customAsset: 'images/loading2.gif',
                              disableBackBtn: true,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              titleColor:
                                  Theme.of(context).colorScheme.secondary,
                              textColor:
                                  Theme.of(context).colorScheme.secondary,
                              autoCloseDuration: const Duration(seconds: 5));

                          if (!context.mounted) return;
                          await QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            confirmBtnText: "Okay",
                            text: "Report sent successfully",
                            confirmBtnColor:
                                Theme.of(context).colorScheme.primary,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            titleColor: Theme.of(context).colorScheme.secondary,
                            textColor: Theme.of(context).colorScheme.secondary,
                            disableBackBtn: true,
                            onConfirmBtnTap: () {
                              // reportFormGlobalKey.currentState!.reset();

                              // print(mediaTemps);
                              // print("$currentLatitude, $currentLongitude");
                              // print(incidentType);
                              // print(otherType);
                              // print(incidentDescription);
                              if (!context.mounted) return;
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const MainPage(),
                                  ),
                                  (Route<dynamic> route) => false);
                            },
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
