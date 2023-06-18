import 'package:buildpc/controller/model_controller.dart';
import 'package:buildpc/project/routes/app_route_constants.dart';
import 'package:buildpc/ui/widgets/button/custom_route_model_name_button.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/custom_top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class GeneralModelsPage extends StatefulWidget {
  const GeneralModelsPage({Key? key}) : super(key: key);

  @override
  State<GeneralModelsPage> createState() => _GeneralModelsPageState();
}

class _GeneralModelsPageState extends State<GeneralModelsPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final _modelController = context.read<ModelController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const CustomTopNavigationBar(),
      ),
      body: SafeArea(
        child: _MainView(modelController: _modelController),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  final ModelController modelController;

  const _MainView({Key? key, required this.modelController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRouteModelNameButton(
                      label: '${_locale?.performanceLevel}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'PerformanceLevel',
                      //modelName: 'GraphicCard',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.formFactor}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'FormFactor',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.cellsType}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'SsdCellsType',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRouteModelNameButton(
                      label: '${_locale?.producer}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'Producers',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.rating}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'Rating',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.like}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'Like',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRouteModelNameButton(
                      label: '${_locale?.caseDesignFeatures}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'CaseDesignFeatures',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.casePowerSupplyLocation}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'CasePowerSupplyLocation',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.caseSize}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'CaseSize',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRouteModelNameButton(
                      label: '${_locale?.coolerMaterial}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'CoolerMaterial',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.protectionFunctions}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'PowerSupplyProtectionFunctions',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.cpuGeneration}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'CpuGeneration',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRouteModelNameButton(
                      label: '${_locale?.cpuPcieVersion}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'CpuPcieVersion',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.cpuTechnologies}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'CpuTechnologies',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.gpuConnector}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'GpuConnector',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRouteModelNameButton(
                      label: '${_locale?.gpuInterfaceType}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'GpuInterfaceType',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.gpuMemoryType}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'GpuMemoryType',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.gpuTechnologies}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'GpuTechnologies',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRouteModelNameButton(
                      label: '${_locale?.motherboardChipset}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'MotherboardChipset',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.network}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'MotherboardNetwork',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.motherboardSocket}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'MotherboardSocket',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRouteModelNameButton(
                      label: '${_locale?.ramMemoryType}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'RamMemoryType',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.storageInterface}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'StorageInterface',
                    ),
                    CustomRouteModelNameButton(
                      label: '${_locale?.storageFormFactor}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'StorageFormFactor',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRouteModelNameButton(
                      label: '${_locale?.ramTimings}',
                      destination: AppRouteConstants.modelListPageRouteName,
                      modelName: 'RamTimings',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
