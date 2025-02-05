import 'package:flutter/material.dart';
import '../models/place_model.dart';

class PlaceDetailPage extends StatefulWidget {
  final PlaceModel place; // PlaceModel 인스턴스를 저장하는 변수

  const PlaceDetailPage({super.key, required this.place}); // 생성자에서 'super.key' 사용 및 'const' 추가

  @override
  PlaceDetailPageState createState() => PlaceDetailPageState(); // State 클래스 생성
}

class PlaceDetailPageState extends State<PlaceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.placeName), // 앱바의 제목을 장소 이름으로 설정
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 화면 패딩 설정
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 컨텐츠를 왼쪽 정렬
            children: [
              const Text(
                '장소 정보', // 섹션 제목
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // 텍스트 스타일 설정
              ),
              const SizedBox(height: 10), // 위아래 공간 추가

              // 각 필드에 접근하여 필요한 정보만 출력
              Text(
                '장소 이름: ${widget.place.placeName}',
                style: const TextStyle(fontSize: 16),
              ), // 장소 이름 출력
              const SizedBox(height: 10), // 위아래 공간 추가

              Text(
                '주소: ${widget.place.addressName}',
                style: const TextStyle(fontSize: 16),
              ), // 주소 출력
              const SizedBox(height: 10), // 위아래 공간 추가

              Text(
                '전화번호: ${widget.place.phone}',
                style: const TextStyle(fontSize: 16),
              ), // 전화번호 출력
              const SizedBox(height: 10), // 위아래 공간 추가

              Text(
                '카테고리: ${widget.place.categoryGroupName}',
                style: const TextStyle(fontSize: 16),
              ), // 카테고리 그룹 이름 출력
              const SizedBox(height: 10), // 위아래 공간 추가

              Text(
                '웹사이트: ${widget.place.placeUrl}',
                style: const TextStyle(fontSize: 16),
              ), // 장소 URL 출력
              const SizedBox(height: 10), // 위아래 공간 추가

              Text(
                '경도: ${widget.place.x}',
                style: const TextStyle(fontSize: 16),
              ), // 경도 출력
              const SizedBox(height: 10), // 위아래 공간 추가

              Text(
                '위도: ${widget.place.y}',
                style: const TextStyle(fontSize: 16),
              ), // 위도 출력
              const SizedBox(height: 10), // 위아래 공간 추가

              Text(
                '거리: ${widget.place.distance}m',
                style: const TextStyle(fontSize: 16),
              ), // 거리 출력 (단위: 미터)
            ],
          ),
        ),
      ),
    );
  }
}
