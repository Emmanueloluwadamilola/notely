import 'dart:async';

import 'package:flutter/material.dart';

abstract class DisposableProvider with ChangeNotifier {

  StreamController? _stream;

  void listen(event){
    _stream = StreamController();
    _stream?.stream.listen(event);
  }
  
  void close(){
    _stream?.close();
  }

  void add(value){
    _stream?.add(value);
  }

  void disposeValues();
}