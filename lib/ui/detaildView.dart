import 'package:flutter/material.dart';
import 'package:proaims/ui/homePage.dart';

class DetailedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomePage;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[100],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            color: Colors.lightBlue,
            height: size.height / (3.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(args.publiccard!.name.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.phone),
                          color: Colors.black,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.save),
                          color: Colors.black,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.mail),
                          color: Colors.black,
                        ))
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.indigo,
            child: Center(
              child: Text("Personal Details"),
            ),
          ),
          ListTile(
            enabled: true,
            title: Text("Phone"),
            subtitle: Text(args.publiccard!.phonenumber.toString()),
            onTap: () {},
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
            enabled: true,
            title: Text("Email"),
            subtitle: Text(args.publiccard!.email.toString()),
            onTap: () {},
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
            enabled: true,
            title: Text("Position"),
            subtitle: Text(args.publiccard!.position.toString()),
            onTap: () {},
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
            enabled: true,
            title: Text("Company"),
            subtitle: Text(args.publiccard!.company.toString()),
            onTap: () {},
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
            enabled: true,
            title: Text("Address"),
            subtitle: Text(args.publiccard!.address.toString()),
            onTap: () {},
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          ListTile(
            enabled: true,
            title: Text("Other phone number"),
            subtitle: Text(args.publiccard!.userphone.toString()),
            onTap: () {},
          ),
          Divider(
            height: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
