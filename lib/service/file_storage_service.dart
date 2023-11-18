import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_group_200_chat_app/models/phone_number.dart';
import 'package:isar/isar.dart';

class FireStorageService{
  final CollectionReference  _phoneCollectionRefernce = FirebaseFireStore.instance.collection('phone');

  Future createPhoneNumber(PhoneNumber phoneNumber) async{
    try{
      await _phoneCollectionRefernce.doc(phoneNumber.phone).set(phoneNumber.toJson());
    
    }catch(e){
      if (e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }
}