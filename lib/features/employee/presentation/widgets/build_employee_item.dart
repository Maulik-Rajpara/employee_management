import 'package:employee_management/features/employee/presentation/widgets/slide_left_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entites/employee_model.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import '../screens/add_employee_detail_screen.dart';

class BuildEmployeeItem extends StatelessWidget {
  const BuildEmployeeItem({
    super.key,
    required this.context,
    required this.employee,
  });

  final BuildContext context;
  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddEmployeeDetailScreen(employeeModel: employee),
          ),
        );
      },
      child: Dismissible(
        key: ValueKey(employee.id),
        background: SlideLeftBackground(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          context.read<EmployeeBloc>().add(DeleteEmployee(employee.id));
          Future.delayed(Duration(milliseconds: 100), () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${employee.name} has been deleted"),
                action: SnackBarAction(
                  label: "Undo",
                  onPressed: () {
                    context.read<EmployeeBloc>().add(RestoreEmployee());
                  },
                ),
              ),
            );
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: AppColors.formTextColor,
                    ),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    employee.role,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.descColor,
                    ),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    employee.endDate.isEmpty
                        ? "From ${employee.startDate}"
                        : "${employee.startDate} - ${employee.endDate}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: AppColors.descColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.sp),
            Divider(height:1.5 ,color: AppColors.bgColor),
          ],
        ),
      ),
    );
  }
}