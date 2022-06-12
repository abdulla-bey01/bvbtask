import 'package:flutter/material.dart';

abstract class IBaseCommand {
  @protected
  bool canExecute(Map? params);
  @protected
  void execute(Map? params);

  void doExecute(Map params) {
    if (canExecute(params)) execute(params);
  }
}
