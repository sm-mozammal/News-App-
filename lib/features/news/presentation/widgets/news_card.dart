import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../gen/assets.gen.dart';
import '../../model/data_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.data,
  });

  final Article data;

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.grey.shade100,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CachedNetworkImage(
            height: 200.h,
            width: double.maxFinite,
            fit: BoxFit.cover,
            imageUrl: data.urlToImage ??
                'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
            errorWidget: (context, url, error) => Image.asset(
              Assets.images.image.path,
            ),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: const SizedBox(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  data.title ?? 'NA',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  data.description ?? 'NA',
                  style: TextStyle(fontSize: 10.sp),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.source!.name!,
                      style: const TextStyle(color: Colors.blue),
                    ),
                    Text(
                      data.publishedAt!.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          )
        ])

        // ListTile(
        //   leading: SizedBox(
        //     height: 100,
        //     child: CachedNetworkImage(
        //       fit: BoxFit.cover,
        //       imageUrl: data.urlToImage ??
        //           'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
        //       errorWidget: (context, url, error) => Image.asset(
        //         Assets.images.image.path,
        //       ),
        //       placeholder: (context, url) => Image.asset(
        //         Assets.images.image.path,
        //       ),
        //     ),
        //   ),
        //   title: Text(
        //     data.title ?? 'NA',
        //     style: TextStyle(fontSize: 12.sp),
        //     textAlign: TextAlign.justify,
        //   ),
        //   subtitle: Text(
        //     data.source!.name!,
        //     style: TextStyle(color: Colors.blue),
        //   ),
        // ),

        );
  }
}
