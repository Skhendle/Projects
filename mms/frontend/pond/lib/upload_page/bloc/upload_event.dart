part of 'upload_bloc.dart';



abstract class UploadEvent extends Equatable {
  const UploadEvent();

  @override
  List<Object> get props => [];
}

class UpdatedPondDescription extends UploadEvent {
  const UpdatedPondDescription({required this.description});

  final String description;

  @override
  List<Object> get props => [description];
}

class UploadPond extends UploadEvent {}
