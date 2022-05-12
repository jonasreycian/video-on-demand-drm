import 'package:aq_prime/domain/entities/content.dart';

class Constants {
  // APIs
  static const String baseUrl = 'http://$baseUrlNoPrefix';
  static const String usersRoute = '$baseUrl/users';
  static const String loginRoute = '$baseUrl/login';
  static const String forgotPasswordRoute = '$baseUrl/forgot-password';
  static const String contentRoute = '$baseUrl/data.json';
  static const String registerRoute = '$baseUrl/register';

  // APIs no prefix
  static const String baseUrlNoPrefix =
      'netflix-clone-d49e9-default-rtdb.firebaseio.com';

  // Local Storage
  static const String tokenKey = 'authentication_token';
  static const String userKey = 'user_key';
  static const String isAuthenticatedKey = 'isUserAuthenticated';

  static Content clientContent = Content.fromJson({
    "age": "13",
    "altKategoriler": ["Romantik", "İyi Hissettiren", "Samimi"],
    "category": ["Sürükleyici"],
    "dislikeButton": false,
    "id": 1741401,
    "img":
        "https://i.ibb.co/vdC9h6r/AAAABYvvc-FWuu-EYi-V-Ur-E7zn-SFk-T-H9r87j-Fr8-Mr24-WAMn-Wofuwjs1y-Wnh-JXNTv-XCd-Xm-GNck-Hsp74p7h-Fp6.jpg",
    "izlenilmeSayisi": 0,
    "likeButton": false,
    "listeyeEklendi": false,
    "logo":
        "https://i.ibb.co/1ZbgGrx/AAAABfjv-GBNRMin-Rnlg-Gx-SXh-LFb9avpos2m-CV4-Kig-Wnwvrzk-BIEg-HL1x09s0-Fthi-Hr-Jbs-OXI-hde-Hg-T9-Cmo.webp",
    "newAndDate": "Yeni",
    "oyuncuKadrosu": ["George Mackay", "Jannis Niewöhner", "Jeremy Irons"],
    "populer": true,
    "senarist": ["Ben Power"],
    "time": "1 sa. 37 dk.",
    "title": "Savaş Yaklaşıyor",
    "type": "Film",
    "videoDescription":
        "1938'de gergin geçen Münih Konferansı'nda artık rakip hükümetler için çalışan eski arkadaşlar bir Nazi sırrını açığa çıkarmak için yarışan gönülsüz casuslar haline gelir.",
    "videoQuality": "HD",
    "videosrc":
        "https://tr.vid.web.acsta.net/uk/medias/nmedia/90/21/12/06/12/19561256_hd_013.mp4",
    "year": "2022",
    "yonetmen": ["Christian Schwochow"]
  });
}
