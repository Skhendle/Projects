// ignore_for_file: unnecessary_this

part of 'upload_bloc.dart';


class UploadState extends Equatable {
  const UploadState(
      {this.description = const Name.pure(), this.image,this.status = FormzStatus.pure});

  final Name description;
  final File? image;
  final FormzStatus status;
  UploadState copyWith({
    Name? systemRole,
    File? image,
    FormzStatus? status,
  }) {
    return UploadState(
      description: systemRole ?? this.description,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [description, status];
}

class SystemRoleUpdateResponse extends UploadState {
  final bool success;
  final String message;

  const SystemRoleUpdateResponse(this.success, this.message) : super();
}

class UpdatingSystemRole extends UploadState {}

class UploadInitial extends UploadState {}
