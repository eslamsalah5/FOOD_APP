import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';

class AddRequest extends StatelessWidget {
  const AddRequest({
    super.key,
    required this.addRequestController,
  });

  final TextEditingController addRequestController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add a request',
          style: TextStyle(
            fontSize: headLineFont2,
            fontWeight: FontWeight.w600,
            color: Color(0xFF666687),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 12, horizontal: 16),
          height: 82,
          width: 327,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(16),
          ),
          child: TextField(
            decoration: const InputDecoration.collapsed(
                hintText: 'Ex: Don’t add onion'),
            maxLines: 3,
            controller: addRequestController,
          ),
        ),
      ],
    );
  }
}
