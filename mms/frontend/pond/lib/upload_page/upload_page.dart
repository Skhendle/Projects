// import 'dart:html';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:pond/responsive_view.dart';
import 'package:pond/upload_page/models/image_data.dart';

import 'bloc/upload_bloc.dart';

class UploadPageWidget extends StatefulWidget {
  final File? image;
  final ImageData? imageData;
  const UploadPageWidget({Key? key, this.image, this.imageData})
      : super(key: key);

  @override
  _UploadPageWidgetState createState() => _UploadPageWidgetState();
}

class _UploadPageWidgetState extends State<UploadPageWidget> {
  // @override
  // void initState()  {
  // }

  // @override
  // void dispose() {}

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
          "Upload Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xCF3D77A8),
      body: BlocBuilder<UploadBloc, UploadState>(
        builder: (context, state) {
          if (state is UploadingPond) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ));
          }

          if (state is UploadResponse) {
            return SizedBox(
                height: 150,
                width: 300,
                child: Center(
                  child: Text(' Upload Response \n ${state.message}'),
                ));
          }

          return Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30, 25, 30, 10),
                    width: double.infinity,
                    height: double.infinity,
                    child: (kIsWeb)
                        ? Image.network(widget.image!.path)
                        : Image.file(File(widget.image!.path)),
                  )),
              Expanded(
                flex: 2,
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: UploadForm(imageData: widget.imageData!)),
              ),
            ],
          );
        },
      ),
    );
  }
}

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
    var defaultPadding = 8.0;
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

class UploadForm extends StatefulWidget {
  UploadForm({Key? key, this.imageData}) : super(key: key);
  ImageData? imageData;

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  String? description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: BlocBuilder<UploadBloc, UploadState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppDropdownInput(
                  hintText: "Please Select Pond Condition",
                  options: const [
                    "Excellent",
                    "Good",
                    "Normal",
                    "Bad",
                    "Awful"
                  ],
                  value: description,
                  onChanged: (value) {
                    setState(() {
                      description = value as String?;
                      context.read<UploadBloc>().add(UpdatedPondDescription(
                          description: description!,
                          imageData: widget.imageData!));
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
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BlocBuilder<UploadBloc, UploadState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.status.isValidated
                          ? () => context.read<UploadBloc>().add(UploadPond())
                          : null,
                      child: const Text('Update'),
                    );
                  },
                )))
      ],
    );
  }
}
