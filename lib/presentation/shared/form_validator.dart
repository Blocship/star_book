import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormValidator {
  /// [FormValidator] contains a List of [FormValidator]
  static FormFieldValidator<T> Function<T>(List<FormFieldValidator<T>>)
      compose = FormBuilderValidators.compose;

  /// [FormValidator] that requires a field to be non nullable
  static FormFieldValidator<T> Function<T>({String? errorText}) required =
      FormBuilderValidators.required;

  /// [FormValidator] that requires the length of the field's value to be
  /// greater than or equal to the provided minimum length.
  static FormFieldValidator<T> Function<T>(int minLength, {String? errorText})
      minLength = FormBuilderValidators.minLength;

  /// [nameValidator] that requires the name field is non nullable
  /// and should be less than 15 characters (Only Contains Alphabetic character)
  static String? nameValidator(value) {
    final name = RegExp(r'^[a-zA-Z\s]+$');
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (value.length > 15) {
      return 'Name should be less than 15 characters';
    } else if (!name.hasMatch(value)) {
      return 'Use alphabets only, no symbols allowed';
    }
    return null;
  }
}
