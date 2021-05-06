import 'package:admin/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../dashboard/components/header.dart';
import '../main/components/side_menu.dart';

class TransactionsScreen extends StatefulHookWidget {
  const TransactionsScreen({Key key}) : super(key: key);

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Header(),
          Expanded(
            child: Center(
              child: Text('Tasks Screen'),
            ),
          ),
        ],
      ),
    );
  }
}
