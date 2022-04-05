import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:network_app/network_app.dart';
import 'package:pond/upload_page/models/name.dart';

part 'view_ponds_event.dart';
part 'view_ponds_state.dart';

class ViewPondsBloc extends Bloc<RatePondEvent, RatePondsState> {
  ViewPondsBloc() : super(RatingInitial()) {
    on<UpdatePondRating>(_onPondRatingChanged);
    on<RatePond>(_onRatePond);
  }

  void _onPondRatingChanged(
      UpdatePondRating event, Emitter<RatePondsState> emit) {
    final rating = Name.dirty(event.rating);

    emit(state.copyWith(
        rating: rating,
        status: Formz.validate(
          [const Name.dirty('Updated')],
        )));
  }

  Future<void> _onRatePond(RatePond event, Emitter<RatePondsState> emit) async {
    final rating = Name.dirty(state.rating.value);
    final pondId = event.pondId;

    emit(state.copyWith(
      rating: rating,
      status: Formz.validate([rating]),
    ));

    if (state.status.isValidated) {
      // Display progress indicator
      emit(RatingPond());
      var repo = RatePondAPI();

      try {
        var response = await repo.getRecords(pondId, rating.value);

        emit(RatingResponse(true, response.toString()));
      } catch (e) {
        emit(const RatingResponse(false, 'Failed To Submit Rating'));
      }
    }
  }
}
