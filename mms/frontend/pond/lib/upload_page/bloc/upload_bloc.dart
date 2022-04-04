import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:pond/upload_page/models/image_data.dart';
import 'package:pond/upload_page/models/name.dart';
import 'package:network_app/network_app.dart';
part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc() : super(UploadInitial()) {
    on<UpdatedPondDescription>(_onPondDescriptionChanged);
    on<UploadPond>(_onUploadImage);
  }

  void _onPondDescriptionChanged(
      UpdatedPondDescription event, Emitter<UploadState> emit) {
    final description = Name.dirty(event.description);
    final image = event.imageData;
    emit(state.copyWith(
      description: description,
      imageData: image,
      status: Formz.validate([description]),
    ));
  }

  Future<void> _onUploadImage(
      UploadPond event, Emitter<UploadState> emit) async {
    final description = Name.dirty(state.description.value);
    final imageData = state.imageData;

    emit(state.copyWith(
      description: description,
      imageData: imageData,
      status: Formz.validate([description]),
    ));

    if (state.status.isValidated) {
      // Display progress indicator
      emit(UploadingPond());
      var repo = AddPondAPI();
      var response = await repo.addPondRecord(
          imageData!.list, imageData.fileName, description.value);
      // print(response);
      // print(await image!.readAsBytes());

      try {} catch (e) {
        emit(UploadResponse(false, e.toString()));
      }
    }
  }
}
