import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/cubits/intro_screen_cubit.dart';
import 'package:star_book/domain/models/user/user.dart';
import 'package:star_book/domain/repository/user_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/screen/year_screen.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/presentation/shared/form_validator.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';

class IntroScreenRoute extends RouteArg {
  static const String path = '/intro';

  const IntroScreenRoute() : super();

  @override
  Uri get uri => Uri(path: path);
}

class IntroScreen extends StatelessWidget implements Screen<IntroScreenRoute> {
  @override
  final IntroScreenRoute arg;
  IntroScreen({
    Key? key,
    required this.arg,
  }) : super(key: key);

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
                        context.goToScreen(arg: const YearScreenRoute());
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
