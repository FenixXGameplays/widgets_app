import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const routeName = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});
    moveScrollToBottom();
  }

  @override
  void dispose() {
    super.dispose();
    isMounted = false;
    scrollController.dispose();
  }

  void moveScrollToBottom(){
    if((scrollController.position.pixels +150) <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;

    final lastId = imagesIds.last;
    isLoading = true;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: _ListViewImages(
              scrollController: scrollController, imagesIds: imagesIds),
        ),
      ),
      floatingActionButton: _BackAndRefreshFAB(isLoading: isLoading),
    );
  }
}

class _ListViewImages extends StatelessWidget {
  const _ListViewImages({
    required this.scrollController,
    required this.imagesIds,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: imagesIds.length,
        itemBuilder: (BuildContext context, index) {
          return FadeInImage(
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/$index/500/300'),
          );
        });
  }
}

class _BackAndRefreshFAB extends StatelessWidget {
  const _BackAndRefreshFAB({
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (!isLoading) {
          context.pop();
        }
      },
      child: !isLoading
          ? const Icon(Icons.arrow_back_ios_new_rounded)
          : SpinPerfect(
              infinite: true,
              child: const Icon(Icons.refresh_rounded),
            ),
    );
  }
}
