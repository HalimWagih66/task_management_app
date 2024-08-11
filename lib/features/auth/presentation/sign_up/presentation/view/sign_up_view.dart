import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/widgets/custom_app_bar.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/manager/sign_up_bloc/sign_up_bloc.dart';
import 'package:task_management_app/features/auth/presentation/sign_up/presentation/view/widgets/sign_up_view_body.dart';
import '../../../../../../core/services/service_locator.dart';
import '../../../../data/repos/auth_repo.dart';
import '../manager/image_picker_cubit/image_picker_cubit.dart';

class SignUpView extends StatelessWidget  {
  const SignUpView({super.key});
  static const routeName = "/SignUpView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(
       onPressed: () {
         GoRouter.of(context).pop();
       },
       title: "Sign Up",
       backgroundColor: Colors.transparent,
       leadingIconData: Icons.arrow_back_ios,
     ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ImagePickerCubit()),
          BlocProvider(create: (context) => SignUpBloc(authRepo: getIt.get<AuthRepo>()))
        ],
        child: const SignUpViewBody(),
      ),
    );
  }
}