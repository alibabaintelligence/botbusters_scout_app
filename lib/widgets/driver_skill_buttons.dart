// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class DriverSkillButtons extends StatefulWidget {
//   const DriverSkillButtons({
//     required this.driverSkillId,
//     required this.onButtonPressed,
//     super.key,
//   });

//   final String driverSkillId;
//   final void Function(String) onButtonPressed;

//   @override
//   State<DriverSkillButtons> createState() => _DriverSkillState();
// }

// class _DriverSkillState extends State<DriverSkillButtons> {
//   late String driverSkillId = widget.driverSkillId;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       childAspectRatio: 148 / 82,
//       crossAxisSpacing: 8,
//       mainAxisSpacing: 8,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       children: [
//         CupertinoButton(
//           onPressed: () {
//             setState(() {
//               driverSkillId = 'veryEff';
//               widget.onButtonPressed(driverSkillId);
//             });
//           },
//           borderRadius: BorderRadius.circular(16.0),
//           padding: EdgeInsets.zero,
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.0),
//               color: driverSkillId == 'veryEff'
//                   ? const Color.fromARGB(255, 43, 121, 73)
//                   : const Color.fromARGB(255, 64, 64, 64),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SvgPicture.asset('assets/svgs/driverSkill/veryEff.svg'),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Very Effective',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontFamily: 'Inter',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         CupertinoButton(
//           onPressed: () {
//             setState(() {
//               driverSkillId = 'eff';
//               widget.onButtonPressed(driverSkillId);
//             });
//           },
//           borderRadius: BorderRadius.circular(16.0),
//           padding: EdgeInsets.zero,
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.0),
//               color: driverSkillId == 'eff'
//                   ? const Color.fromARGB(255, 43, 59, 121)
//                   : const Color.fromARGB(255, 64, 64, 64),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SvgPicture.asset('assets/svgs/driverSkill/eff.svg'),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Effective',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontFamily: 'Inter',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         CupertinoButton(
//           onPressed: () {
//             setState(() {
//               driverSkillId = 'notEff';
//               widget.onButtonPressed(driverSkillId);
//             });
//           },
//           borderRadius: BorderRadius.circular(16.0),
//           padding: EdgeInsets.zero,
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.0),
//               color: driverSkillId == 'notEff'
//                   ? const Color.fromARGB(255, 135, 41, 55)
//                   : const Color.fromARGB(255, 64, 64, 64),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SvgPicture.asset('assets/svgs/driverSkill/notEff.svg'),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Not Effective',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontFamily: 'Inter',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         CupertinoButton(
//           onPressed: () {
//             setState(() {
//               driverSkillId = 'notObs';
//               widget.onButtonPressed(driverSkillId);
//             });
//           },
//           borderRadius: BorderRadius.circular(16.0),
//           padding: EdgeInsets.zero,
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.0),
//               color: driverSkillId == 'notObs'
//                   ? const Color.fromARGB(255, 90, 90, 90)
//                   : const Color.fromARGB(255, 64, 64, 64),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SvgPicture.asset('assets/svgs/x.svg'),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Not Observed',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontFamily: 'Inter',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
