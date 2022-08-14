import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecblog/components/my_tag.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/model/fake_data.dart';
import 'package:tecblog/my_colors.dart';
import 'package:tecblog/my_string.dart';

class MyCatsScreen extends StatefulWidget {
  const MyCatsScreen({Key? key}) : super(key: key);

  @override
  State<MyCatsScreen> createState() => _MyCatsScreenState();
}

class _MyCatsScreenState extends State<MyCatsScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      backgroundColor: SolidColors.scaffoldBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Column(children: [
            const SizedBox(
              height: 32,
            ),
            SvgPicture.asset(
              Assets.images.techBot.path,
              height: 100,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              MyStrings.successfullRegister,
              style: textTheme.headline4,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              style: textTheme.headline4,
              decoration: InputDecoration(
                hintText: 'نام و نام خانوادگی',
                hintStyle: textTheme.headline5,
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              MyStrings.chooseCats,
              style: textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                height: 85,
                child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: tagList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.2,
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            selectedTag.add(tagList[index].title);
                          });
                        },
                        child:
                            TagContainer(textTheme: textTheme, index: index));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Image.asset(
              Assets.icons.downArrows.path,
              scale: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                height: 85,
                child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: selectedTag.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.2,
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return TagContainer(
                      textTheme: textTheme,
                      index: index,
                      tagSelected: true,
                      onTap: () {
                        setState(() {
                          selectedTag.remove(selectedTag.elementAt(index));
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
