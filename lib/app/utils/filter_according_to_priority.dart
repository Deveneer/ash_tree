import 'package:ash_tree/app/models/test_category_response.dart';
import 'package:ash_tree/app/models/test_packages_response.dart';

List<Data> filterAccordingToPriorityForTestCategories(List<Data> data) {
  List<Data> listOfDataAccordingToPriority = [];
  commonLooperAndDataAdderToEmptyList(data, listOfDataAccordingToPriority);
  return listOfDataAccordingToPriority;
}

List<TestPackagesData> filterAccordingToPriorityForTestPackages(
    List<TestPackagesData> data) {
  List<TestPackagesData> listOfDataAccordingToPriority = [];
  commonLooperAndDataAdderToEmptyList(data, listOfDataAccordingToPriority);
  return listOfDataAccordingToPriority;
}

void commonLooperAndDataAdderToEmptyList(
    data, listWhereDataShoudlBeAddedAccordingToPriority) {
  for (int priority = 1; priority <= 9999; priority++) {
    for (int index = 0; index < data.length; index++) {
      int priorityOfCurrentIndex = data[index].priority!;
      if (priorityOfCurrentIndex == priority) {
        listWhereDataShoudlBeAddedAccordingToPriority.add(data[index]);
      }
    }
  }
}
