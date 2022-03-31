import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_ponds_event.dart';
part 'view_ponds_state.dart';

class ViewPondsBloc extends Bloc<ViewPondsEvent, ViewPondsState> {
  ViewPondsBloc() : super(ViewPondsInitial()) {
    on<ViewPondsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
