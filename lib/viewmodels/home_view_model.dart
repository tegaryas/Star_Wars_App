import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:starwars_app/models/people_model.dart';
import 'package:starwars_app/service/api_service.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<People> get peopleListModel => _peopleListModel;
  List<People> _peopleListModel = [];

  RxBool changeView = true.obs;

  HomeViewModel() {
    getAllData();
  }

  // setChangeView() {
  //   changeView = !changeView;
  //   update();
  // }

  void getAllData() async {
    _loading.value = true;
    await ApiService().fetchData().then((value) {
      _peopleListModel = value;
      return _peopleListModel;
    });
    _loading.value = false;
    update();
  }

  // getAllProducts() async {
  //   _loading.value = true;
  //   ApiService().fetchData().then((value) {
  //     for (int i = 0; i < value.length; i++) {
  //       _peopleListModel.add(People.fromJson(value[i].));

  //       _loading.value = false;
  //     }
  //     update();
  //   });
  // }
}
