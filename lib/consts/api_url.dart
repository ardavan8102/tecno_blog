class ApiUrl {

  // Base Url
  static const String baseURL = 'https://techblog.sasansafari.com/Techblog/api/';
  static const String baseAddress = 'https://techblog.sasansafari.com';

  // Api Queries
  static const String getHomeItems = '${baseURL}home/?command=index';
  static const String getNewArticles = '${baseURL}article/get.php?command=new&user_id=1';

}