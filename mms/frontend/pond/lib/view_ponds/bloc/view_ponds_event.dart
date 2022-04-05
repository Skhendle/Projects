part of 'view_ponds_bloc.dart';

abstract class RatePondEvent extends Equatable {
  const RatePondEvent();

  @override
  List<Object> get props => [];
}

class UodatePondRating extends RatePondEvent {
  const UodatePondRating({required this.rating});
  final String rating;


  @override
  List<Object> get props => [rating];
}

class RatePond extends RatePondEvent {
  const RatePond({required this.pondId});

    final int pondId;

  @override
  List<Object> get props => [pondId];
}
