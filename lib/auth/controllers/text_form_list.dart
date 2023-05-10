import 'package:flutter/material.dart';
import 'package:rental_vendor/auth/controllers/sign_in_controller.dart';
import 'package:rental_vendor/auth/controllers/sign_up_controller.dart';
import 'package:rental_vendor/auth/models/sign_in_model.dart';
import 'package:rental_vendor/auth/models/sign_up_model.dart';
import 'package:rental_vendor/config/ui/my_text_form.dart';

class TextFormList {
  List<MyTextForm>? textFormList;

  List<MyTextForm> signUpFormList(
      {required SignUpController signUpController,
      required SignUpModel signUpModel}) {
    return textFormList = [
      MyTextForm(
          controller: signUpController.nameController,
          icon: Icons.person,
          onChanged: (value) {
            signUpController.setController(
              value: value,
              updateModel: (newValue) {
                signUpController.signUpModel.name = newValue;
              },
            );
          },
          labelText: "Enter Your Name"),
      MyTextForm(
          controller: signUpController.shopNameController,
          icon: Icons.shopify,
          onChanged: (value) {
            signUpController.setController(
              value: value,
              updateModel: (newValue) {
                signUpController.signUpModel.shopName = newValue;
              },
            );
          },
          labelText: "Shop Name"),
      MyTextForm(
          controller: signUpController.phoneController,
          isPhone: true,
          icon: Icons.phone_android,
          onChanged: (value) {
            signUpController.setController(
              value: value,
              updateModel: (newValue) {
                signUpController.signUpModel.phone = newValue;
              },
            );
          },
          labelText: "Phone"),
      MyTextForm(
          controller: signUpController.dateController,
          isDate: true,
          icon: Icons.date_range_outlined,
          onChanged: (value) {
            signUpController.setController(
              value: value,
              updateModel: (newValue) {
                signUpController.signUpModel.date = newValue;
              },
            );
          },
          labelText: "Join Date"),
      MyTextForm(
          controller: signUpController.emailController,
          icon: Icons.mail,
          onChanged: (value) {
            signUpController.setController(
              value: value,
              updateModel: (newValue) {
                signUpController.signUpModel.email = newValue;
              },
            );
          },
          labelText: "Enter Your Email"),
      MyTextForm(
        controller: signUpController.passwordController,
        isPassword: true,
        icon: Icons.lock,
        labelText: "Enter Your Password",
        onChanged: (value) {
          signUpController.setController(
            value: value,
            updateModel: (newValue) {
              signUpController.signUpModel.password = newValue;
            },
          );
        },
      ),
      MyTextForm(
        controller: signUpController.confirmPassController,
        isPassword: true,
        icon: Icons.lock_person_rounded,
        labelText: "Enter Your Confirm Password",
        onChanged: (value) {
          signUpController.setController(
            value: value,
            updateModel: (newValue) {
              signUpController.signUpModel.password = newValue;
            },
          );
        },
      ),
    ];
  }

  List<MyTextForm> signInFormList(
      {required SignInController signIncontroller,
      required SignInModel signInModel}) {
    return textFormList = [
      MyTextForm(
          controller: signIncontroller.emailController,
          icon: Icons.mail,
          onChanged: (value) {
            signIncontroller.setController(
              value: value,
              updateModel: (newValue) {
                signIncontroller.signInModel.email = newValue;
              },
            );
          },
          labelText: "Enter Your Email"),
      MyTextForm(
        controller: signIncontroller.passwordController,
        isPassword: true,
        icon: Icons.lock,
        labelText: "Enter Your Password",
        onChanged: (value) {
          signIncontroller.setController(
            value: value,
            updateModel: (newValue) {
              signIncontroller.signInModel.password = newValue;
            },
          );
        },
      ),
    ];
  }
}

// // class TaskformList {
// //   List? taskFormList;
// //   List formList() {
// //     return taskFormList = [
// //       StringTextField(
// //         labelText: "Enter Your Name",
// //         icon: const Icon(Icons.person),
// //       ),
// //     ];
// //   }
// // }
