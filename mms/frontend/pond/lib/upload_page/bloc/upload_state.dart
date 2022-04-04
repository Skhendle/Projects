// ignore_for_file: unnecessary_this

part of 'upload_bloc.dart';

class UploadState extends Equatable {
  const UploadState(
      {this.description = const Name.pure(),
      this.imageData,
      this.status = FormzStatus.pure});

  final Name description;
  final ImageData? imageData;
  final FormzStatus status;
  UploadState copyWith({
    Name? description,
    ImageData? imageData,
    FormzStatus? status,
  }) {
    return UploadState(
      description: description ?? this.description,
      imageData: imageData ?? this.imageData,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [description, imageData!, status];
}

class UploadResponse extends UploadState {
  final bool success;
  final String message;

  const UploadResponse(this.success, this.message) : super();
}

class UploadingPond extends UploadState {}

class UploadInitial extends UploadState {}
