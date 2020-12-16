import 'package:flutter/material.dart';
import 'package:taskmon/ui/drawer/app_drawer.dart';

class DropDownFlutter extends StatefulWidget {
  @override
  _DropDownFlutterState createState() => _DropDownFlutterState();
}

class _DropDownFlutterState extends State<DropDownFlutter> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<ListItem> _dropdownItems1 = [
    ListItem(1, "BMW"),
    ListItem(2, "Audi"),
    ListItem(3, "Jaguar"),
    ListItem(4, "Volvo")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems1;
  ListItem _selectedItem1;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    _dropdownMenuItems1 = buildDropDownMenuItems(_dropdownItems1);
    _selectedItem1 = _dropdownMenuItems1[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleSpacing: 0.0,
        centerTitle: true,
        title: Text(
          'Drop Down Menu',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ),
        //   onPressed: () => Navigator.pop(context),
        // ),
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ListItem>(
                  value: _selectedItem,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    // print(value.name);
                    setState(() {
                      _selectedItem = value;
                    });
                  }),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(right: 20.0, left: 20.0, top: 7.0, bottom: 7.0),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red.withOpacity(0.4),
              border: Border.all(color: Colors.red),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ListItem>(
                  value: _selectedItem1,
                  items: _dropdownMenuItems1,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem1 = value;
                    });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
