import 'package:ash_tree/app/modules/familyMembers/controllers/family_members_controller.dart';
import 'package:get/get.dart';
import '../controllers/family_member_select_controller.dart';

class FamilyMemberSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilyMemberSelectController>(
      () => FamilyMemberSelectController(),
    );
    Get.put(FamilyMembersController());
  }
}
