import '/app/commands/base/i_command.dart';
import '/data/repisotories/base/i_data_repository.dart';
import '/ui/view_models/home_screen_view_model.dart';
import 'package:get/get.dart';

class GetDateRangedDataCommand extends IBaseCommand {
  @override
  bool canExecute(Map? params) {
    return params!['vm'] is HomeScreenViewModel;
  }

  @override
  void execute(Map? params) async {
    final HomeScreenViewModel homeScreenViewModel = params!['vm'];
    IDataRepository dataRepository = Get.find();
    final startDate = homeScreenViewModel.startDate;
    final endDate = homeScreenViewModel.endDate;
    final dataList = await dataRepository.getByDateRange(startDate, endDate);
    homeScreenViewModel.addDataToList(dataList.reversed.toList());
  }
}
