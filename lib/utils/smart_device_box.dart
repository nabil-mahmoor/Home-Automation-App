import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool isPowerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.deviceName,
    required this.iconPath,
    required this.isPowerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: isPowerOn ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 15,
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(
          15.0,
          15.0,
          10.0,
          15.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  iconPath,
                  height: 45,
                  color: isPowerOn ? Colors.grey[300] : Colors.grey[800],
                ),

                // switch
                Transform.scale(
                  scale: 0.8,
                  child: Switch.adaptive(
                    value: isPowerOn,
                    onChanged: onChanged,
                    activeTrackColor: Colors.grey[200],
                    activeColor: Colors.grey[900],
                    inactiveTrackColor: Colors.grey[200],
                    inactiveThumbColor: Colors.grey[600],
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // device name
                Text(
                  deviceName,
                  style: GoogleFonts.poppins(
                    color: isPowerOn ? Colors.grey[300] : Colors.grey[800],
                  ),
                ),

                // active status
                Text(
                  isPowerOn ? 'on  ' : 'off  ',
                  style: GoogleFonts.poppins(
                    color: isPowerOn ? Colors.grey[300] : Colors.grey[800],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
