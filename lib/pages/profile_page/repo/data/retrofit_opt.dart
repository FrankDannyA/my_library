import 'package:dio/dio.dart';
import 'package:my_library/pages/profile_page/repo/models/user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_opt.g.dart';

@RestApi(baseUrl: 'https://randomuser.me/')
abstract class RetofitOpt {
  factory RetofitOpt(Dio dio) = _RetofitOpt;

  @GET('api')
  Future<UserResponse> getUser();
}
