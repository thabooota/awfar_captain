import 'package:awfar_captain/core/helpers/extensions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/utils/method_manager.dart';
import '../../../../lang/locale_keys.g.dart';

class LanguageDialog extends StatefulWidget {
  final Function(String value) onChangeLang;

  const LanguageDialog({super.key, required this.onChangeLang});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  final List<String> items = [
    LocaleKeys.en.tr(),
    LocaleKeys.ar.tr(),
  ];

  String? selectedValue;

  @override
  void initState() {
    selectedValue =
    MethodsManager.getLocate() == const Locale("en")
        ? items[0]
        : items[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        LocaleKeys.selectLang.tr(),
        style: TextStyleManager.font20TextColor600,
      ),
      content: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          items: items
              .map(
                (String item) => DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  Text(
                    MethodsManager.generateCountryFlag(
                        countryCode:
                        item == LocaleKeys.ar.tr() ? 'eg' : "us"),
                    style: TextStyleManager.font20TextColor600,
                  ),
                  horizontalSpace(12.0),
                  Text(
                    item,
                    style: TextStyleManager.font17black400,
                  ),
                ],
              ),
            ),
          )
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            context.pop();
            selectedValue = value;
            widget.onChangeLang(value!);
            setState(() {});
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
