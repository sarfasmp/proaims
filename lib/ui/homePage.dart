import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proaims/apiModel/ApiModel.dart';
import 'package:proaims/provider/detailsListProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  Publiccard? publiccard;
  HomePage({this.publiccard});

  @override
  Widget build(BuildContext context) {
    var detailPro = Provider.of<DetailListProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text("Public card search"),
        backgroundColor: Colors.indigo[100],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: detailPro.text1,
                    onChanged: (val) {
                      detailPro.onTextChange(val);
                    },
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      //border: OutlineInputBorder(),
                      hintText: 'Search',
                    ),
                  ),
                ),
                IconButton(
                    splashColor: Colors.black,
                    onPressed: () {},
                    icon: Icon(Icons.search))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          detailPro.text1.text.isEmpty
              ? Expanded(child: SizedBox())
              : Expanded(
                  child: FutureBuilder(
                      future: detailPro.text1.text.isNotEmpty &&
                              detailPro.text1.text.toLowerCase() == "clea"
                          ? detailPro.fetchData(
                              serviceName: detailPro.text1.text)
                          : null,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container(
                              height: size.height,
                              child:
                                  Center(child: CircularProgressIndicator()));
                        } else {
                          List<Publiccard> detailList =
                              snapshot.data as List<Publiccard>;
                          return ListView(
                              children: detailList
                                  .asMap()
                                  .entries
                                  .map(
                                    (e) => GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/detailList",
                                            arguments: HomePage(
                                              publiccard: detailList[e.key],
                                            ));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        height: 150,
                                        child: Card(
                                          color: Colors.lightBlueAccent,
                                          elevation: 50,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 10,
                                                bottom: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              "Name",
                                                              style: TextStyle(
                                                                  fontSize: 20),
                                                            ),
                                                            Text(e.value.email
                                                                .toString()),
                                                          ],
                                                        ),
                                                      ),
                                                      CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor:
                                                            Colors.black,
                                                        backgroundImage:
                                                            NetworkImage(e.value
                                                                .profilepic
                                                                .toString()),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.phone_in_talk),
                                                    Text(e.value.phonenumber
                                                        .toString()),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList());
                        }
                      }),
                ),
        ],
      ),
    );
  }
}
