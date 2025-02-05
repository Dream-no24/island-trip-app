// KakaoAPI 클래스는 Kakao의 로컬 API를 사용하여 장소 검색 기능을 제공
// 검색어와 위치 정보를 기반으로 장소를 검색하고, 검색 결과를 JSON 데이터로 반환

import 'package:http/http.dart' as http; // HTTP 요청을 보내기 위한 http 패키지
import 'dart:convert'; // JSON 데이터를 디코딩하고 인코딩하기 위한 dart:convert 패키지
import 'package:flutter_dotenv/flutter_dotenv.dart'; // .env 파일에서 API 키 등의 환경 변수를 로드

class KakaoAPI {
  final String apiKey = dotenv.env['KAKAO_API_KEY']!; // .env 파일에서 Kakao API 키를 가져와 apiKey 변수에 저장

  // 장소를 검색하는 메서드
  // 검색어(query), 위도(latitude), 경도(longitude), 반경(radius), 페이지(page), 크기(size)를 인자로 받음
  // latitude와 longitude는 선택적, 반경은 기본값으로 20,000미터를 사용. 페이지와 크기도 기본값 설정.
  Future<List<Map<String, dynamic>>> searchPlaces(String query,
      {double? latitude, double? longitude, int radius = 20000, int page = 3, int size = 15}) async {

    // Kakao API의 기본 URL
    const String url = 'https://dapi.kakao.com/v2/local/search/keyword.json';

    // 기본적으로 검색어와 반경을 포함한 요청 URL, 페이지와 크기도 포함됨.
    String requestUrl = '$url?query=$query&radius=$radius&page=$page&size=$size';

    // 위도와 경도가 제공된 경우, 이를 요청 URL에 추가
    if (latitude != null && longitude != null) {
      requestUrl += '&y=$latitude&x=$longitude';
    }

    // 구성된 요청 URL을 사용하여 HTTP GET 요청을 보내기
    final response = await http.get(
      Uri.parse(requestUrl), // 문자열로 된 요청 URL을 URI로 변환하여 요청
      headers: {
        'Authorization': 'KakaoAK $apiKey', // 헤더에 Kakao API 키를 포함하여 요청하려면
      },
    );

    // HTTP 요청이 성공적일 경우 (상태 코드 200)
    if (response.statusCode == 200) {
      final data = json.decode(response.body); // 응답 바디를 JSON 형식으로 디코딩
      return List<Map<String, dynamic>>.from(data['documents']); // JSON 데이터에서 'documents' 배열을 추출하여 리스트로 반환
    } else {
      // 요청이 실패한 경우, 에러 메시지를 출력
      // print('Response body: ${response.body}'); // 응답 바디 출력
      throw Exception('Failed to load places'); // 예외를 발생시켜 호출자에게 오류를 알리기
    }
  }
}
