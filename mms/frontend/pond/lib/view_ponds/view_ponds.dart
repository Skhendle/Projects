import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:network_app/network_app.dart';
import 'package:pond/responsive_view.dart';

import 'package:timeago/timeago.dart' as timeago;

import 'bloc/view_ponds_bloc.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T? value;
  final String Function(T) getLabel;
  void Function(T?)? onChanged;

  AppDropdownInput({
    Key? key,
    this.hintText = 'Please Select An Option',
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultPadding = 5.0;
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            labelText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

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
                            child: ViewPondCard(
                                data: snapshot
                                    .data[snapshot.data.length - i - 1]),
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
    var screenReader = ScreenReader().screenReader(context);
    List<Widget> view = [
      Expanded(
        flex: 5,
        child: Image.network(
            'https://977a-197-184-172-160.ngrok.io/pond_photo?pond_id=${widget.data.id!}'),
      ),
      Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),

              (widget.data.rating == null)
                  ? Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                          width: 80,
                                          height: 250,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        alignment:
                                                            Alignment.center,
                                                        child: IconButton(
                                                          icon: const Icon(
                                                            Icons.close,
                                                          ),
                                                          iconSize: 25,
                                                          color: Colors.white,
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
                                              const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 25)),
                                              Expanded(
                                                  flex: 5,
                                                  child: BlocProvider(
                                                    create: (context) =>
                                                        ViewPondsBloc(),
                                                    child: BlocListener<
                                                            ViewPondsBloc,
                                                            RatePondsState>(
                                                        listener: (context,
                                                            RatePondsState
                                                                state) {
                                                          if (state
                                                              is RatingResponse) {
                                                            // Navigate to home page
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                duration:
                                                                    const Duration(
                                                                        seconds:
                                                                            5),
                                                                content: Text(
                                                                  state.message,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: state.success
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .red),
                                                                ),
                                                              ),
                                                            );
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        },
                                                        child: FormConnector(
                                                          pondId:
                                                              widget.data.id!,
                                                        )),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(Icons.star_rate),
                            label: const Text("Rate Pond"),
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                              MediaQuery.of(context).size.width,
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
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        alignment:
                                                            Alignment.center,
                                                        child: IconButton(
                                                          icon: const Icon(
                                                            Icons.close,
                                                          ),
                                                          iconSize: 35,
                                                          color: Colors.white,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                              MediaQuery.of(context).size.width,
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
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(25),
                                                        alignment:
                                                            Alignment.center,
                                                        child: IconButton(
                                                          icon: const Icon(
                                                            Icons.close,
                                                          ),
                                                          iconSize: 35,
                                                          color: Colors.white,
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
                          )))
            ],
          ))
    ];

    return Container(
      height: screenReader.deviceType == DeviceType.desktop ? 300 : 600,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: screenReader.deviceType == DeviceType.desktop
          ? Row(
              children: view,
            )
          : Column(
              children: view,
            ),
      color: Colors.lightGreenAccent,
    );
  }
}

class FormConnector extends StatelessWidget {
  const FormConnector({Key? key, required this.pondId}) : super(key: key);
  final int pondId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewPondsBloc, RatePondsState>(
        builder: (context, state) {
      if (state is RatingPond) {
        return const Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ));
      }

      return Container(
        width: double.infinity,
        height: double.infinity,
        child: RatingForm(
          pondId: pondId,
        ),
      );
    });
  }
}

class RatingForm extends StatefulWidget {
  const RatingForm({Key? key, required this.pondId}) : super(key: key);
  final int pondId;

  @override
  State<RatingForm> createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  String? rating;
  @override
  Widget build(BuildContext context) {
    var screenReader = ScreenReader().screenReader(context);
    var dropDownPadding = EdgeInsets.symmetric(
        horizontal: (screenReader.deviceType == DeviceType.desktop
            ? (screenReader.screenSize == ScreenSize.large ? 15 : 10)
            : 5));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: BlocBuilder<ViewPondsBloc, RatePondsState>(
            builder: (context, state) {
              return Padding(
                padding: dropDownPadding,
                child: AppDropdownInput(
                  hintText: "Please Rate 1-5(Bad to Good)",
                  options: const ["1", "2", "3", "4", "5"],
                  value: rating,
                  onChanged: (value) {
                    setState(() {
                      rating = value as String?;
                      context
                          .read<ViewPondsBloc>()
                          .add(UpdatePondRating(rating: rating!));
                    });
                  },
                  getLabel: (String value) => value,
                ),
              );
            },
          ),
        ),
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: BlocBuilder<ViewPondsBloc, RatePondsState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 20),
                        maximumSize: const Size(100, 20),
                      ),
                      onPressed: state.status.isValidated
                          ? () => context
                              .read<ViewPondsBloc>()
                              .add(RatePond(pondId: widget.pondId))
                          : null,
                      child: const Text(
                        'Rate',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                )))
      ],
    );
  }
}
