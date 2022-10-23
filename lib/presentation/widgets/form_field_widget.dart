import 'package:flutter/material.dart';
import 'package:ivory/presentation/core/constant/font/google_font.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget(
      {Key? key,
      required this.label,
      required this.icon,
      required this.controller,
      this.ontap,
      this.onChanged,
      this.onSubmit,
      this.onComplete,
      this.height = 50})
      : super(key: key);

  final String label;
  final double height;
  final IconData icon;
  final Function()? ontap;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final Function()? onComplete;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(vertical: 10),
      duration: const Duration(milliseconds: 300),
      height: height,
      child: TextFormField(
        onEditingComplete: onComplete,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        onTap: ontap,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                ),
                child: height == 0
                    ? const SizedBox()
                    : Icon(
                        icon,
                        color: Colors.grey,
                      ),
                // child: SvgPicture.asset(
                //   'asset/svgs/iconmonstr-email-11.svg',
                //   color: Colors.grey,
                //   width: 20,
                // ),
              ),
              Text(
                label,
                style: GoogleFont.loginSubTextGrey,
              ),
            ],
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: height == 0 ? Colors.transparent : Colors.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
