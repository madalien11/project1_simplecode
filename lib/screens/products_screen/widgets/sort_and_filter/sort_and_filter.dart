import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/products_bloc/products_bloc.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import 'drop_down_decoration.dart';

Map<String, String> _filterValues = {
  "category": 'all',
  "rating": 'all',
  "sort": 'asc',
};

class CategoryFilterWidget extends StatefulWidget {
  const CategoryFilterWidget({
    Key? key,
    this.categories,
  }) : super(key: key);

  final List<String>? categories;

  @override
  State<CategoryFilterWidget> createState() => _CategoryFilterWidgetState();
}

class _CategoryFilterWidgetState extends State<CategoryFilterWidget> {
  String value = _filterValues['category']!;

  @override
  Widget build(BuildContext context) {
    return DropDownDecoration(
      child: DropdownButton(
        value: value,
        focusColor: AppColors.primaryLightblue,
        iconEnabledColor: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(10),
        icon: const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Icon(
            Icons.arrow_drop_down_circle_outlined,
            size: 16,
          ),
        ),
        underline: Container(),
        isDense: true,
        isExpanded: true,
        items: widget.categories!
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e, style: AppTextStyles.s14w400),
              ),
            )
            .toList(),
        onChanged: (val) {
          if (val.toString() == value) return;
          setState(() {
            value = val.toString();
            _filterValues['category'] = value;
          });

          BlocProvider.of<ProductsBloc>(context).add(ProductsFilterEvent(
            category: value,
            rating: _filterValues['rating']!,
          ));
        },
      ),
    );
  }
}

class RatingFilterWidget extends StatefulWidget {
  const RatingFilterWidget({Key? key}) : super(key: key);

  @override
  State<RatingFilterWidget> createState() => _RatingFilterWidgetState();
}

class _RatingFilterWidgetState extends State<RatingFilterWidget> {
  String value = _filterValues['rating']!;

  @override
  Widget build(BuildContext context) {
    return DropDownDecoration(
      child: DropdownButton(
        value: value,
        focusColor: AppColors.primaryLightblue,
        iconEnabledColor: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(10),
        icon: const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Icon(
            Icons.arrow_drop_down_circle_outlined,
            size: 16,
          ),
        ),
        underline: Container(),
        isDense: true,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            value: "all",
            child: Text(
              S.of(context).rating_all,
              style: AppTextStyles.s14w400,
            ),
          ),
          DropdownMenuItem(
            value: "2",
            child: Text(
              S.of(context).rating_2,
              style: AppTextStyles.s14w400,
            ),
          ),
          DropdownMenuItem(
            value: "3",
            child: Text(
              S.of(context).rating_3,
              style: AppTextStyles.s14w400,
            ),
          ),
          DropdownMenuItem(
            value: "4",
            child: Text(
              S.of(context).rating_4,
              style: AppTextStyles.s14w400,
            ),
          ),
          DropdownMenuItem(
            value: "5",
            child: Text(
              S.of(context).rating_5,
              style: AppTextStyles.s14w400,
            ),
          ),
        ],
        onChanged: (val) {
          if (val.toString() == value) return;
          setState(() {
            value = val.toString();
            _filterValues['rating'] = value;
          });

          BlocProvider.of<ProductsBloc>(context).add(ProductsFilterEvent(
            rating: value,
            category: _filterValues['category']!,
          ));
        },
      ),
    );
  }
}

class SortSelectWidget extends StatefulWidget {
  const SortSelectWidget({Key? key}) : super(key: key);

  @override
  State<SortSelectWidget> createState() => _SortSelectWidgetState();
}

class _SortSelectWidgetState extends State<SortSelectWidget> {
  String value = _filterValues['sort']!;

  @override
  Widget build(BuildContext context) {
    return DropDownDecoration(
      child: DropdownButton(
        value: value,
        focusColor: AppColors.primaryLightblue,
        iconEnabledColor: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(10),
        icon: const Padding(
          padding: EdgeInsets.only(left: 4),
          child: Icon(
            Icons.arrow_drop_down_circle_outlined,
            size: 16,
          ),
        ),
        underline: Container(),
        isDense: true,
        items: [
          DropdownMenuItem(
            value: 'asc',
            child: Text(
              S.of(context).asc,
              style: AppTextStyles.s14w400,
            ),
          ),
          DropdownMenuItem(
            value: 'desc',
            child: Text(
              S.of(context).desc,
              style: AppTextStyles.s14w400,
            ),
          ),
        ],
        onChanged: (val) {
          if (val.toString() == value) return;
          setState(() {
            value = val.toString();
            _filterValues['sort'] = value;
          });

          BlocProvider.of<ProductsBloc>(context).add(ProductsSortEvent(
            isDesc: val == 'desc',
            rating: _filterValues['rating']!,
            category: _filterValues['category']!,
          ));
        },
      ),
    );
  }
}
