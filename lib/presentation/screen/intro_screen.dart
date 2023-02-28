import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/cubits/intro_screen_cubit.dart';
import 'package:star_book/domain/models/user/user.dart';
import 'package:star_book/domain/repository/user_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/presentation/shared/form_validator.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final double deviceHeight = context.deviceHeight;
    return BlocProvider<IntroScreenCubit>(
      create: (context) => IntroScreenCubit(
        formKey: _formKey,
        userRepo: Injector.resolve<UserRepo>(),
      ),
      child: BlocBuilder<IntroScreenCubit, CubitState<User>>(
        builder: (context, state) {
          nameController.text = 'Abdullah';
          return GradientScaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomPadding.mediumPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: deviceHeight * 0.08),
                  Image(
                      image: const AssetImage('assets/images/intro_image.png'),
                      height: deviceHeight * 0.2),
                  SizedBox(height: deviceHeight * 0.024),
                  Text(
                    'So nice to meet you!',
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'What do your friends call you?',
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: deviceHeight * 0.028),
                  FormBuilder(
                    key: _formKey,
                    child: PrimaryTextField(
                      hintText: 'Enter your name',
                      controller: nameController,
                      validator: FormValidator.nameValidator,
                    ),
                  ),
                  const Spacer(),
                  PrimaryFilledButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<IntroScreenCubit>()
                            .createUser(nameController.text);
                        context.pushReplacementNamed(AppRouterName.mainScreen);
                      }
                    },
                    label: 'Continue',
                  ),
                  SizedBox(height: deviceHeight * 0.03),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
