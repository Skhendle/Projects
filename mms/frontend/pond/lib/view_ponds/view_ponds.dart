import 'package:flutter/material.dart';
import 'package:network_app/network_app.dart';

var testList = [
  {
    "created": "Mon, 04 Apr 2022 16:13:59 GMT",
    "description": "Bad",
    "id": 1,
    "rating": null
  },
  {
    "created": "Mon, 04 Apr 2022 16:14:13 GMT",
    "description": "Normal",
    "id": 2,
    "rating": null
  },
  {
    "created": "Mon, 04 Apr 2022 16:14:24 GMT",
    "description": "Normal",
    "id": 3,
    "rating": null
  },
  {
    "created": "Mon, 04 Apr 2022 16:14:37 GMT",
    "description": "Normal",
    "id": 4,
    "rating": null
  },
  {
    "created": "Mon, 04 Apr 2022 16:14:50 GMT",
    "description": "Bad",
    "id": 5,
    "rating": null
  },
  {
    "created": "Mon, 04 Apr 2022 16:15:04 GMT",
    "description": "Normal",
    "id": 6,
    "rating": null
  }
];

class ViewPondsWidget extends StatefulWidget {
  const ViewPondsWidget({Key? key}) : super(key: key);

  @override
  _ViewPondsWidgetState createState() => _ViewPondsWidgetState();
}

class _ViewPondsWidgetState extends State<ViewPondsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "View Ponds",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      key: scaffoldKey,
      backgroundColor: const Color(0xCF3D77A8),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 15, 0),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xCF3D77A8).withOpacity(0.5),
          ),
          child: RawScrollbar(
              thumbColor: Colors.white,
              radius: Radius.circular(20),
              thickness: 5,
              isAlwaysShown: true,
              child: ListView.builder(
                itemCount: testList.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 15, 5),
                    child: ViewPondCard(data: PondModels.fromJson(testList[i])),
                  );
                },
              )),
        ),
      ),
    );
  }
}

class ViewPondCard extends StatelessWidget {
  const ViewPondCard({Key? key, required this.data}) : super(key: key);
  final PondModels data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 300,
      width: 50,
      child: Card(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Image.network(
                  'https://369e-197-229-149-81.ngrok.io/pond_photo?pond_id=${data.id!}'),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(data.description!),
                    // Text(data.rating!),
                    Text(data.created.toString())
                  ],
                )),
            Expanded(
                flex: 1,
                child: (data.rating == null)
                    ? Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.email),
                              label: Text("Contact 1"),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.email),
                              label: Text("Contact 2"),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                          ))
                        ],
                      )
                    : Center(
                        child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.email),
                          label: Text("Contact me"),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 15),
                          ),
                        ),
                      )))
          ],
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.lightGreenAccent,
        elevation: 10,
      ),
    );
  }
}
