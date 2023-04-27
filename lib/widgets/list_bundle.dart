import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trading_app/common/theme/colors.dart';
import 'package:trading_app/common/utils/extensions/text_style_extension.dart';

import '../common/constants/images.dart';
import '../models/pagination.dart';
import 'cached_image.dart';

typedef RefreshCallback = Future<void> Function(BuildContext context);

class ListBundle extends StatefulWidget {
  const ListBundle(
      {Key? key,
      required this.child,
      required this.status,
      required this.onRefresh,
      this.onLoadMore,
      this.errMsg,
      this.emptyMsg,
      this.padding})
      : super(key: key);

  final Widget child;
  final DataSourceStatus? status;
  final RefreshCallback onRefresh;
  final EdgeInsetsGeometry? padding;
  final RefreshCallback? onLoadMore;
  final String? errMsg;
  final String? emptyMsg;

  @override
  State<ListBundle> createState() => _ListBundleState();
}

class _ListBundleState extends State<ListBundle> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: _buildContent(context),
      onNotification: (ScrollNotification value) =>
          _onNotification(context, value),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (widget.status) {
      case DataSourceStatus.initial:
      case DataSourceStatus.loading:
        return _buildLoadingWidget();
      case DataSourceStatus.refreshing:
        return _buildRefreshingWidget(context);
      case DataSourceStatus.empty:
        return Center(
          child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CachedImage(
                  url: kEmptyImage,
                  width: 280,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 60),
                Text(
                  "Empty",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (widget.emptyMsg?.isNotEmpty ?? false)
                  const SizedBox(height: 12),
                if (widget.emptyMsg?.isNotEmpty ?? false)
                  Text(
                    widget.emptyMsg!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.w400,
                  ),
              ],
            ),
          ),
        );
      case DataSourceStatus.loadMore:
      case DataSourceStatus.success:
        return _buildSuccessWidget(context);
      case DataSourceStatus.failed:
      default:
        return _buildFailedWidget(context);
    }
  }

  Widget _buildFailedWidget(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => widget.onRefresh(context),
      child: Center(
        child: Text(widget.errMsg ?? ''),
      ),
    );
  }

  Widget _buildSuccessWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => widget.onRefresh(context),
            child: widget.child,
          ),
        ),
        Visibility(
          visible: widget.status == DataSourceStatus.loadMore &&
              widget.onLoadMore != null,
          child: _buildLoadingWidget(),
        )
      ],
    );
  }

  Column _buildRefreshingWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _buildLoadingWidget(),
        ),
        Expanded(child: widget.child),
      ],
    );
  }

  Center _buildLoadingWidget() => const Center(
          child: SpinKitWave(
        color: kPrimaryColor,
        size: 20.0,
      ));

  bool _onNotification(BuildContext context, ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollEndNotification &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      widget.onLoadMore?.call(context);
    }
    return true;
  }
}
