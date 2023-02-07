import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FormDefault extends StatelessWidget {
  final String titleFields, hint;
  final TextEditingController controller;
  const FormDefault(
      {Key? key,
      required this.titleFields,
      required this.hint,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleFields,
          style: Theme.of(context).textTheme.button,
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Form ini tidak boleh kosong*';
            }
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: subtitleColor, fontWeight: FontWeight.w400),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

// class FormDefaultEmail extends StatelessWidget {
//   final String titleFields, hint;
//   final TextEditingController controller;
//   const FormDefaultEmail(
//       {Key? key,
//       required this.titleFields,
//       required this.hint,
//       required this.controller})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           titleFields,
//           style: Theme.of(context).textTheme.button,
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         TextFormField(
//           controller: controller,
//           validator: (value) {
//             if (value!.isEmpty) {
//               return 'Form ini tidak boleh kosong*';
//             }
//           },
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//             errorBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.red),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: primaryColor),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: primaryColor),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(color: primaryColor),
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
