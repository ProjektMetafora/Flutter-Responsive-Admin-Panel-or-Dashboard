import 'package:admin/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';
import '../dashboard/components/header.dart';
import '../main/components/side_menu.dart';

import 'package:admin/utils/widget_extensions.dart';

class TasksScreen extends StatefulHookWidget {
  const TasksScreen({Key key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Header(),
              Center(
                child: Text('Tasks Screen'),
              ),
            ],
          ),
        ).padAll(defaultPadding),
      ),
    );
  }
}
