import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/helper/block_helper.dart';
import 'package:flutter_base_bloc/utils/app_styles/style.dart';
import 'package:flutter_base_bloc/utils/dimension.dart';
import 'package:flutter_base_bloc/utils/dimension_manager.dart';
import 'package:flutter_base_bloc/utils/font_scaling_manager.dart';
import 'package:flutter_base_bloc/view/widgets/extention/annotated_widget.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/helper/debouncer.dart';
import 'package:flutter_base_bloc/bloc/auth_bloc/login_bloc.dart';
import 'package:flutter_base_bloc/utils/app_strings.dart';
import 'package:flutter_base_bloc/view/widgets/custom_text_field.dart';
import 'package:flutter_base_bloc/view/widgets/prrimary_button.dart';
import 'package:flutter_base_bloc/helper/validation.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/theme_toggle_widget.dart';
import 'package:flutter_base_bloc/utils/app_styles/app_theme_colors.dart';
import 'package:flutter_base_bloc/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/helper/routes_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final debouncer = Debouncer(milliseconds: 500);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    debouncer.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              // Login successful, navigation is handled in the BLoC
            } else if (state is LoginFailure) {
              // Error is already shown in the BLoC
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, loginState) {
              final isLoading = loginState.isLoading;

              return annotatedRegionWidget(
                context: context,
                child: OrientationBuilder(
                  builder: (context, orientation) {
                    // Mark dimension manager for refresh on orientation change
                    DimensionManager.instance.markForRefresh();
                    // Clear font scaling cache on orientation change
                    FontScalingManager.instance.clearCache();
                    return Scaffold(
                      key: scaffoldKey,
                      extendBody: true,
                      extendBodyBehindAppBar: true,
                      appBar: AppBar(
                        title: AppStrings.loginText.toText(),
                        centerTitle: true,
                        backgroundColor: AppThemeColors.getSurface(
                          themeState.themeMode,
                        ),
                        actions: [const ThemeToggleWidget(), 8.width],
                      ),
                      body: SafeArea(
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // App Logo/Title
                                    AppStrings.welcomeBack.toText(
                                      fontSize: 28,
                                      fontWeight: AppStyle.w700,
                                      textAlign: TextAlign.center,
                                    ),
                                    20.height,
                                    AppStrings.signInToContinue.toText(
                                      fontSize: 16,
                                      color: AppThemeColors.getTextOnSurface(
                                        themeState.themeMode,
                                      ).withValues(alpha: 179),
                                      textAlign: TextAlign.center,
                                    ),
                                    40.height,

                                    // Email Field
                                    CustomTextField(
                                      controller: _emailController,
                                      hintText: AppStrings.email,
                                      textInputType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) =>
                                          Validation.emailValidation(value),
                                      label: AppStrings.email,
                                      onChanged: (value) {
                                        BlocHelper.readLoginBloc.add(
                                          LoginEmailChanged(value ?? ''),
                                        );
                                      },
                                    ),
                                    20.height,

                                    // Password Field
                                    CustomTextField(
                                      controller: _passwordController,
                                      hintText: AppStrings.password,
                                      obscureText: true,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      validator: (value) =>
                                          Validation.passwordValidation(value),
                                      label: AppStrings.password,
                                      onChanged: (value) {
                                        BlocHelper.readLoginBloc.add(
                                          LoginPasswordChanged(value ?? ''),
                                        );
                                      },
                                    ),
                                    30.height,

                                    // Login Button
                                    PrimaryButton(
                                      buttonName: isLoading
                                          ? AppStrings.signingIn
                                          : AppStrings.loginText,
                                      onPressed: isLoading
                                          ? () {}
                                          : () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                BlocHelper.readLoginBloc.add(
                                                  LoginSubmitted(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                  ),
                                                );
                                              }
                                            },
                                    ),
                                    20.height,

                                    // Forgot Password
                                    AppStrings.forgotPassword
                                        .toText(
                                          fontSize: 16,
                                          color: AppThemeColors.getPrimary(
                                            themeState.themeMode,
                                          ),
                                          fontWeight: AppStyle.w500,
                                        )
                                        .onPress(() {
                                          // Implement forgot password functionality
                                          // For example, navigate to a Forgot Password screen
                                          goToNamed(RouterHelper.mainScreen);
                                        })
                                        .center,
                                  ],
                                ).paddingSymmetric(
                                  horizontal: isLandscapePossible ? 40.w : 20.w,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
