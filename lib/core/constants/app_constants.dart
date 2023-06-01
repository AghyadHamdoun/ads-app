import 'package:easy_localization/easy_localization.dart';

class AppConstants{

  //for images
  static const String baseImgURL = "https://landlord.cityproperties.ae/";
  static const String serverUrlTechImages ="http://tenant.cityproperties.ae";

  // Live
  // static const String serverUrl = "http://40.119.162.165:8080";
  // static const String serverUrlExt = "/JobVisitm/Rest/";

  // Local 1603
  static const String serverUrl = "http://192.168.1.121:8080";
  static const String serverUrlExt = "/JobVisit/Rest/";

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