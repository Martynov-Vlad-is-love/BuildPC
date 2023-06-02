import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/model/cooler/cooler_socket.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/model/ram/ram_timings.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/button/custom_route_model_button.dart';
import 'package:buildpc/ui/widgets/button/custom_route_model_name_button.dart';
import 'package:buildpc/ui/widgets/button/route_model_list_button.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const CustomTopNavigationBar(),
      ),
      body: const SafeArea(
        child: _MainView(),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RamMemoryType ramMemoryType = RamMemoryType(1, 'as');
    final RamTimings ramTimings = RamTimings(1, '123123');
    final Producers oleg = Producers(1, 'Oleg');
    final CoolerSocket socket = CoolerSocket(1, 'fgdfg');
    final CoolerMaterial material = CoolerMaterial(1, 'do anal');
    final PerformanceLevel performanceLevel = PerformanceLevel(1, 'high');
    final Cooler model = Cooler(
      1,
      'Test case 1',
      oleg,
      socket,
      material,
      41,
      8383,
      4,
      'decsr',
      300,
      performanceLevel,
    );
    final Ram ram1 = Ram(
      2,
      'Kingston',
      oleg,
      ramMemoryType,
      16000,
      3200,
      ramTimings,
      500,
      'decsr',
      300,
      performanceLevel,
    );
    final Ram ram2 = Ram(
      2,
      'Kingston',
      oleg,
      ramMemoryType,
      16000,
      3200,
      ramTimings,
      500,
      'decsr',
      300,
      performanceLevel,
    );
    final Cooler model2 = Cooler(
      3,
      'Test case 3',
      oleg,
      socket,
      material,
      41,
      8383,
      4,
      'decsr',
      300,
      performanceLevel,
    );
    final Cooler model3 = Cooler(
      4,
      'Test case 4',
      oleg,
      socket,
      material,
      41,
      8383,
      4,
      'decsr',
      300,
      performanceLevel,
    );
    final List<Model> models = [model, model2, model3];

    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomRouteModelNameButton(
                  label: 'GraphicCard',
                  destination: AppRouteConstants.editRouteName,
                  modelName: 'GraphicCard',
                  //modelName: 'GraphicCard',
                ),
                const CustomRouteModelNameButton(
                  label: 'Case',
                  destination: AppRouteConstants.editRouteName,
                  modelName: 'Case',
                ),
                RouteModelListButton(
                  label: 'Cooler',
                  destination: AppRouteConstants.componentsListPageRouteName,
                  modelList: models,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRouteModelNameButton(
                  label: 'Processor',
                  destination: AppRouteConstants.editRouteName,
                  modelName: 'Processor',
                ),
                CustomRouteModelNameButton(
                  label: 'Motherboard',
                  destination: AppRouteConstants.editRouteName,
                  modelName: 'Motherboard',
                ),
                CustomRouteModelNameButton(
                  label: 'PowerSupply',
                  destination: AppRouteConstants.editRouteName,
                  modelName: 'Power Supply',
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRouteModelNameButton(
                  label: 'RAM',
                  destination: AppRouteConstants.editRouteName,
                  modelName: 'RAM',
                ),
                CustomRouteModelNameButton(
                  label: 'HDD',
                  destination: AppRouteConstants.editRouteName,
                  modelName: 'HDD',
                ),
                CustomRouteModelNameButton(
                  label: 'SSD',
                  destination: AppRouteConstants.editRouteName,
                  modelName: 'SSD',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
