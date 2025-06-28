import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_container.dart';
import 'package:mybudiluhur/components/my_text.dart';

class ForumPage extends StatefulWidget {
  // final List<ForumApp>? forumApp;
  // final List<Map<String, dynamic>> dummyForum;

  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: "Forum", bold: true, textSize: 20.r),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16).r,
        itemCount: dummyForum.length,
        itemBuilder: (context, index) {
          final forum = dummyForum[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16).r,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12).r,
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header dengan author info
                  Row(
                    children: [
                      // * Image Author
                      CircleAvatar(
                        backgroundImage: AssetImage(forum['authorImageUrl']),
                        radius: 20.r,
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // * Nama
                          MyText(
                            text: forum['authorName'],
                            bold: true,
                            textSize: 18.r,
                            textColor: Theme.of(context).colorScheme.onSurface,
                          ),

                          // * Waktu
                          SizedBox(height: 5.h),
                          MyText(
                            text: forum['timePostForum'],
                            textSize: 12.r,
                            textColor: Theme.of(context).colorScheme.tertiary,
                          ),
                        ],
                      ),
                      const Spacer(),

                      // * Tags
                      MyContainer(
                        color: Theme.of(context).colorScheme.primary,
                        child: MyText(
                          text: forum['tagsForum'],
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          textSize: 14.r,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // * Judul Konten forum
                  MyText(
                    text: forum['titleForum'],
                    bold: true,
                    textSize: 16.r,
                    textColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  SizedBox(height: 8.h),

                  // * Konten Forum
                  MyText(
                    text: forum['bodyForum'],
                    maxLines: 3,
                    textSize: 14.r,
                    textOverflow: TextOverflow.ellipsis,
                    textColor: Theme.of(context).colorScheme.tertiary,
                  ),
                  SizedBox(height: 16.h),

                  // * Footer dengan like dan comment
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up_outlined),
                        onPressed: () {},
                        iconSize: 20.r,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      MyText(
                        text: forum['likesForum'].toString(),
                        textSize: 12.r,
                        textColor: Theme.of(context).colorScheme.tertiary,
                      ),
                      SizedBox(width: 16.h),
                      IconButton(
                        icon: const Icon(Icons.comment_outlined),
                        onPressed: () {},
                        iconSize: 20.r,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      MyText(
                        text: forum['commentsForum'].toString(),
                        textSize: 12.r,
                        textColor: Theme.of(context).colorScheme.tertiary,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // Navigasi ke detail forum
                        },
                        child: MyText(
                          text: 'Baca Selengkapnya',
                          textSize: 14.r,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  final List<Map<String, dynamic>> dummyForum = [
    {
      'id': 1,
      'authorName': "Budi Luhur",
      'authorImageUrl': 'assets/image/bl_logo.png',
      'tagsForum': 'Teknologi',
      'titleForum': "Pengaruh AI terhadap Pendidikan Modern",
      'bodyForum':
          "Artificial Intelligence telah membawa revolusi dalam metode pembelajaran. Bagaimana pendapat Anda tentang penerapan AI di kelas-kelas Indonesia?",
      'timePostForum': '2 jam yang lalu',
      'likesForum': 24,
      'commentsForum': 8,
    },
    {
      'id': 2,
      'authorName': "Budi Luhur",
      'authorImageUrl': 'assets/image/bl_logo.png',
      'tagsForum': 'Teknologi',
      'titleForum': "Perkembangan Blockchain di Tahun 2023",
      'bodyForum':
          "Teknologi blockchain terus berkembang pesat. Mari diskusikan aplikasi praktisnya di berbagai sektor industri!",
      'timePostForum': '1 hari yang lalu',
      'likesForum': 42,
      'commentsForum': 15,
    },
    {
      'id': 3,
      'authorName': "Budi Luhur",
      'authorImageUrl': 'assets/image/bl_logo.png',
      'tagsForum': 'Teknologi',
      'titleForum': "Keamanan Data di Era Digital",
      'bodyForum':
          "Dengan meningkatnya serangan siber, bagaimana kita bisa melindungi data pribadi dengan lebih efektif?",
      'timePostForum': '3 hari yang lalu',
      'likesForum': 37,
      'commentsForum': 12,
    },
    {
      'id': 4,
      'authorName': "Budi Luhur",
      'authorImageUrl': 'assets/image/bl_logo.png',
      'tagsForum': 'Teknologi',
      'titleForum': "Masa Depan IoT di Indonesia",
      'bodyForum':
          "Internet of Things memiliki potensi besar untuk transformasi digital. Apa tantangan utama penerapannya di Indonesia?",
      'timePostForum': '5 hari yang lalu',
      'likesForum': 29,
      'commentsForum': 7,
    },
    {
      'id': 5,
      'authorName': "Mahsa Nurfarhan Hidayat",
      'authorImageUrl': 'assets/image/bl_logo.png',
      'tagsForum': 'Teknologi',
      'titleForum': "Cloud Computing untuk UMKM",
      'bodyForum':
          "Bagaimana solusi cloud computing dapat membantu usaha kecil dan menengah meningkatkan produktivitas mereka?",
      'timePostForum': '1 minggu yang lalu',
      'likesForum': 18,
      'commentsForum': 5,
    },
  ];
}
