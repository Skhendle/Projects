import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 15, 0),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xCF3D77A8).withOpacity(0.5),
                ),
                child: Scrollbar(
                  isAlwaysShown: true,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: const [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Card(
                          child: SizedBox(
                            height: 125,
                            width: 100,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.lightGreenAccent,
                          elevation: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
