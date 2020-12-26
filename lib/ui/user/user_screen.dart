import 'package:flutter/material.dart';
import 'package:konsuldok/ui/drawer/app_drawer.dart';
import 'package:konsuldok/ui/widget/user_hero_widget.dart';

class UserScreen extends StatelessWidget {
  UserScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                UserHeroWidget(),
              ],
            ),

            cardDetail('Makan Siang', 'Beli Makan Di Warteg', '10.000', 'out'),
            // cardDetail('Bonus', 'Dapat Bonus Proyek', '500.000', 'in'),
            // cardDetail('Beli Baju', 'Baju Kemeja Kantor', '250.000', 'out'),
          ],
        ),
      ),
    );
  }
}

Widget cardDetail(title, description, price, type) {
  return Card(
    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
    elevation: 8,
    child: ListTile(
      leading: Icon(
        type == 'out'
            ? Icons.subdirectory_arrow_left
            : Icons.subdirectory_arrow_right,
        color: type == 'out' ? Colors.redAccent : Colors.lightGreen,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
      trailing: Text(
        "Rp " + price,
        style: TextStyle(
            color: type == 'out' ? Colors.redAccent : Colors.lightGreen),
      ),
    ),
  );
}
