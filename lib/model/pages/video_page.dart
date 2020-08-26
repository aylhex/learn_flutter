/**
 * Copyright (C), 2018-2020
 * FileName: video_page
 * Author: Ann
 * Date: 2020/8/26 22:00
 */
import 'package:flutter/material.dart';
import 'package:testflutter/model/Constant.dart';
import 'package:video_player/video_player.dart';

class VideoDisplayWidget extends StatefulWidget {
  _VideoDisplayWidgetState createState() => _VideoDisplayWidgetState();
}

class _VideoDisplayWidgetState extends State<VideoDisplayWidget> {
  VideoPlayerController _controller;
  String VIDEO_URL = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';
  Future _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(VIDEO_URL);
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("视频测试"),),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              print(snapshot.connectionState);
              if (snapshot.hasError) print(snapshot.error);
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  // aspectRatio: 16 / 9,
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(height: 30),
          RaisedButton(
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  // If the video is paused, play it.
                  _controller.play();
                }
              });
            },
          )
        ],
      ),
    );
  }



  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}