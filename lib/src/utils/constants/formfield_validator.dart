import 'package:form_field_validator/form_field_validator.dart';

class FormValidators {
  FormValidators._();

  /// Email Validator
  static final email = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    PatternValidator(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        errorText: 'Enter a valid email address')
  ]);

  static final phone = MultiValidator([
    RequiredValidator(errorText: 'Number is required'),
    MinLengthValidator(10, errorText: 'Number must be at 10 digits'),
  ]);
  static final adhar = MultiValidator([
    RequiredValidator(errorText: 'Adhar Number is required'),
    MinLengthValidator(12, errorText: 'Adhar number must be at 12 digits'),
  ]);

  /// Password Validator
  static final password = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(6, errorText: 'Password must be at least 6 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Passwords must have at least one special character')
  ]);

  /// Required Validator with Optional Field Name
  static RequiredValidator requiredWithFieldName(String? fieldName) =>
      RequiredValidator(errorText: '${fieldName ?? 'Field'} is required');

  /// Plain Required Validator
  static final required = RequiredValidator(errorText: 'Field is required');
}
