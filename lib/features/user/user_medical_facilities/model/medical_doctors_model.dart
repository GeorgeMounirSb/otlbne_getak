class MedicalDoctorsModel {
  final String id, name, img;
  final List<DoctorAppointmentsModel> appointments = [
    DoctorAppointmentsModel(id: '1', time: '10:00 ص', isAvailable: true),
    DoctorAppointmentsModel(id: '2', time: '11:00 ص', isAvailable: false),
    DoctorAppointmentsModel(id: '3', time: '12:00 م', isAvailable: true),
    DoctorAppointmentsModel(id: '4', time: '01:00 م', isAvailable: true),
    DoctorAppointmentsModel(id: '5', time: '02:00 م', isAvailable: false),
    DoctorAppointmentsModel(id: '6', time: '03:00 م', isAvailable: true),
    DoctorAppointmentsModel(id: '7', time: '04:00 م', isAvailable: true),
    DoctorAppointmentsModel(id: '8', time: '05:00 م', isAvailable: false),
    DoctorAppointmentsModel(id: '9', time: '06:00 م', isAvailable: true),
    DoctorAppointmentsModel(id: '10', time: '07:00 م', isAvailable: true),
  ];

  MedicalDoctorsModel({required this.id, required this.name, required this.img});
}

class DoctorAppointmentsModel {
  final String id, time;
  final bool isAvailable;

  DoctorAppointmentsModel({required this.id, required this.time, required this.isAvailable});
}