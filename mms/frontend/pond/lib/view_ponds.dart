import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      key: scaffoldKey,
      backgroundColor: Color(0xCF3D77A8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: IconButton(
                    // borderColor: Colors.transparent,
                    // borderRadius: 30,
                    // borderWidth: 1,
                    // buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                      size: 50,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(50, 10, 50, 0),
                child: Container(
                  width: double.infinity,
                  height: 600,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
