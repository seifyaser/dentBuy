import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/home/models/list_model.dart';
import 'package:flutter/material.dart';

class ListViewCard extends StatelessWidget {
  final ProductModel product;
  final bool isFavorite;
  final VoidCallback onTap;

  const ListViewCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.graycolor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔝 الصورة (تاخد نص الكارد أو أكتر)
          Expanded(
            flex: 6, // 👈 تتحكم في النسبة هنا
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                "assets/images/clinic.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔽 البيانات
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Clinic for rent',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: AppColors.graycolor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          product.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.graycolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Icon(
                          isFavorite ? Icons.bookmark : Icons.bookmark_border,
                          color: isFavorite
                              ? AppColors.primary
                              : AppColors.graycolor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
