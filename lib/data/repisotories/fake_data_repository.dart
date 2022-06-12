import 'dart:math';
import '/app/helpers/extension_methods/date_time_extension.dart';
import '/data/models/data_model.dart';
import '/data/repisotories/base/i_data_repository.dart';

class FakeDataRepository extends IDataRepository {
  late final List<DataModel> _fakeDataList;
  FakeDataRepository() {
    int fakeListLenthg = 500;
    final Random random = Random();

    _fakeDataList = [];

    for (var i = 0; i < fakeListLenthg; i++) {
      int randomGreenValue = random.nextInt(100);
      int randomPinkValue = random.nextInt(100);
      int randomBlueValue = random.nextInt(100);
      int randomMet = random.nextInt(900);
      double randomLogging = random.nextDouble() * 10;
      //
      final DataModel data = DataModel(
        id: i,
        date: DateTime.now().add(Duration(days: -(fakeListLenthg - i))),
        greenValue: randomGreenValue,
        pinkValue: randomPinkValue,
        blueValue: randomBlueValue,
        met: randomMet,
        jogging: randomLogging,
      );
      _fakeDataList.add(data);
    }
  }

  @override
  Future<List<DataModel>> getByDateRange(
      DateTime startDate, DateTime endDate) async {
    final datedData = _fakeDataList
        .where((element) => element.date.isBetween(startDate, endDate))
        .toList();
    return datedData;
  }

  @override
  Future<List<DataModel>> getPaged(
      {int pageNumber = 1, int pageSize = 10}) async {
    final start = pageNumber * pageSize;
    final end = start + pageSize;
    final pagedData = _fakeDataList.getRange(start, end).toList();
    return pagedData;
  }

  @override
  Future<bool> post(DataModel data) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<bool> remove(DataModel data) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<bool> removeAllData() {
    // TODO: implement removeAllData
    throw UnimplementedError();
  }

  @override
  Future<bool> update(DataModel data) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
