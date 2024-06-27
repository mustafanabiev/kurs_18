import 'dart:developer';

import 'package:flash_chat/service/home_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState()) {
    service = HomeService();
  }

  late HomeService service;

  Future<void> sendMassage(String sms) async {
    try {
      await service.sendMessage(splitText(sms));
    } catch (e) {
      log(e.toString());
    }
  }

  String splitText(String text) {
    final sms = text.trim();
    if (sms != '') {
      return sms;
    } else {
      return '';
    }
  }
}
