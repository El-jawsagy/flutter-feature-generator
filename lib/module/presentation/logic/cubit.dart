
const String stub = """

import '/features/{ModuleName}_feature/domain/model/{ModuleName}_model.dart';
import '/features/{ModuleName}_feature/domain/use_cases/{ModuleName}_use_case.dart';
import '{ModuleName}_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {Module}Cubit extends Cubit<{Module}States> {
  {Module}Cubit(this._repo) : super({Module}StateInit());

  static {Module}Cubit get(context) => BlocProvider.of(context);

  final {Module}UesCases _repo;
  List<{Module}Model> {ModuleName}List = [];

  ///pagination
  int page = 1;
  late ScrollController scrollController;
  bool hasMoreData = false;



  ///details model 
  {Module}Model? {ModuleName}DetailsItem;
  
  
  Future onRefresh() async {
    await get{Module}List();
  }

  void setupScrollController() {
    if (scrollController.offset >
            scrollController.position.maxScrollExtent - 200 &&
        scrollController.offset <= scrollController.position.maxScrollExtent) {
      if (state is! {Module}LoadingMoreDateState && hasMoreData) {
        whenScroll{Module}Pagination();
      }
    }
  }

  /// Pagination Function
  whenScroll{Module}Pagination() async {
    emit({Module}LoadingMoreDateState());

    page = page + 1;
    var result = await _repo.getListOf{Module}(page: page);
    result.fold((error) => emit({Module}ErrorMoreDateState(error: error)),
        ({ModuleName}ListData) {
      var tempList = {ModuleName}ListData;
      hasMoreData = tempList.length == 10;
      {ModuleName}List.addAll(tempList);
      emit({Module}SuccessMoreDateState());
    });
  }

  /// Get All {Module} List
  get{Module}List() async {
    emit({Module}LoadingState());
    page = 1;
    var result = await _repo.getListOf{Module}(page: page);
    result.fold((error) => emit({Module}ErrorState()),
        ({ModuleName}ListData) {
      {ModuleName}List = {ModuleName}ListData;
      hasMoreData = {ModuleName}List.length == 10;
      if ({ModuleName}List.isEmpty) {
        emit({Module}EmptyState());
      } else {
        emit({Module}SuccessState());
      }
    });
  }
  
  get{Module}ItemDetails({Module}Model {ModuleName}Item) async {
    emit(Get{Module}ItemDetailsLoadingState());
    var result = await _repo.get{Module}ItemDetails({ModuleName}Item: {ModuleName}Item);
    result.fold((error) => emit(Get{Module}ItemDetailsErrorState(error: error)),
        (responseWithItemDetails) {
      {ModuleName}DetailsItem = responseWithItemDetails;
      emit(Get{Module}ItemDetailsSuccessState());
    });
  }
}
""";
