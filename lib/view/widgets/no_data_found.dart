import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/utils/colors.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo of the Error that no data found
          8.height,
          title.to14W500Text(
            textAlign: TextAlign.center,
            color: whitePrimary,
          ),
        ],
      ),
    );
  }
}
