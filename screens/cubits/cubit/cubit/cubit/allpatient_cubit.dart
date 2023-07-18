import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'allpatient_state.dart';

class AllpatientCubit extends Cubit<AllpatientState> {
  AllpatientCubit() : super(AllpatientInitial());
}
