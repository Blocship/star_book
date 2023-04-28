import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/shared/loader.dart';
import 'package:star_book/presentation/shared/mood_tile.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class MoodPickerFormField extends FormBuilderField<Mood> {
  MoodPickerFormField({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.onChanged,
    super.valueTransformer,
    super.enabled = true,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
  }) : super(builder: (final FormFieldState<Mood> field) {
          final state = field as _MoodPickerFormFieldState;

          return Focus(
            focusNode: state.effectiveFocusNode,
            canRequestFocus: state.effectiveFocusNode.canRequestFocus,
            skipTraversal: state.effectiveFocusNode.skipTraversal,
            child: SelectableTile(
                title: 'Mood',
                select: state.mood?.label,
                color: state.mood?.color,
                onTap: () {
                  state.effectiveFocusNode.requestFocus();
                }),
          );
        });

  @override
  FormBuilderFieldState<MoodPickerFormField, Mood> createState() =>
      _MoodPickerFormFieldState();
}

class _MoodPickerFormFieldState
    extends FormBuilderFieldState<MoodPickerFormField, Mood> {
  late Mood? mood;

  @override
  void initState() {
    super.initState();
    mood = widget.initialValue;
    effectiveFocusNode.addListener(_handleFocus);
  }

  void _handleFocus() {
    if (effectiveFocusNode.hasFocus && enabled) {
      effectiveFocusNode.unfocus();
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          builder: (context) {
            return MoodPickerBottomSheet(
              onTap: (final Mood value) {
                mood = value;
                didChange(value);
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
            );
          });
    }
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(_handleFocus);
    super.dispose();
  }

  @override
  void didChange(final Mood? value) {
    super.didChange(value);
    mood = value;
  }

  @override
  void reset() {
    super.reset();
    mood = widget.initialValue;
  }
}

class MoodPickerBottomSheetCubit extends Cubit<CubitState<List<Mood>>> {
  final MoodRepo moodRepo;
  MoodPickerBottomSheetCubit({
    required this.moodRepo,
  }) : super(const InitialState());

  Future<void> fetchMoods() async {
    emit(const LoadingState());
    final list = await moodRepo.getMoods();
    emit(LoadedState(list));
  }
}

class MoodPickerBottomSheet extends StatefulWidget {
  final Function(Mood) onTap;
  const MoodPickerBottomSheet({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MoodPickerBottomSheet> createState() => _MoodPickerBottomSheetState();
}

class _MoodPickerBottomSheetState extends State<MoodPickerBottomSheet> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = context.deviceWidth;
    final double deviceHeight = context.deviceHeight;

    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return BlocProvider<MoodPickerBottomSheetCubit>(
      create: (context) => MoodPickerBottomSheetCubit(
        moodRepo: Injector.resolve<MoodRepo>(),
      )..fetchMoods(),
      child: BlocBuilder<MoodPickerBottomSheetCubit, CubitState<List<Mood>>>(
          builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Loader();
          },
          loaded: (value) {
            return Container(
              height: deviceHeight * 0.61,
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomPadding.mediumPadding),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    width: deviceWidth * 0.2,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Select Mood',
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: themeColorStyle.secondaryColor,
                          ),
                        ),
                        SizedBox(width: deviceWidth * 0.27),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.close,
                            color: themeColorStyle.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: CustomPadding.mediumPadding),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: CustomPadding.smallPadding),
                        child: MoodTile(
                          title: value[index].label,
                          color: Color(value[index].color),
                          isSelected: selectedIndex == index,
                          onTap: () {
                            widget.onTap(value[index]);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
