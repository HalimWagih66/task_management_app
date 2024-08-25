import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/core/utils/widgets/custom_app_bar.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_cached_network_image.dart';
import 'package:task_management_app/core/utils/widgets/display_images/custom_circle_image.dart';
import 'package:task_management_app/features/home_layout/presentation/manager/user_model_cubit/user_model_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/cubits/home_layout_profile_cubit.dart';
import 'package:task_management_app/features/profile/presentation/home_layout_profile/view/taps/display_profile/view/widgets/custom_view_field.dart';

class DisplayProfileView extends StatelessWidget {
  const DisplayProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var userModel = BlocProvider.of<UserModelCubit>(context).userModel;
    return Column(
      children: [
        const CustomAppBar(title: "Profile",backgroundColor: Colors.transparent,),
        InkWell(
          onTap: () {
            BlocProvider.of<HomeLayoutProfileCubit>(context).animateToPage(1);
          },
          child: CustomCircleImage(
            firstRadios: 80.w,
            secondRadios: 77.h,
            child: CustomCachedNetworkImage(
              urlImage: userModel!.imageUrl!,
              height: 250.w,
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Column(
          children: [
            CustomViewField(label: "Name", text: userModel.name ??""),
            CustomViewField(label: "Email", text: userModel.email ??""),
            const CustomViewField(label: "Password", text: "*******"),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
