import 'package:employee_management/core/utils/app_colors.dart';
import 'package:employee_management/core/utils/strings.dart';
import 'package:employee_management/features/employee/presentation/bloc/employee_bloc.dart';
import 'package:employee_management/features/employee/presentation/screens/add_employee_detail_screen.dart';
import 'package:employee_management/features/employee/presentation/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../../../../route/route_configuration.dart';
import '../../domain/entites/employee_model.dart';
import '../bloc/employee_event.dart';
import '../bloc/employee_state.dart';
import '../widgets/build_employee_item.dart';
import '../widgets/no_employee_found.dart';


class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.sp),
        child: CommonAppbar(title: Strings.empList),
      ),
      floatingActionButton: FloatingButton(callback: () {
        redirectToAddEmpData();
      }),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          List<EmployeeModel> currentEmployees = state.employees
              .where((employee) => employee.endDate.isEmpty)
              .toList();
          List<EmployeeModel> preEmployees = state.employees
              .where((employee) => employee.endDate.isNotEmpty)
              .toList();

          return Container(
            color: state.employees.isEmpty ? AppColors.bgColor : AppColors.white,
            child: state.employees.isNotEmpty
                ? ListView(
              children: [
                // Current Employees Section
                if (currentEmployees.isNotEmpty)
                  Container(
                    color: AppColors.bgColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 8.sp),
                      child: Text(
                        Strings.currentEmployee,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ...currentEmployees.map((employee) {
                  return BuildEmployeeItem(context: context, employee: employee);
                }),

                // Previous Employees Section
                if (preEmployees.isNotEmpty)
                  Container(
                    color: AppColors.bgColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 12.sp),
                      child: Text(
                        Strings.prevEmployee,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ...preEmployees.map((employee) {
                  return BuildEmployeeItem(context: context, employee: employee);
                }),
              ],
            )
                : Center(child: NoEmployeeFound()),
          );
        },
      ),
    );
  }



  void redirectToAddEmpData() {
    Navigator.of(context).pushNamed(RouteConfiguration.empEditAdd);
  }
}


