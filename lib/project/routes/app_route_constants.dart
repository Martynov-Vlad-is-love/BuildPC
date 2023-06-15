class AppRouteConstants {
  static const String mainRouteName = 'main';
  static const String loginRouteName = 'login';
  static const String registrationRouteName = 'registration';
  static const String editRouteName = 'edit';
  static const String componentsPageRouteName = 'components_page';
  static const String modelListPageRouteName = 'model_list_page';
  static const String adminRouteName = 'admin';
  static const String usersRouteName = 'users';
  static const String createModelPage = 'create';
  static const String generalModelPage = 'general_model_page';
  static const String mainModelListPageRouteName = 'main_model_list_page';

  static const String editProcessorRouteName = 'edit/processor';
  static const String createProcessorRouteName = 'create/processor';
  static const String editBuildPcRouteName = 'edit/build_pc';
  static const String createBuildPcRouteName = 'create/build_pc';
  static const String editGraphicCardRouteName = 'edit/graphic_card';
  static const String createGraphicCardRouteName = 'create/graphic_card';
  static const String editCaseRouteName = 'edit/case';
  static const String createCaseRouteName = 'create/case';
  static const String editCoolerRouteName = 'edit/cooler';
  static const String createCoolerRouteName = 'create/cooler';
  static const String editMotherboardRouteName = 'edit/motherboard';
  static const String createMotherboardRouteName = 'create/motherboard';
  static const String editPowerSupplyRouteName = 'edit/power_supply';
  static const String createPowerSupplyRouteName = 'create/power_supply';
  static const String editRamRouteName = 'edit/ram';
  static const String createRamRouteName = 'create/ram';
  static const String editHddRouteName = 'edit/hdd';
  static const String createHddRouteName = 'create/hdd';
  static const String editSsdRouteName = 'edit/ssd';
  static const String createSsdRouteName = 'create/ssd';
  static const String editUserRouteName = 'edit/user';


  static const Map<String, String> getEditRouteByName = {
    'Processor': editProcessorRouteName,
    'BuildPC': editBuildPcRouteName,
    'GraphicCard': editGraphicCardRouteName,
    'Case': editCaseRouteName,
    'Cooler': editCoolerRouteName,
    'Motherboard': editMotherboardRouteName,
    'PowerSupply': editPowerSupplyRouteName,
    'Ram': editRamRouteName,
    'Hdd': editHddRouteName,
    'Ssd': editSsdRouteName,
    'User': editUserRouteName
  };
  static const Map<String, String> getCreateRouteByName = {
    'Processor': createProcessorRouteName,
    'BuildPC': createBuildPcRouteName,
    'GraphicCard': createGraphicCardRouteName,
    'Case': createCaseRouteName,
    'Cooler': createCoolerRouteName,
    'Motherboard': createMotherboardRouteName,
    'PowerSupply': createPowerSupplyRouteName,
    'Ram': createRamRouteName,
    'Hdd': createHddRouteName,
    'Ssd': createSsdRouteName,
  };

}
