import 'package:data/dao/users_dao.dart';
import 'package:remoteservice/user_service.dart';

class UserRepository {
  UsersDao _usersDao;
  UserService _service;

  UserRepository(this._usersDao, this._service);
}
