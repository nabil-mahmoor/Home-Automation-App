import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_app/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // icon size
  final double iconSize = 38.0;

  // border size
  final double borderSize = 1.0;

  // padding constants
  final double horizontalPadding = 30.0;
  final double verticalPadding = 20.0;

  // smart device list
  List mySmartDevices = [
    // [deviceName, iconPath, activeStatus]
    [' Light', 'assets/icons/light.png', true],
    [' Door', 'assets/icons/door.png', false],
    [' AC', 'assets/icons/ac.png', false],
    [' Fan', 'assets/icons/fan.png', true],
  ];

  // toggle power button
  void powerSwitchToggle(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom appbar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Icon(
                    Icons.person_pin,
                    size: iconSize,
                    color: Colors.grey[900],
                  ),

                  // profile icon
                  Icon(
                    Icons.dark_mode,
                    size: iconSize,
                    color: Colors.grey[900],
                  )
                ],
              ),
            ),

            // welcome heading
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Welcome Home',
                      style: GoogleFonts.poppins(
                        fontSize: 20.0,
                        color: Colors.grey[600],
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      'Nabil Mahmoor',
                      style: GoogleFonts.outfit(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: verticalPadding * 2),

            // smart devices
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Smart Devices',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.grey[900],
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 0.8,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    deviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    isPowerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchToggle(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
