import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/provider/filtered_list_provider.dart';

class FilterTile extends ConsumerStatefulWidget {
  const FilterTile({
    super.key,
    required this.title,
    required this.filterType,
  });
  final String title;
  final FilterType filterType;

  @override
  ConsumerState<FilterTile> createState() => _FilterTileState();
}

class _FilterTileState extends ConsumerState<FilterTile> {
  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.watch(filterProvider);
    return SwitchListTile(
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      value: activeFilters[widget.filterType]!,
      onChanged: (value) {
        ref
            .read(filterProvider.notifier)
            .updateFilter(widget.filterType, value);
      },
    );
  }
}
