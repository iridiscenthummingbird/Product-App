import 'package:flutter_bloc/flutter_bloc.dart';

extension ErrorHandler on Future {
  Future withErrorHandler(Cubit cubit) {
    catchError((Object error) {
      // ignore: invalid_use_of_protected_member
      cubit.addError(error);
    });

    return this;
  }
}
