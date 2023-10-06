import 'package:flutter/material.dart';

class VolunteeringCard extends StatelessWidget {
  const VolunteeringCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white, // Shadow color
              spreadRadius: 5, // How far the shadow should spread
              blurRadius: 7, // How blurry the shadow should be
              offset: const Offset(0, 3), // Offset in the x and y direction
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/Imagen.png'),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  color: Colors.amber,
                  width: 200,
                  child: const Text('Un Techo para mi País',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          letterSpacing: 0.15)),
                )),
          ],
        ),
      ),
    );
  }
}
