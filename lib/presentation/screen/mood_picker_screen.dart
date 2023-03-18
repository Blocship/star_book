import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/loader.dart';
import 'package:star_book/presentation/shared/mood_tile.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';

class MoodPickerFormField extends FormBuilderField<String> {
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
  }) : super(builder: (final FormFieldState<String> field) {
          final state = field as _MoodPickerFormFieldState;

          return Focus(
            focusNode: state.effectiveFocusNode,
            canRequestFocus: state.effectiveFocusNode.canRequestFocus,
            child: SelectableTile(
                title: 'Mood',
                select: state.mood ?? 'Happy',
                onTap: () {
                  state.effectiveFocusNode.requestFocus();
                }),
          );
        });

  @override
  FormBuilderFieldState<MoodPickerFormField, String> createState() =>
      _MoodPickerFormFieldState();
}

class _MoodPickerFormFieldState
    extends FormBuilderFieldState<MoodPickerFormField, String> {
  late String? mood;

  @override
  void initState() {
    super.initState();
    mood = widget.initialValue;
    effectiveFocusNode.addListener(_handleFocus);
  }

  void _handleFocus() {
    if (effectiveFocusNode.hasFocus && enabled) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return MoodPickerBottomSheet();
          });
    }
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(_handleFocus);
    super.dispose();
  }

  @override
  void didChange(final String? value) {
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
  const MoodPickerBottomSheet({Key? key}) : super(key: key);

  @override
  State<MoodPickerBottomSheet> createState() => _MoodPickerBottomSheetState();
}

class _MoodPickerBottomSheetState extends State<MoodPickerBottomSheet> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
            return Scaffold(
              appBar: PrimaryAppBar(
                leadingOnTap: () =>
                    context.goNamed(AppRouterName.journalCreateScreen),
                centerTitle: 'Select Mood',
              ),
              body: Column(
                children: [
                  const SizedBox(height: CustomPadding.mediumPadding),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: CustomPadding.smallPadding,
                          horizontal: CustomPadding.mediumPadding,
                        ),
                        child: MoodTile(
                          title: value[index].label,
                          color: Color(value[index].color),
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              floatingActionButton: SecondaryFloatingActionButton(
                onTap: () => context.goNamed(AppRouterName.journalCreateScreen),
                child: const Icon(Icons.done),
              ),
            );
          },
        );
      }),
    );
  }
}
