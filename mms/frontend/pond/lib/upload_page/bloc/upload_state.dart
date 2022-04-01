// ignore_for_file: unnecessary_this

part of 'upload_bloc.dart';

class UploadState extends Equatable {
  const UploadState(
      {this.description = const Name.pure(),
      this.image,
      this.status = FormzStatus.pure});

  final Name description;
  final File? image;
  final FormzStatus status;
  UploadState copyWith({
    Name? description,
    File? image,
    FormzStatus? status,
  }) {
    return UploadState(
      description: description ?? this.description,
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [description, image!, status];
}

class UploadResponse extends UploadState {
  final bool success;
  final String message;

  const UploadResponse(this.success, this.message) : super();
}

class UploadingPond extends UploadState {}

class UploadInitial extends UploadState {}
