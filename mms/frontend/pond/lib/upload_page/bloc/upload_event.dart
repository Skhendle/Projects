part of 'upload_bloc.dart';



abstract class UploadEvent extends Equatable {
  const UploadEvent();

  @override
  List<Object> get props => [];
}

class UpdatedPondDescription extends UploadEvent {
  const UpdatedPondDescription({required this.description, required this.imageData});

  final String description;
  final ImageData imageData;

  @override
  List<Object> get props => [description, imageData];
}

class UploadPond extends UploadEvent {}
