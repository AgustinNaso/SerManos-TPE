import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/volunteering_card.dart';

class PostulateScreen extends StatelessWidget {
  const PostulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(children: [
        Text('Voluntariados'),
        VolunteeringCard(),
        VolunteeringCard(),
      ]),
    );
  }
}
