import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

import '../../models/profits_model.dart';


part 'profits_state.dart';

class ProfitsCubit extends Cubit<ProfitsState> {
  ProfitsCubit() : super(ProfitsInitial());

  static ProfitsCubit get(context)=>BlocProvider.of(context);
  final PagingController<int, PartnersOrders> pagingController =
  PagingController(firstPageKey: 0);

  }



