import 'package:easy_localization/easy_localization.dart';

class AppConstants{

  static const String baseUrl = "https://mobileapp.developerwaqas.com/api";
  static const String login = "/login";

  //for images
  static const String baseImgURL = "https://landlord.cityproperties.ae/";
  static const String serverUrlTechImages ="http://tenant.cityproperties.ae";

  static const String baseUrl = "https://mobileapp.developerwaqas.com/api/";
  static const String logIn= "";
  static const String typesObjects= "get-type-objective";


  static const String baseUrl = serverUrl+serverUrlExt;
  static const String logIn= "loginCollector/collector";
  static const String userPrivileges= "getPrivilegesCollector/collector";
  static const String techJobs= "techCollectorJobsListing/collector";
  static const String getEmployee = 'employeeActCollector/collector';
  static const String updateCollector = 'updateCollector/collector';
  static const String handoverHistory= "handoverHistoryCollector/collector";
  static const String transDetails= "transactionDetailsCollector/collector";



}

class Er {

  static String error = tr("some thing wrong");
  static String networkError = tr("check connection");

}