part of 'view_ponds_bloc.dart';

class RatePondsState extends Equatable {
  const RatePondsState(
      {this.rating = const Name.pure(), this.status = FormzStatus.pure});

  final Name rating;

  final FormzStatus status;
  RatePondsState copyWith({
    Name? rating,
    FormzStatus? status,
  }) {
    return RatePondsState(
      rating: rating ?? this.rating,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [rating];
}

class RatingResponse extends RatePondsState {
  final bool success;
  final String message;

  const RatingResponse(this.success, this.message) : super();
}

class RatingPond extends RatePondsState {}

class RatingInitial extends RatePondsState {}
