import 'package:flutter/material.dart';

import '../../../../material_application.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.leadingIconData, this.backgroundColor = Colors.transparent, required this.title, this.onPressed});
  final IconData? leadingIconData;
  final Color backgroundColor;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        leading: leadingIconData == null?null:IconButton(icon: Icon(leadingIconData,color: textThemeApp.primaryColor,), onPressed: onPressed),
        title: Text(title,style: textThemeApp.font17PrimaryMedium),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 65);
}