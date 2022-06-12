import '/data/models/data_model.dart';

abstract class IDataRepository {
  Future<List<DataModel>> getByDateRange(DateTime startDate, DateTime endDate);
  Future<List<DataModel>> getPaged({int pageNumber = 1, int pageSize = 10});
  Future<bool> post(DataModel data);
  Future<bool> update(DataModel data);
  Future<bool> remove(DataModel data);
  Future<bool> removeAllData();
}
