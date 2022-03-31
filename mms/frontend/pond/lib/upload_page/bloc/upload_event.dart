part of 'upload_bloc.dart';



abstract class UploadEvent extends Equatable {
  const UploadEvent();

  @override
  List<Object> get props => [];
}

class UpdatedPondDescription extends UploadEvent {
  const UpdatedPondDescription({required this.description, required this.image});

  final String description;
  final File image;

  @override
  List<Object> get props => [description, image];
}

class UploadPond extends UploadEvent {}
