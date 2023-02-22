import 'package:flutter/material.dart';
import 'package:toonflix/srceen/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector는 대부분의 동작을 감지하도록 해줌
    return GestureDetector(
      // onTap은 클릭했을때 이벤트 실행
      onTap: () {
        // Navigator.push를 사용하면 애니매이션 효과를 이용해 다른페이지에 온것처럼 보이게 할 수 있음
        // Navigator.push(context, route);
        // MaterialPageRoute는 StatelessWidget를 감싸서 다른 route처럼 보이게 만들어줌
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            // fullscreenDialog: true, // 밑에서부터 새로운 페이지올라오도록
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5)),
                ]),
            child: Image.network(thumb),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
