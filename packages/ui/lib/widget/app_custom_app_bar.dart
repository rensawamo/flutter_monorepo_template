import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.hasBackButton = true,
    this.leftWidget,
    this.titleLogo,
    this.rightWidget,
  });

  final bool hasBackButton;
  final String title;
  final dynamic titleLogo;
  final Widget? leftWidget;
  final List<Widget>? rightWidget;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      titleSpacing: 0,
      title: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 56,
            padding: titleLogo != null
                ? const EdgeInsets.all(4)
                : const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                if (leftWidget != null)
                  leftWidget!
                else if (hasBackButton)
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                Center(
                  child: _titleContents(context),
                ),
                if (rightWidget != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: rightWidget!,
                  ),
              ],
            ),
          ),
          const Divider(
            height: 0,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }

  Widget _titleContents(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
