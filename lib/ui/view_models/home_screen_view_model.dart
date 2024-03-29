import '/app/commands/base/i_command.dart';
import '/app/commands/get_date_ranged_data_command.dart';
import '/data/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenViewModel extends RxController {
  late final RxList<DataModel> _dataList;
  List<DataModel> get dataList => _dataList;
  void addDataToList(List<DataModel> d) {
    _dataList.addAll(d);
    _dataList.refresh();
  }

  late DateTime startDate;
  late bool isTodayIncluded = false;
  int get dayCount => isTodayIncluded ? 10 : 11;
  DateTime get endDate => startDate.add(Duration(days: dayCount));

  late final IBaseCommand getDateRangedDataCommand;

  late final ScrollController scrollController;

  HomeScreenViewModel() {
    startDate = DateTime.now().add(const Duration(days: -10));
    isTodayIncluded = true;
    _dataList = <DataModel>[].obs;
    getDateRangedDataCommand = GetDateRangedDataCommand();
    getDateRangedDataCommand.doExecute({'vm': this});

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        startDate = endDate.add(const Duration(days: -20));
        getDateRangedDataCommand.doExecute({'vm': this});
      }
    });
  }
}
