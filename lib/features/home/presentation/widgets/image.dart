import 'package:flutter/material.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';

class PulsingAvatar extends StatefulWidget {
  final double radius;
  const PulsingAvatar({super.key, required this.radius});

  @override
  State<PulsingAvatar> createState() => _PulsingAvatarState();
}

class _PulsingAvatarState extends State<PulsingAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // إعداد المتحكم ليعمل بشكل مستمر وعكسي
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // ربط الأنيميشن بالقيم التي حددتها (من 1.0 إلى 1.15)
    // ملاحظة: جعلتها 1.15 لأن 1.5 قد تكون ضخمة جداً، لكن يمكنك تغييرها
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose(); // مهم جداً لإغلاق المتحكم عند الخروج
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                // الشادو الأول: توهج خارجي ناعم (Glow)
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
                // الشادو الثاني: تحديد حاد للصورة (Depth) باستخدام AppColors
                BoxShadow(
                  color: AppColors.primary, // استبدلها بـ AppColors.primary
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: widget.radius,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: widget.radius - 2,
                backgroundImage: const AssetImage('assets/images/profile.webp'),
              ),
            ),
          ),
        );
      },
    );
  }
}
