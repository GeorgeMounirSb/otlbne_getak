// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// // import '../../features/close_shift/view/close_shift_screen.dart';
// // import '../../features/net_profit/view/net_profit_screen.dart';
// // import '../../features/sub_store/view/sub_store_screen.dart';
// // import '../../features/suppliers/view/suppliers_screen.dart';
// // import '../../features/charts/view/charts_screen.dart';
// import '../../features/chat/view/chat_screen.dart';
// import '../../features/dental_lab/view/dental_lab_screen.dart';
// import '../../features/departments/view/department_screen.dart';
// import '../../features/employee_salaries/view/employee_salaries_screen.dart';
// import '../../features/employees/view/add_employee_screen.dart';
// import '../../features/employees/view/employees_screen.dart';
// // import '../../features/entries/view/entries_screen.dart';
// import '../../features/expenses/view/expenses_screen.dart';
// import '../../features/general_report/view/general_report_screen.dart';
// import '../../features/insurance_companies/view/insurance_companies_screen.dart';
// import '../../features/login/view/login_screen.dart';
// import '../../features/patients/view/add_patient_screen.dart';
// import '../../features/patients/view/patients_screen.dart';
// import '../../features/procedures/view/procedures_screen.dart';
// import '../../features/remaining_payments/view/remaining_payments_screen.dart';
// // import '../../features/rooms/view/rooms_screen.dart';
// // import '../../features/sessions/view/sessions_screen.dart';
// import '../../features/system_settings/view/system_settings_screen.dart';
// import '../../features/tasks/view/tasks_screen.dart';
// // import '../../features/appointments/view/appointments_screen.dart';
// import '../../features/dashboard/view/dashboard_screen.dart';
// // import '../../features/laboratories/view/laboratory_screen.dart';
// // import '../../features/medical_supplies/view/medical_supplies_screen.dart';
// // import '../../features/medicines/view/medicines_screen.dart';
// import '../../features/patient_payments/view/patient_payments_screen.dart';
// // import '../../features/patients_accounts/view/patients_accounts_screen.dart';
// import '../helper/data_helper.dart';
// import '../utils/media_query_values.dart';

// class DrawerWidget extends StatelessWidget {
//   final String screenName;
//   const DrawerWidget({super.key, required this.screenName});

//   @override
//   Widget build(BuildContext context) {
//     var local = AppLocalizations.of(context)!;
//     var instance = DataHelper.instance;
//     return Drawer(
//       shadowColor: Colors.white,
//       backgroundColor: const Color(0xFFF4F6FA),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             if(instance['dashboard'] == true)
//             DrawerItem(current: screenName == 'Dashboard', title: local.dashboard, icon: Icons.home, screen: const HomeScreen()),
//             if(instance['patientFile'] == true)
//             DrawerItem(current: screenName == 'Add Patient', title: local.add_patient, icon: Icons.person_add, screen: const AddPatientScreen()),
//             if(instance['patientFile'] == true)
//             DrawerItem(current: screenName == 'Patients', title: local.patinets, icon: Icons.people, screen: const PatientsScreen()),
//             if(instance['taskList'] == true)
//             DrawerItem(current: screenName == 'Tasks', title: local.tasks, icon: Icons.task, screen: const TasksScreen()),
//             if(instance['chat'] == true)
//             DrawerItem(current: screenName == 'Chat', title: local.chat, icon: Icons.chat, screen: const ChatScreen()), 
//             if(instance['patientsPayments'] == true)
//             DrawerItem(current: screenName == 'General Report', title: local.general_report, icon: Icons.insert_chart, screen: const GeneralReportScreen()),
//             if(instance['addEmp'] == true)
//             DrawerItem(current: screenName == 'Add Employee', title: local.add_employee, icon: Icons.person_add, screen: const AddEmployeeScreen()),
//             if(instance['employeeList'] == true)
//             DrawerItem(current: screenName == 'Employees', title: local.employees, icon: Icons.people, screen: const EmployeesScreen()),
//             if(instance['departmentList'] == true)
//             DrawerItem(current: screenName == 'Departments', title: local.departments, icon: Icons.category, screen: const DepartmentScreen()),
//             if(instance['labList'] == true)
//             DrawerItem(current: screenName == 'Dental Lab', title: local.dental_lab, icon: Icons.medical_services_outlined, screen: const DentalLabScreen()),
//             if(instance['proceduresList'] == true)
//             DrawerItem(current: screenName == 'Procedures', title: local.procedures, icon: Icons.medical_services_outlined, screen: const ProceduresScreen(screenName: 'Procedures')),
//             if(instance['insuranceCompanies'] == true)
//             DrawerItem(current: screenName == 'Insurance Companies', title: local.insurance_companies, icon: Icons.medical_services_outlined, screen: const InsuranceCompaniesScreen()),
//             if(instance['settings'] == true)
//             DrawerItem(current: screenName == 'System Settings', title: local.system_settings, icon: Icons.settings, screen: const SystemScreen()),
//             if(instance['patientsPayments'] == true)
//             DrawerItem(current: screenName == 'Patient Payments', title: local.patient_payments, icon: Icons.payment, screen: const PaymentReportScreen()),
//             if(instance['remainingAmount'] == true)
//             DrawerItem(current: screenName == 'Remaining Payments', title: local.remaining_payments, icon: Icons.payment_outlined, screen: const RemainingPaymentsScreen()),
//             if(instance['expenses'] == true)
//             DrawerItem(current: screenName == 'Expenses', title: local.expenses, icon: Icons.money, screen: const ExpensesScreen()),
//             if(instance['employeesSalary'] == true)
//             DrawerItem(current: screenName == 'Employee Salaries', title: local.employee_salaries, icon: Icons.monetization_on, screen: const EmployeeSalariesScreen()),
//             DrawerItem(current: screenName == 'Logout', title: local.logout, icon: Icons.logout, onTap: () => logoutDialog(context)),
//           ],
//         ),
//       ),
//     );
//   }
//   logoutDialog(contextt) {
//     var instance = DataHelper.instance;
//     var local = AppLocalizations.of(contextt)!;
//     showDialog(
//       context: contextt,
//       builder: (context) => AlertDialog(
//         title: Text(local.logout),
//         content: Text(local.logout_msg),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(local.cancel),
//           ),
//           TextButton(
//             onPressed: () async{
//               Navigator.pop(context);
//               await instance.reset();
//               Navigator.pushReplacement(contextt, MaterialPageRoute(builder: (context) => const LoginScreen()));
//             },
//             child: Text(local.logout),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DrawerItem extends StatelessWidget {
//   final bool current;
//   final String title;
//   final IconData icon;
//   final Widget? screen;
//   final VoidCallback? onTap;

//   const DrawerItem({super.key, required this.current, required this.title, required this.icon, this.onTap, this.screen});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap ?? () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen!)),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         margin: const EdgeInsets.only(left: 20),
//         width: context.width,
//         decoration: BoxDecoration(
//           color: current ? const Color(0xFF1E1E2C) : Colors.transparent,
//           borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
//         ),
//         child: ListTile(
//           leading: Icon(icon, color: current ? Colors.white : Colors.black87),
//           title: Text(
//             title,
//             style: TextStyle(
//               color: current ? Colors.white : Colors.black87,
//               fontWeight: current ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }