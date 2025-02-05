import 'package:employee_management/core/utils/assets.dart';
import 'package:employee_management/core/utils/calender.dart';
import 'package:employee_management/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_common.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/common_appbar.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/secondary_button.dart';
import '../../domain/entites/employee_model.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import '../bloc/employee_state.dart';

class AddEmployeeDetailScreen extends StatefulWidget {
  EmployeeModel? employeeModel;
   AddEmployeeDetailScreen({super.key, this.employeeModel});

  @override
  State<AddEmployeeDetailScreen> createState() =>
      _AddEmployeeDetailScreenState();
}

class _AddEmployeeDetailScreenState extends State<AddEmployeeDetailScreen> with Validator {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController todayController = TextEditingController();
  final TextEditingController fromDayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? fromDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.employeeModel!=null){
      nameController.text = widget.employeeModel!.name;
      roleController.text = widget.employeeModel!.role;
      fromDayController.text = widget.employeeModel!.startDate;
      todayController.text = widget.employeeModel!.endDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.employeeModel != null;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.sp),
            child: CommonAppbar(
              title: isEditMode ? Strings.editEmpDetails : Strings.addEmpDetails,
            )),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColors.white,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    padding: EdgeInsets.all(12.sp),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(

                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                AssetsPath.person,
                              ),
                            ),textEditingController: nameController,
                            hintText: Strings.empName,
                            validator: validateName,
                            onChanged: (val) => context.read<EmployeeBloc>().add(ValidateForm(nameController.text, roleController.text)),
                          ),
                          SizedBox(
                            height: 12.sp,
                          ),
                          CustomTextField(
                            isReadOnly: true,
                            textEditingController: roleController,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                AssetsPath.work,
                              ),
                            ),
                            onTap: () {
                              AppCommon.showRoleSelectionSheet(context,
                                  (selectedRole) {
                                    roleController.text=selectedRole;
                                print("Selected Role: $selectedRole");
                              });
                            },
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: SvgPicture.asset(
                                AssetsPath.dropdownArrow,
                              ),
                            ),
                            hintText: Strings.selRole,
                            validator: validateRole,
                          ),
                          SizedBox(
                            height: 12.sp,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  isReadOnly: true,
                                  onTap: (){
                                    Calender.showCalendarDialog(context,datePick: (date){
                                      fromDate = date;
                                      fromDayController.text = DateFormat("d MMM yyyy").format(date);
                                    },fromDate: null,isOpenFromToDate: false);
                                  },
                                  textEditingController: fromDayController,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(AssetsPath.calender),
                                  ),
                                  hintText: Strings.today,
                                  validator: validateDate,
                                ),
                              ),
                              SizedBox(
                                width: 8.sp,
                              ),
                              SvgPicture.asset(AssetsPath
                                  .rightAt), // Add spacing between fields
                              SizedBox(
                                width: 8.sp,
                              ),
                              Expanded(
                                child: CustomTextField(
                                  isReadOnly: true,
                                  onTap: (){
                                    Calender.showCalendarDialog(context,datePick: (date){
                                      todayController.text = DateFormat("d MMM yyyy").format(date);
                                    },fromDate:fromDate,isOpenFromToDate: true);
                                  },
                                  textEditingController: todayController,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(AssetsPath.calender),
                                  ),
                                  hintText: Strings.noDate,
                                  validator: null,
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70.sp,
                        color: AppColors.white,
                        child: Column(
                          children: [
                            Container(
                              height: 1.5.sp,
                              color: AppColors.bgColor,
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SecondaryButton(
                                  label: Strings.cancel,
                                  callback: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                PrimaryButton(
                                  label: isEditMode ? Strings.update : Strings.save,
                                  callback: () {

                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (_formKey.currentState!.validate()) {


                                      var employee = EmployeeModel(
                                        id: isEditMode ? widget.employeeModel!.id : Uuid().v4(),
                                        name: nameController.text,
                                        role: roleController.text,
                                        startDate: fromDayController.text,
                                        endDate: todayController.text,
                                        isPreviousEmployee: todayController.text.isEmpty
                                      );

                                      if (isEditMode) {
                                        context.read<EmployeeBloc>().add(EditEmployee(employee));
                                      } else {
                                        context.read<EmployeeBloc>().add(AddEmployee(employee));
                                      }

                                      Navigator.of(context).pop();
                                    }

                                  }
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            );
          },
        ));
  }
}
