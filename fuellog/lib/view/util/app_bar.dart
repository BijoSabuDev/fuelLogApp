import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// class CommonAppBar extends StatelessWidget {
//   const CommonAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final sw = MediaQuery.of(context).size.width;
//     return AppBar(
//       leading: Container(
//         width: sw * 0.05,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(width: 1, color: const Color(0xFFD8DADC))),
//         child: const Center(child: Icon(Icons.arrow_back_ios)),
//       ),
//       actions: [
//         Container(
//             height: sw * 0.10,
//             child: SvgPicture.asset('assets/onboardingScreen/logo.svg'))
//       ],
//     );
//   }
// }
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xFFD8DADC)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: IconButton(
            iconSize: sw * 0.042,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/onboardingScreen/logo.svg'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
