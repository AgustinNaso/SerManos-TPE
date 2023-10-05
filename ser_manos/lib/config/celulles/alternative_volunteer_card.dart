import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        cardTheme: CardTheme(color: Colors.white),
      ),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(15),
        elevation: 10,

        child: Column(
          children: <Widget>[
            
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                'assets/images/Imagen.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(
                'Accion social',
                style: TextStyle(color: Colors.grey[700]),
              ),
              subtitle: Text(
                  'Un techo para mi pais',
                  style: TextStyle(fontSize: 20),

                  ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {},
              ),
              ],
            )
          ],
        ),
      )
    );
  }
}
