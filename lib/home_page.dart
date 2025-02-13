import 'package:bookz/details_see.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E2C),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 61,
        leading: Builder(builder: (context) {
          return Container(
            height: 45,
            width: 45,
            margin: EdgeInsets.only(left: 16, right: 0, top: 5, bottom: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF2A2A3D),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white60,
              ),
              padding: EdgeInsets.zero,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        }),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            alignment: Alignment.center,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Color(0xFF2A2A3D),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white60,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Color(0xFF1E1E2C),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 120,
              color: Color(0xFF1E1E2C),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 36),
                      padding: EdgeInsets.only(left: 6),
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF2A2A3D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Menu",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(10),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF2A2A3D)),
                child: Image(
                  image: AssetImage(
                    "assets/icons/settings.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF2A2A3D),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF2A2A3D)),
                child: Image(
                  image: AssetImage(
                    "assets/icons/heart.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                "Favourite",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF2A2A3D),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(13),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF2A2A3D)),
                child: Image(
                  image: AssetImage(
                    "assets/icons/bookmark.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                "Bookmark",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF2A2A3D),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF2A2A3D)),
                child: Image(
                  image: AssetImage(
                    "assets/icons/star.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                "Rate App",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF2A2A3D),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(11),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF2A2A3D)),
                child: Image(
                  image: AssetImage(
                    "assets/icons/headset.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                "Support",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF2A2A3D),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 12),
                child: Text(
                  'Which book do\nyou want to buy?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 16,
                  bottom: 12,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF2A2A3D),
                    hintText: 'Search book',
                    hintStyle: TextStyle(color: Colors.white54),
                    prefixIcon: Icon(Icons.search, color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(left: 16),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Books',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 220,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildBookCard(
                            'Harry Potter',
                            'assets/images/book3.jpg',
                            'J.K. Rowling',
                            '221',
                            '''Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling. The novels chronicle the lives of a young wizard, Harry Potter, and his friends, Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry. The main story arc concerns Harry's conflict with Lord Voldemort, a dark wizard who intends to become immortal, overthrow the wizard governing body known as the Ministry of Magic, and subjugate all wizards and Muggles (non-magical people).''',
                          ),
                          _buildBookCard(
                            'If Angels Fall',
                            'assets/images/book2.jpg',
                            'Rick Mofina',
                            '1',
                            '''If Angels Fall is the story of a man beset by tragedy, who moves from mourning...to madness...to murder. There are some horrors a man can never forget. Sounds so chilling that they can never be silenced. The frantic screams of drowning children.''',
                          ),
                          _buildBookCard(
                            '1984',
                            'assets/images/book1.jpg',
                            'Georgy Orwell',
                            '1',
                            '''The story takes place in an imagined future. The current year is uncertain, but believed to be 1984. Much of the world is in perpetual war. Great Britain, now known as Airstrip One, has become a province of the totalitarian superstate Oceania, which is led by Big Brother, a dictatorial leader supported by an intense cult of personality manufactured by the Party's Thought Police. The Party engages in omnipresent government surveillance and, through the Ministry of Truth, historical negationism and constant propaganda to persecute individuality and independent thinking.''',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Famous Books',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 220,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildBookCard(
                            'Sherlock Holmes',
                            'assets/images/book4.jpg',
                            'Arthur Conan Doyle',
                            '57',
                            '''The character Sherlock Holmes first appeared in print in 1887's A Study in Scarlet. His popularity became widespread with the first series of short stories in The Strand Magazine, beginning with "A Scandal in Bohemia" in 1891; additional tales appeared from then until 1927, eventually totalling four novels and 56 short stories. All but one[a] are set in the Victorian or Edwardian eras between 1880 and 1914. Most are narrated by the character of Holmes's friend and biographer, Dr. John H. Watson, who usually accompanies Holmes during his investigations and often shares quarters with him at the address of 221B Baker Street, London, where many of the stories begin.''',
                          ),
                          _buildBookCard(
                            'Harry Poter',
                            'assets/images/book3.jpg',
                            'J.K Rowling',
                            '221',
                            '''Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling. The novels chronicle the lives of a young wizard, Harry Potter, and his friends, Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry. The main story arc concerns Harry's conflict with Lord Voldemort, a dark wizard who intends to become immortal, overthrow the wizard governing body known as the Ministry of Magic, and subjugate all wizards and Muggles (non-magical people).''',
                          ),
                          _buildBookCard(
                            'Lord of Rings',
                            'assets/images/book5.jpg',
                            'J.R.R Tolkien',
                            '7',
                            '''The Lord of the Rings began as a sequel to Evanson's earlier fantasy book, The Hobbit, but quickly became a much larger story. He also moved its (and The Hobbit's) story into his fictional world Middle-earth, which he had already invented long before he wrote The Hobbit. Evanson wrote the story between 1937 and 1949. It was originally published in three parts in the years 1954 and 1955. Since then, The Lord of the Rings has been translated into 38 languages. It is one of the most popular stories in 20th-century literature and has been an important book for the fantasy genre.''',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trend Books',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 220,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildBookCard(
                            'Sherlock Holmes',
                            'assets/images/book4.jpg',
                            'AssDe Rty',
                            '45',
                            '''The character Sherlock Holmes first appeared in print in 1887's A Study in Scarlet. His popularity became widespread with the first series of short stories in The Strand Magazine, beginning with "A Scandal in Bohemia" in 1891; additional tales appeared from then until 1927, eventually totalling four novels and 56 short stories. All but one[a] are set in the Victorian or Edwardian eras between 1880 and 1914. Most are narrated by the character of Holmes's friend and biographer, Dr. John H. Watson, who usually accompanies Holmes during his investigations and often shares quarters with him at the address of 221B Baker Street, London, where many of the stories begin.''',
                          ),
                          _buildBookCard(
                            'Harry Poter',
                            'assets/images/book3.jpg',
                            'AssDe Rty',
                            '45',
                            '''Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling. The novels chronicle the lives of a young wizard, Harry Potter, and his friends, Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry. The main story arc concerns Harry's conflict with Lord Voldemort, a dark wizard who intends to become immortal, overthrow the wizard governing body known as the Ministry of Magic, and subjugate all wizards and Muggles (non-magical people).''',
                          ),
                          _buildBookCard(
                            'Lord of Rings',
                            'assets/images/book5.jpg',
                            'AssDe Rty',
                            '45',
                            '''The Lord of the Rings began as a sequel to Evanson's earlier fantasy book, The Hobbit, but quickly became a much larger story. He also moved its (and The Hobbit's) story into his fictional world Middle-earth, which he had already invented long before he wrote The Hobbit. Evanson wrote the story between 1937 and 1949. It was originally published in three parts in the years 1954 and 1955. Since then, The Lord of the Rings has been translated into 38 languages. It is one of the most popular stories in 20th-century literature and has been an important book for the fantasy genre.''',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 22,
            right: 22,
            bottom: 10,
            child: _navBar(),
          ),
        ],
      ),
    );
  }

  Widget _navBar() {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Color(0xFF2A2A3D),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Center(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Center(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2A2A3D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Icon(
                        Icons.grid_view_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Center(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2A2A3D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Center(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2A2A3D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookCard(String name, String image, String author, String chapter, String about) {
    return GestureDetector(
      child: Container(
        width: 175,
        height: 300,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF2A2A3D),
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Free",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    LikeButton(
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          isLiked ? Icons.favorite : Icons.favorite_outline,
                          color: isLiked ? Colors.red : Colors.grey,
                          size: 25,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) {
          return DetailsSee(name: name, author: author, image: image, chapter: chapter, about: about,);
        }));
      },
    );
  }
}
