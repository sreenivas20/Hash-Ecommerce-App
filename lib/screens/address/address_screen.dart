// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class AddressScreen extends StatefulWidget {
//   const AddressScreen({super.key});

//   @override
//   State<AddressScreen> createState() => _AddressScreenState();
// }

// class _AddressScreenState extends State<AddressScreen> {
//   int selectedOption = 0;

//   void handleRadioValueChanged(int value) {
//     setState(() {
//       selectedOption = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: addressBuildAppbar(context),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemBuilder: (context, index) {
//                 return AddressRadioButton(
//                     label: 'option 1',
//                     isSelected: selectedOption == index + 1,
//                     onChanged: () => handleRadioValueChanged(index + 1));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   AppBar addressBuildAppbar(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       leading: IconButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         icon: const Icon(Icons.arrow_back_ios),
//       ),
//       title: Padding(
//         padding: const EdgeInsets.only(left: 48),
//         child: Text(
//           'Address 🏠',
//           style: Theme.of(context)
//               .textTheme
//               .headlineMedium
//               ?.copyWith(fontSize: 25, color: Colors.black),
//         ),
//       ),
//     );
//   }
// }

// class AddressRadioButton extends StatefulWidget {
//   final String label;
//   final bool isSelected;
//   final Function() onChanged;

//   const AddressRadioButton(
//       {super.key,
//       required this.label,
//       required this.isSelected,
//       required this.onChanged});

//   @override
//   // ignore: library_private_types_in_public_api
//   _AddressRadioButtonState createState() => _AddressRadioButtonState();
// }

// class _AddressRadioButtonState extends State<AddressRadioButton> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         if (!widget.isSelected) {
//           widget.onChanged();
//         }
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         decoration: BoxDecoration(
//           color: widget.isSelected ? Colors.blue : Colors.white,
//           borderRadius: BorderRadius.circular(16.0),
//           border: Border.all(
//             color: widget.isSelected ? Colors.blue : Colors.grey,
//             width: 1.0,
//           ),
//         ),
//         child: Text(
//           widget.label,
//           style: TextStyle(
//             color: widget.isSelected ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
