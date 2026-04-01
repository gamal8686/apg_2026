
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';



class AppCountryCode extends StatefulWidget {
  final void Function(String) onSelectedCountryCode;

  const AppCountryCode({super.key, required this.onSelectedCountryCode});

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late String selectedCountryCode;
  List<CountryModel>? list;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 10.r),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).inputDecorationTheme.enabledBorder!.borderSide.color,
          border: Border.all(),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: DropdownButton(
                icon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 4.r),
                  child: AppImage(path: 'arrow_down.svg'),
                ),

                padding: EdgeInsets.symmetric(horizontal: 16.w),
                isExpanded: true,
                value: selectedCountryCode,

                items: list!
                    .map(
                      (e) =>
                          DropdownMenuItem(value: e.code, child: Text(e.code)),
                    )
                    .toList(),
                onChanged: (String? value) {
                  if (value == null) return;
                  selectedCountryCode = value;
                  widget.onSelectedCountryCode?.call(selectedCountryCode);
                  setState(() {});
                },
              ),
      ),
    );
  }
}

class CountryCode {
  late final List<CountryModel> list;

  CountryCode.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CountryModel.fromJsonData(e)).toList();
  }
}

class CountryModel {
  late final num id;
  late final String code;
  late final String name;

  CountryModel.fromJsonData(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? '';
    name = json['name'] ?? '';
  }
}
