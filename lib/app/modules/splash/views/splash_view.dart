import 'package:tali_khata_app/exports.dart';
import '../../../core/utils/assets_manager.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  Center(
        child: ImageManager.logo.image(
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
