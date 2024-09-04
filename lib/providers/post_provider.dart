import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:knovator_task/services/apis.dart';
import 'package:knovator_task/utils/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];
  Post? selectedPost;
  final APIs _api = APIs();
  final ScrollController scrollController = ScrollController();
  late SharedPreferences _prefs;
  final BuildContext context;
  bool _isLoading = true;
  bool _isDescriptionsLoading = true;
  String? error;

  PostProvider(this.context) {
    init();

    scrollController.addListener(() {
      if (_posts.isNotEmpty) {
        checkVisibility();
      }
    });
  }

  List<Post> get posts => _posts;

  bool get isLoading => _isLoading;

  bool get isDescriptionsLoading => _isDescriptionsLoading;

  set isDescriptionsLoading(bool value) {
    _isDescriptionsLoading = value;
    refresh();
  }

  set isLoading(bool value) {
    _isLoading = value;
    refresh();
  }

  Future<void> fetchPosts() async {
    _api.fetchPosts().then((value) {
      if (value.error == null) {
        _posts = value.data!;
        _prefs.setStringList(PreferenceKey.post,
            _posts.map((e) => jsonEncode(e.toJson())).toList());
        isLoading = false;
        // to ensure that all the posts are rendered on the screen
        Future.delayed(const Duration(milliseconds: 100), () {
          checkVisibility();
        });
      } else {
        getPostLocally();
      }
    });
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    await fetchPosts();
  }

  getPostLocally() {
    List<String>? posts = _prefs.getStringList(PreferenceKey.post);
    if (posts != null) {
      _posts = posts.map((e) => Post.fromJson(jsonDecode(e))).toList();
    }
    isLoading = false;
  }

  void getPostDetail(int postId) {
    //isDescriptionsLoading = true;
    _api.fetchPostDetail(postId).then((value) {
      if (value.error == null) {
        selectedPost = value.data;
      } else {
        error = value.error;
      }
      isDescriptionsLoading = false;
    });
  }

  markAsVisited(int index) {
    _posts[index] = _posts[index].copyWith(isVisited: true);
    stopTimer(index);
    refresh();
  }

  void refresh() {
    if (context.mounted) {
      notifyListeners();
    }
  }

  checkVisibility() {
    for (int i = 0; i < _posts.length; i++) {
      final box =
          _posts[i].key.currentContext?.findRenderObject() as RenderBox?;

      if (box != null &&
          box.localToGlobal(Offset.zero).dy > 0 &&
          box.localToGlobal(Offset.zero).dy <
              MediaQuery.of(context).size.height) {
        stopTimer(i);
      } else {
        startTimer(i);
      }
    }
  }

  void stopTimer(int i) {
    if (posts[i].timer != null) {
      posts[i].timer!.cancel();
      posts[i] = posts[i].copyWith(timer: null);
      refresh();
    }
  }

  void startTimer(int i, {bool force = false}) {
    stopTimer(i);
    posts[i] = _posts[i].copyWith(
        timer: Timer.periodic(Duration(seconds: 1), (timer) {
      posts[i] = posts[i].copyWith(tick: posts[i].tick! + 1);
      refresh();
    }));

    refresh();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
