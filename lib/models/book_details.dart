import 'package:animations/animations.dart';
import 'package:bookz/models/book_data.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../screens/details_see.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  const BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      transitionDuration: Duration(milliseconds: 450),
      closedColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      openBuilder: (context, action) => DetailsSee(book: book),
      closedBuilder: (context, action) => Container(
        margin: EdgeInsets.fromLTRB(10, 60, 10, 120),
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(book.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    "Free",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 4),
                padding: EdgeInsets.only(left: 4, top: 2),
                alignment: Alignment.center,
                width: 47,
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: LikeButton(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      isLiked ? Icons.favorite : Icons.favorite_outline,
                      color: isLiked ? Colors.white : Colors.black45,
                      size: 28,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
