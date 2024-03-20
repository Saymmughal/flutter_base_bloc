import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/bloc_provider/authentication_bloc/auth_cubit.dart';
import 'package:flutter_base_bloc/bloc_provider/authentication_bloc/auth_state.dart';
import 'package:flutter_base_bloc/utils/colors.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authABloc = BlocProvider.of<AuthCubit>(context, listen: false);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: greenPrimary,
              body: Container(
                child: 'Menu Screen'.toText().onPress(() {
                  authABloc.setLoading(true);
                  Future.delayed(const Duration(seconds: 5), () {
                    authABloc.setLoading(false);
                  });
                }),
              ).center);
        },
      ),
    );
  }
}
