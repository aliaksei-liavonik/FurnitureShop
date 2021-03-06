import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/assets.gen.dart';
import 'package:furniture_shop/utils/spaced.dart';

const pageSize = 8;

class TableSection<T extends Object> extends StatelessWidget {
  const TableSection({
    Key? key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    required this.totalCount,
    required this.currentPage,
    required this.onNextPressed,
    required this.onPrevPressed,
    this.createItemButtonLabel,
    this.createItemPressed,
  }) : super(key: key);

  final String title;

  final List<T> items;
  final Widget Function(T) itemBuilder;

  final int totalCount;
  final int currentPage;

  final VoidCallback onNextPressed;
  final VoidCallback onPrevPressed;

  final String? createItemButtonLabel;
  final VoidCallback? createItemPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(title),
        ),
        Card(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: [for (final item in items) itemBuilder(item)]
                        .spacedWith(const Divider(height: 0)),
                  ),
                ),
              ),
              _TableNavigationBar(
                currentPage: currentPage,
                totalCount: totalCount,
                onPrevPressed: onPrevPressed,
                onNextPressed: onNextPressed,
                createItemButtonLabel: createItemButtonLabel,
                createItemPressed: createItemPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TableNavigationBar<T extends Object> extends StatelessWidget {
  const _TableNavigationBar({
    Key? key,
    required this.currentPage,
    required this.totalCount,
    required this.onPrevPressed,
    required this.onNextPressed,
    this.createItemButtonLabel,
    this.createItemPressed,
  })  : assert((createItemButtonLabel == null && createItemPressed == null) ||
            createItemButtonLabel != null && createItemPressed != null),
        super(key: key);

  final int currentPage;
  final int totalCount;

  final VoidCallback onPrevPressed;
  final VoidCallback onNextPressed;

  final String? createItemButtonLabel;
  final VoidCallback? createItemPressed;

  @override
  Widget build(BuildContext context) {
    final createItemPressed = this.createItemPressed;
    final createItemButtonLabel = this.createItemButtonLabel;

    return SizedBox(
      height: 80,
      child: Row(
        children: [
          if (createItemPressed != null && createItemButtonLabel != null)
            TextButton(
              onPressed: createItemPressed,
              child: Text(
                createItemButtonLabel,
              ),
            ),
          const Spacer(),
          IconButton(
            onPressed: onPrevPressed,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            icon: Assets.icons.arrowLeft.svg(),
          ),
          const SizedBox(width: 8),
          Text(
            '${(currentPage * pageSize + 1).toString()}-${min((currentPage + 1) * pageSize, totalCount)} from ${totalCount.toString()}',
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: onNextPressed,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            icon: Assets.icons.arrowRight.svg(),
          ),
        ],
      ),
    );
  }
}
