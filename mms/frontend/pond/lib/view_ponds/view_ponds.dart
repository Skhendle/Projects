import 'package:flutter/material.dart';
import 'package:network_app/network_app.dart';
import 'package:timeago/timeago.dart' as timeago;

class ViewPondsWidget extends StatefulWidget {
  const ViewPondsWidget({Key? key}) : super(key: key);

  @override
  _ViewPondsWidgetState createState() => _ViewPondsWidgetState();
}

class _ViewPondsWidgetState extends State<ViewPondsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<PondModels>> _data;

  @override
  void initState() {
    _data = getData();
    super.initState();
  }

  Future<List<PondModels>> getData() async {
    var repo = GetPondRecordsAPI();
    return await repo.getRecords();
  }

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
        body: FutureBuilder(
          future: _data,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: Container(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 15, 0),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xCF3D77A8).withOpacity(0.5),
                  ),
                  child: RawScrollbar(
                      thumbColor: Colors.white,
                      radius: const Radius.circular(20),
                      thickness: 5,
                      isAlwaysShown: true,
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 5, 15, 5),
                            child: ViewPondCard(data: snapshot.data[i]),
                          );
                        },
                      )),
                ),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ));
            }
          },
        ));
  }
}

class ViewPondCard extends StatefulWidget {
  const ViewPondCard({Key? key, required this.data}) : super(key: key);
  final PondModels data;
  @override
  State<ViewPondCard> createState() => _ViewPondCardState();
}

class _ViewPondCardState extends State<ViewPondCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 50,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Image.network(
                'https://977a-197-184-172-160.ngrok.io/pond_photo?pond_id=${widget.data.id!}'),
          ),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                      child: Text(
                    'Description: ${widget.data.description!}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
                  // Text(data.rating!),
                  (widget.data.rating == null)
                      ? const SizedBox.shrink()
                      : Expanded(
                          child: Text(
                          'Rating: ${widget.data.rating!}/5',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),

                  Expanded(
                    child: Text(
                      'Uploaded: ${timeago.format(widget.data.created!)}',
                      style: const TextStyle(color: Colors.black, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Expanded(
                    child: Text(
                      'Timestamp: ${widget.data.created.toString()}',
                      style: const TextStyle(color: Colors.black, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  (widget.data.rating == null)
                      ? Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.star_rate),
                                label: const Text("Rate Pond"),
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 15),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SimpleDialog(
                                          backgroundColor: Colors.blueAccent,
                                          children: [
                                            SizedBox(
                                              width: 0.75 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              height: 0.8 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(25),
                                                            alignment: Alignment
                                                                .center,
                                                            child: IconButton(
                                                              icon: const Icon(
                                                                Icons.close,
                                                              ),
                                                              iconSize: 35,
                                                              color:
                                                                  Colors.white,
                                                              splashColor:
                                                                  Colors.green,
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                  Expanded(
                                                      flex: 5,
                                                      child: Image.network(
                                                        'https://977a-197-184-172-160.ngrok.io/pond_photo?pond_id=${widget.data.id!}',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                                icon: const Icon(Icons.panorama),
                                label: const Text("View"),
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 15),
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
                            icon: const Icon(Icons.email),
                            label: const Text("Contact me"),
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ))
                ],
              ))
        ],
      ),
      color: Colors.lightGreenAccent,
    );
  }
}
