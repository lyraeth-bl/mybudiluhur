import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mybudiluhur/components/my_card.dart';
import 'package:mybudiluhur/components/my_text.dart';
import 'package:mybudiluhur/features/ekstrakulikuler/domain/entities/ekstrakulikuler_user.dart';

class EkstrakulikulerPage extends StatefulWidget {
  final List<EkstrakulikulerUser> ekstrakulikulerUser;
  const EkstrakulikulerPage({super.key, required this.ekstrakulikulerUser});

  @override
  State<EkstrakulikulerPage> createState() => _EkstrakulikulerPageState();
}

class _EkstrakulikulerPageState extends State<EkstrakulikulerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20).r,
      itemCount: widget.ekstrakulikulerUser.length,
      itemBuilder: (context, index) {
        final ekstrakulikuler = widget.ekstrakulikulerUser[index];
        // Card
        return MyCard(
          color: Theme.of(context).colorScheme.surface,
          borderColor: Theme.of(context).colorScheme.onInverseSurface,
          child: Padding(
            padding: const EdgeInsets.all(10.0).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // * Icon
                      Icon(
                        _getIconByKegiatan(ekstrakulikuler.namaKegiatan),
                        size: 35.r,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 20.w),

                      // * Nama
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 5.w),
                          MyText(
                            text: ekstrakulikuler.namaKegiatan,
                            bold: true,
                            textSize: 18.r,
                            textColor: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(height: 8.h),

                          // * Kelas
                          MyText(
                            text:
                                '${ekstrakulikuler.nomorKelas} ${ekstrakulikuler.kelas}',
                            textSize: 14.r,
                            textColor: Theme.of(context).colorScheme.onSurface,
                          ),
                          SizedBox(width: 20.w),
                        ],
                      ),
                    ],
                  ),
                ),

                // * Nilai
                MyText(
                  text: ekstrakulikuler.nilai,
                  textSize: 20.r,
                  bold: true,
                  textColor: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
    );
  }

  // Logic Icon
  IconData _getIconByKegiatan(String? nama) {
    switch ((nama ?? '').toLowerCase()) {
      case 'advertising company':
        return Icons.campaign;
      case 'band':
        return Icons.music_note;
      case 'basic photography':
        return Icons.photo_camera;
      case 'basket':
        return Icons.sports_basketball;
      case 'bimbingan quran dan hadis':
        return Icons.menu_book;
      case 'bulutangkis':
        return Icons.sports_tennis; // closest: tennis/racket icon
      case 'cinematography':
        return Icons.movie;
      case 'creative coding':
        return Icons.code;
      case 'creative content':
        return Icons.create;
      case 'documentary film':
        return Icons.video_library;
      case 'drone pilot':
        return Icons.airplanemode_active;
      case 'esport':
        return Icons.sports_esports;
      case 'film animasi':
        return Icons.animation;
      case 'fine art':
        return Icons.palette;
      case 'futsal':
        return Icons.sports_soccer;
      case 'game development':
        return Icons.videogame_asset;
      case 'internet of things':
        return Icons.devices_other;
      case 'japan club':
        return Icons.language; // closest: language/culture
      case 'manga':
        return Icons.book;
      case 'metaverse budiluhur school':
        return Icons.vrpano;
      case 'mobile apps':
        return Icons.smartphone;
      case 'modern dance':
        return Icons.people;
      case 'paskibra':
        return Icons.flag;
      case 'science club':
        return Icons.science;
      case 'short movie':
        return Icons.movie_filter;
      case 'sound design':
        return Icons.surround_sound;
      case 'taekwondo':
        return Icons.sports_martial_arts;
      case 'tari saman':
        return Icons.groups; // group performance
      case 'teater':
        return Icons.theater_comedy;
      case 'toefl preparation':
        return Icons.school;
      case 'traditional dance':
        return Icons.group; // need custom, fallback to groups
      case 'tv program':
        return Icons.tv;
      case 'umkm application':
        return Icons.store;
      case 'web application':
        return Icons.web;
      default:
        return Icons.star;
    }
  }
}
