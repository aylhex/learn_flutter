
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class NinePictureView extends StatelessWidget{
  final List<String> picList;
  NinePictureView(this.picList);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: picList.length >= 5 ? 3 : picList.length < 2 ? 1 : 2,
        children: List.generate(picList.length,
                (index) => GestureDetector(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Image.asset(picList[index], fit: BoxFit.cover,),
                    ),
                  ),
                  onTap: ()
                  {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return PicturePopUpWidget(picList, index);
                    }));
                  },
                )).toList(),
      ),
    );
  }
}

class PicturePopUpWidget extends StatefulWidget {
  final List picList;
  int index;
  PageController pageController;
  PicturePopUpWidget(this.picList, this.index){
    pageController = PageController(initialPage: index);
  }
  @override
  _PicturePopUpWidgetState createState()=> _PicturePopUpWidgetState();
}
class _PicturePopUpWidgetState extends State<PicturePopUpWidget>{
  
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              child:Container(
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index)
                    {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: AssetImage(widget.picList[index]),
                        initialScale: PhotoViewComputedScale.contained * 0.8,
                        //heroAttributes: HeroAttributes(tag: galleryItems[index].id),
                      );

                    },
                    itemCount: widget.picList.length,
                    loadingBuilder: (context, event) => Center(
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes),
                      ),
                    ),
                    //backgroundDecoration: Decoration(),
                    pageController: widget.pageController,
                    onPageChanged: (i)
                    {
                      setState(()
                      {
                        _index = i;
                      });
                    },
                  )
              ),
              onTap: ()
              {
                Navigator.pop(context);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                          widget.picList.length,
                          (i) => GestureDetector(
                          child:Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            foregroundColor: Theme.of(context).primaryColor,
                            radius: 3.0,
                            backgroundColor: _index == i ? Theme.of(context).primaryColor : Colors.white),
                      ),
                    )
                ).toList(),
              ),
            )
          ],
        )
    );
  }
}