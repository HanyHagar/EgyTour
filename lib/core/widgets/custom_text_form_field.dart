import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final double width;
  final double height;
  final int maxLines;
  final bool isReadOnly;
  final TextEditingController controller;
  final bool isHiddenInputBorder;
  final bool isOutlineInputBorder;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color focusColor;
  final Color errorColor;
  final BorderStyle borderStyle;
  final bool isEnablePrefixIcon;
  final IconData? prefixIcon;
  final double iconSize;
  final Color iconColor;
  final bool isEnableSuffixIcon;
  final IconData? suffixIcon;

  final void Function()? suffixIconOnPressed;
  final bool isLabelText;
  final String title;
  final double inputSize;
  final FontWeight inputWeight;
  final bool isObscureText;
  final TextInputType keyboardType;
  final Brightness keyboardMode;
  final bool isEnableSuggestions;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final bool useDefaultValidator ;
  final bool isPasswordInput ;
  final String? Function(String?)? newValidator; // Nullable type
  final AutovalidateMode? autoValidateMode;

  final Color backgroundColor;
  const CustomTextFormField(
    {super.key,
    this.width = double.infinity,
    this.height = 50,
    this.isReadOnly = false,
    required this.controller,
    this.isHiddenInputBorder = false,
    this.isOutlineInputBorder = true,
    this.borderRadius = 6,
    this.borderWidth = 2,
    this.borderColor = Colors.black87,
    this.focusColor = Colors.blueAccent,
    this.errorColor = Colors.red,
    this.borderStyle = BorderStyle.solid,
    this.isEnablePrefixIcon = true,
    this.prefixIcon,
    this.iconSize = 20,
    this.iconColor = Colors.black,
    this.isEnableSuffixIcon = false,
    this.suffixIcon,
    this.isLabelText = true,
    required this.title,
    this.inputSize = 15,
    this.inputWeight = FontWeight.w800,
    this.isObscureText = false,
    required this.keyboardType,
    this.keyboardMode = Brightness.light,
    this.isEnableSuggestions = true,
    this.onTap,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.useDefaultValidator = true,
    this.isPasswordInput = true,
    this.newValidator,
    this.maxLines = 1,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.suffixIconOnPressed,
      this.backgroundColor = const Color(0xFFCFD8DC),

    });
  InputBorder selectBorder(borderColor) {
    if (isHiddenInputBorder) {
      return InputBorder.none;
    } else if (isOutlineInputBorder) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: borderColor,
          width: borderWidth,
          style: borderStyle,
        ),
      );
    } else {
      return UnderlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      );
    }
  }
  String fieldSubmittedData(value){
    return value;
  }
  String changedData(value){
    return value;
  }
  String savedData(value){
    return value;
  }
  String? selectDefaultValidatorFunction(value) {
    if (keyboardType == TextInputType.emailAddress) {
      return defaultEmailValidatorFunction(value);
    }
    else if (keyboardType == TextInputType.visiblePassword) {
      return defaultPasswordValidatorFunction(value);
    } else if (keyboardType == TextInputType.phone){
      return defaultPhoneNumberValidatorFunction(value);
    } else if (keyboardType == TextInputType.streetAddress){
      return defaultStreetAddressValidatorFunction(value);
    }else if (keyboardType == TextInputType.url){
      return defaultUrlValidatorFunction(value);
    }else{
      return defaultTextValidatorFunction(value);
    }
  }
  String? defaultEmailValidatorFunction(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    // Regular expression for basic email validation
    final emailRegex = RegExp(
      r'^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$',
      caseSensitive: false,
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }
  String? defaultTextValidatorFunction(value){
    return emptyValue(value);
  }
  String? defaultPasswordValidatorFunction(String? value, {bool isPassword = false}) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    if (isPassword) {
      // Regular expression for strong password validation
      final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
      );

      if (!passwordRegex.hasMatch(value)) {
        return 'Password must be at least 8 characters long, include uppercase and lowercase letters, a digit, and a special character';
      }
    }

    return null;
  }
  String? defaultPhoneNumberValidatorFunction(String? value, {bool isPhoneNumber = false}) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    if (isPhoneNumber) {
      // Regular expression for phone number validation
      final phoneRegex = RegExp(
        r'^\+?[1-9]\d{1,14}$',  // Basic regex for international phone numbers
        caseSensitive: false,
      );

      if (!phoneRegex.hasMatch(value)) {
        return 'Please enter a valid phone number';
      }
    }

    return null;
  }
  String? defaultStreetAddressValidatorFunction(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    // Regular expression to validate address format
    final addressRegex = RegExp(r'^[\d\w\s,.-]+$');
    if (!addressRegex.hasMatch(value)) {
      return 'Please enter a valid address';
    }

    // Optionally, check the length of the address
    if (value.length < 5 || value.length > 100) {
      return 'Address should be between 5 and 100 characters';
    }

    return null;
  }
  String? defaultUrlValidatorFunction(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    // Regular expression to validate URL format
    final urlRegex = RegExp(
      r"^(https?:\/\/)?([\w-]+\.)+[\w-]+(\/[\w-]*)*(\?[^\s]*)?$",
      caseSensitive: false,
    );

    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }
  String? newValidatorFunction(){
    return null;
  }
  String? emptyValue(value){
    if (value.isEmpty ) {
      return 'This field cannot be left empty';
    }
    else {
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: backgroundColor,  // Background color
          borderRadius: BorderRadius.circular(borderRadius),  // Rounded corners
          boxShadow: const [
            // BoxShadow(
            //   color: Colors.black38,  // Shadow color with opacity
            //   blurRadius: 8.0,  // Blur intensity
            //   spreadRadius: 2.0,  // Spread of the shadow
            //   offset: Offset(2, 4),  // Horizontal and vertical displacement
            // ),
          ],
        ),
      child: TextFormField(
        autovalidateMode: autoValidateMode,
        maxLines: maxLines,
        scrollPadding: EdgeInsets.all(height),
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.only(start: 20,top: isLabelText ?0:keyboardType == TextInputType.visiblePassword?13:0), // Adjust left space
          enabledBorder:selectBorder(borderColor),
          border: selectBorder(borderColor),
          focusedBorder:selectBorder(focusColor),
          errorBorder:selectBorder(errorColor),
          prefixIcon: isEnablePrefixIcon ?Icon(
            prefixIcon,
            color: iconColor,
            size: iconSize,
          ) : null,
          hoverColor: borderColor,
          labelText: isLabelText ?title:null,
          hintText: isLabelText ?null:title,
          suffixIcon: isEnableSuffixIcon ? IconButton(
            onPressed: () {
              suffixIconOnPressed!();
            },
            icon: Icon(
              suffixIcon,
              color: iconColor,
              size: iconSize,
            ),
          ) : null,
        ),
        style: TextStyle(
          fontSize: inputSize,
          fontWeight: inputWeight,
          color: borderColor,
        ),
        obscureText: isObscureText,
        keyboardType:keyboardType,
        keyboardAppearance: keyboardMode,
        enableSuggestions: isEnableSuggestions,
        onTap: onTap,
        onFieldSubmitted: (value) {
          fieldSubmittedData(value);
        },
        onChanged: (value) {
          changedData(value);
        },
        onSaved: (newValue) {
          savedData(newValue);
        },
        validator:useDefaultValidator ? (value) => selectDefaultValidatorFunction(value): newValidator,
        readOnly: isReadOnly,
      ),
    );
  }
}

