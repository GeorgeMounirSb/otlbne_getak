import 'cache_helper.dart';

class DataHelper {
  DataHelper._privateConstructor();

  static final DataHelper _instance = DataHelper._privateConstructor();

  static DataHelper get instance => _instance;

  String? token, name;
  int? id, userType; ///1=>driver, 2=>facility, 3=>user

  set() async{
    await CacheHelper.setData('userId', id);
    await CacheHelper.setData('userType', userType);
    await CacheHelper.setData('name', name);
    await CacheHelper.setData('token', token);
  }
  get() async{
    name = await CacheHelper.getData('name', String);
    token = await CacheHelper.getData('token', String);
    id = await CacheHelper.getData('userId', int);
    userType = await CacheHelper.getData('userType', int);
  }
  reset() async{
    await CacheHelper.removeAllData();
    name = null;
    token = null;
    id = null;
    userType = null;
  }
}

// class DataHelper {
//   DataHelper._privateConstructor();

//   static final DataHelper _instance = DataHelper._privateConstructor();
//   static DataHelper get instance => _instance;

//   final Map<String, dynamic> _data = {};

//   static final Map<String, Type> _dataTypes = {
//     'user_type': int, ///1=>driver, 2=>facility, 3=>user
//     'is_logged_in': bool,
//     ///driver_data
//     'userId': int,
//     'token': String,
//     'user_name': String,
//   };

//   set() async {
//     for (var key in _data.keys) {
//       await CacheHelper.setData(key, _data[key]);
//     }
//   }

//   get() async {
//     for (var key in _dataTypes.keys) {
//       _data[key] = await CacheHelper.getData(key, _dataTypes[key]!);
//     }
//   }

//   reset() async {
//     await CacheHelper.removeAllData();
//     _data.updateAll((key, value) => null);
//   }

//   dynamic operator [](String key) => _data[key];
//   void operator []=(String key, dynamic value) => _data[key] = value;
// }