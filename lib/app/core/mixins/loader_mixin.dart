import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController{

  void loaderListner(RxBool loading){
      ever(loading,(_) async{
        if(loading.isTrue){
          await Get.dialog(
            WillPopScope(
              child: const Center(child: CircularProgressIndicator(),), 
              onWillPop: () async => false ),
              barrierDismissible: false,
          );
        }else{
          Get.back();
        }
      }
      );
  }

}