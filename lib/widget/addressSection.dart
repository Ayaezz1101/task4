import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task4/provider/coffeeProvidor.dart';
import 'package:task4/widget/note&addressButton.dart';
import '../../theme/appTheme.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoffeeProvider>(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Delivery Address", style: textTheme.bodyLarge),
        SizedBox(height: 16.h),
        
        Text(
          provider.addressTitle, 
          style: textTheme.bodyLarge?.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 4.h),
        Text(provider.addressDetail, style: textTheme.bodyMedium),
        
        if (provider.deliveryNote.isNotEmpty) ...[
          SizedBox(height: 8.h),
          Text(
            "Note: ${provider.deliveryNote}",
            style: textTheme.bodyMedium?.copyWith(
              color: AppTheme.primaryCoffee,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        
        SizedBox(height: 16.h),
        Row(
          children: [
            SmallActionButton(
              icon: Icons.edit_location_alt_outlined,
              label: "Edit Address",
              onTap: () => _showEditAddressDialog(context, provider),
            ),
            SizedBox(width: 8.w),
            SmallActionButton(
              icon: Icons.note_add_outlined,
              label: "Add Note",
              onTap: () => _showNoteDialog(context, provider),
            ),
          ],
        ),
        
        SizedBox(height: 20.h),
        const Divider(color: AppTheme.lightGrey, thickness: 1),
      ],
    );
  }

  void _showEditAddressDialog(BuildContext context, CoffeeProvider provider) {
    final titleController = TextEditingController(text: provider.addressTitle);
    final detailController = TextEditingController(text: provider.addressDetail);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text("Edit Address", style: Theme.of(context).textTheme.bodyLarge),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Address Name",
                hintText: "e.g. Home, Office",
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: detailController,
              decoration: const InputDecoration(
                labelText: "Full Address Details",
                hintText: "Enter street, building, city...",
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100.w, 40.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
            onPressed: () {
              if (titleController.text.isNotEmpty && detailController.text.isNotEmpty) {
                provider.updateAddress(titleController.text, detailController.text);
                Navigator.pop(context);
              }
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
  void _showNoteDialog(BuildContext context, CoffeeProvider provider) {
    final controller = TextEditingController(text: provider.deliveryNote);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text("Delivery Note", style: Theme.of(context).textTheme.bodyLarge),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "e.g. Extra sugar, floor number...",
          ),
          maxLines: 2,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100.w, 40.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
            onPressed: () {
              provider.updateNote(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
