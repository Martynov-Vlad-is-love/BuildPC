import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const kPrimaryColor = Colors.blueAccent;
const kTopNavigationBarHeight = 20.0;
const kTopNavigationBarBorderRadius = 25.0;
const apiPath = '185.197.250.149:1234';

const List<String> admin = [];
const List<String> buildPc = [];
const List<String> formFactor = [];
const List<String> like = [];
const List<String> performanceLevel = [];
const List<String> producers = [];
const List<String> rating = [];
const List<String> user = [];

//ignore: prefer-match-file-name
class Component {

  List<String> getComponentsList(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);

    final List<String> components = [
      '${_locale?.graphicCard}',
      '${_locale?.pcCase}',
      '${_locale?.cooler}',
      '${_locale?.processor}',
      '${_locale?.motherboard}',
      '${_locale?.power}',
      '${_locale?.ram}',
      '${_locale?.hdd}',
      '${_locale?.ssd}',
    ];

    return components;
  }

  List<String> getUsers(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);

    final List<String> _users = [
      'id',
      '${_locale?.name}',
      '${_locale?.userName}',
      '${_locale?.email}',
      '${_locale?.role}'
  ];

    return _users;
  }
  Map<String, List<String>> getComponents(BuildContext context) {
    final AppLocalizations? _locale = AppLocalizations.of(context);

    final List<String> _graphicCard = [
      'id',
      '${_locale?.producer}',
      '${_locale?.name}',
      '${_locale?.vendor}',
      '${_locale?.year}',
      '${_locale?.technicalProcess}',
      '${_locale?.gpuFrequency}',
      '${_locale?.memorySize}',
      '${_locale?.gpuMemoryType}',
      '${_locale?.memoryFrequency}',
      '${_locale?.bus}',
      '${_locale?.tdp}',
      '${_locale?.gpuConnector}',
      '${_locale?.gpuInterfaceType}',
      '${_locale?.length}',
      '${_locale?.description}',
      '${_locale?.gpuTechnologies}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}',
    ];
    final List<String> _pcCase = [
      'id',
      '${_locale?.name}',
      '${_locale?.size}',
      '${_locale?.producer}',
      '${_locale?.formFactor}',
      '${_locale?.powerSupplyLocation}',
      '${_locale?.fansIncluded}',
      '${_locale?.usb_3_2}',
      '${_locale?.usb_3_0}',
      '${_locale?.usb_2_0}',
      '${_locale?.designFeatures}',
      '${_locale?.maxLengthOfGraphicCard}',
      '${_locale?.description}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}',
    ];
    final List<String> _cooler = [
      'id',
      '${_locale?.name}',
      '${_locale?.producer}',
      '${_locale?.supportedSockets}',
      '${_locale?.material}',
      '${_locale?.maxTDP}',
      '${_locale?.thermotubes}',
      '${_locale?.description}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}'
    ];
    final List<String> _processor = [
      'id',
      '${_locale?.name}',
      '${_locale?.producer}',
      '${_locale?.socket}',
      '${_locale?.year}',
      '${_locale?.countOfCores}',
      '${_locale?.countOfThreads}',
      '${_locale?.baseFrequency}',
      '${_locale?.turboBoostFrequency}',
      '${_locale?.l3Cache}',
      '${_locale?.generation}',
      '${_locale?.technicalProcess}',
      '${_locale?.tdp}',
      '${_locale?.maxTemperature}',
      '${_locale?.embeddedGraphics}',
      '${_locale?.pcieController}',
      '${_locale?.cpuTechnologies}',
      '${_locale?.description}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}'
    ];
    final List<String> _motherboard = [
      'id',
      '${_locale?.name}',
      '${_locale?.producer}',
      '${_locale?.socket}',
      '${_locale?.cpuGeneration}',
      '${_locale?.chipset}',
      '${_locale?.formFactor}',
      '${_locale?.maxTDP}',
      '${_locale?.memorySlots}',
      '${_locale?.supportedMemoryFrequency}',
      '${_locale?.maxAmountOfRam}',
      '${_locale?.network}',
      '${_locale?.bluetooth}',
      '${_locale?.wifi}',
      '${_locale?.pcieVersion}',
      '${_locale?.pciExpressX16}',
      '${_locale?.pciExpressX4}',
      '${_locale?.pciExpressX1}',
      '${_locale?.sata3}',
      'm.2',
      '${_locale?.dSub}',
      '${_locale?.dvi}',
      '${_locale?.hdmi}',
      '${_locale?.displayPort}',
      '${_locale?.usb_3_2}',
      '${_locale?.usb_3_0}',
      '${_locale?.usb_2_0}',
      '${_locale?.usbTypeC}',
      '${_locale?.digitalAudioJack}',
      '${_locale?.description}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}'];
    final List<String> _power = [
      'id', '${_locale?.name}', '${_locale?.producer}', '${_locale?.power}',
      '${_locale?.formFactor}', '${_locale?.pfcModule}',
      '${_locale?.modularConnection}', '${_locale?.protectionFunctions}',
      '${_locale?.cpu_4pin}', '${_locale?.cpu_4plus4pin}',
      '${_locale?.cpu_8pin}', '${_locale?.pcie_6plus2pin}',
      '${_locale?.pcie_8pin}', '${_locale?.pcie_5_16pin}',
      '${_locale?.sata}', '${_locale?.countOf_12VLines}',
      '${_locale?.description}', '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}'];
    final List<String> _ram = [
      'id', '${_locale?.name}','${_locale?.producer}',
      '${_locale?.memoryType}', '${_locale?.memoryCapacity}',
      '${_locale?.frequency}', '${_locale?.timings}',
      '${_locale?.powerSupplyVoltage}', '${_locale?.description}',
      '${_locale?.recommendedPrice}', '${_locale?.performanceLevel}',];
    final List<String> _hdd = ['id', '${_locale?.producer}', '${_locale?.name}',
      '${_locale?.storageSize}', '${_locale?.speed}', '${_locale?.formFactor}',
      '${_locale?.storageInterface}', '${_locale?.bufferSize}',
      '${_locale?.readingSpeed}', '${_locale?.writingSpeed}',
      '${_locale?.description}', '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}',];
    final List<String> _ssd = [
      'id', '${_locale?.producer}', '${_locale?.name}',
      '${_locale?.storageSize}', '${_locale?.speed}', '${_locale?.formFactor}',
      '${_locale?.storageInterface}', '${_locale?.bufferSize}',
      '${_locale?.readingSpeed}', '${_locale?.writingSpeed}',
      '${_locale?.cellsType}', '${_locale?.description}',
      '${_locale?.recommendedPrice}', '${_locale?.performanceLevel}',];
    final List<String> _performanceLevel = ['id',
      '${_locale?.performanceLevel}'];
    final List<String> _producer = ['id', '${_locale?.producer}'];
    final List<String> _formFactor = ['id', '${_locale?.formFactor}'];
    final List<String> _caseDesignFeatures = [
      'id', '${_locale?.caseDesignFeatures}'];
    final List<String> _casePowerSupplyLocation = [
      'id', '${_locale?.casePowerSupplyLocation}'];
    final List<String> _caseSize = ['id', '${_locale?.caseSize}'];
    final List<String> _coolerMaterial = ['id', '${_locale?.coolerMaterial}'];
    final List<String> _cpuGeneration = ['id', '${_locale?.cpuGeneration}'];
    final List<String> _cpuPcieVersion = ['id', '${_locale?.cpuPcieVersion}'];
    final List<String> _cpuTechnologies = ['id', '${_locale?.cpuTechnologies}'];
    final List<String> _gpuTechnologies = ['id', '${_locale?.gpuTechnologies}'];
    final List<String> _gpuConnector = ['id', '${_locale?.gpuConnector}'];
    final List<String> _gpuInterfaceType =['id','${_locale?.gpuInterfaceType}'];
    final List<String> _gpuMemoryType = ['id', '${_locale?.gpuMemoryType}'];
    final List<String> _buildPC = ['id', '${_locale?.nameOfBuild}',
      '${_locale?.user}', '${_locale?.motherboard}', '${_locale?.processor}',
      '${_locale?.graphicCard}', '${_locale?.ram}', '${_locale?.powerSupply}',
      '${_locale?.hdd}', '${_locale?.ssd}', '${_locale?.pcCase}',
      '${_locale?.cooler}','${_locale?.countOfLikes}', '${_locale?.ratingId}',
      '${_locale?.totalPrice}'];
    final List<String> _motherboardChipset = ['id', '${_locale?.chipset}'];
    final List<String> _motherboardNetwork = ['id', '${_locale?.network}'];
    final List<String> _motherboardSocket = ['id', '${_locale?.socket}'];
    final List<String> _powerSupplyPF =['id','${_locale?.protectionFunctions}'];
    final List<String> _ramMemoryType = ['id', '${_locale?.memoryType}'];
    final List<String> _ramTimings =['id','${_locale?.timings}'];
    final List<String> _ssdCellsType =['id','${_locale?.cellsType}'];
    final List<String> _storageInterface =['id','${_locale?.storageInterface}'];
    final List<String>_storageFormFactor=['id','${_locale?.storageFormFactor}'];

    final Map<String, List<String>> components = {
      'Case': _pcCase, 'Cooler': _cooler, 'Processor': _processor,
      'GraphicCard': _graphicCard, 'Motherboard': _motherboard,
      'PowerSupply': _power, 'Ram': _ram, 'Hdd': _hdd, 'Ssd': _ssd,
      'PerformanceLevel': _performanceLevel, 'Producers': _producer,
      'FormFactor': _formFactor, 'CaseDesignFeatures': _caseDesignFeatures,
      'CasePowerSupplyLocation': _casePowerSupplyLocation,'CaseSize': _caseSize,
      'CoolerMaterial': _coolerMaterial,
      'CpuGeneration': _cpuGeneration, 'CpuPcieVersion': _cpuPcieVersion,
      'CpuTechnologies': _cpuTechnologies, 'GpuConnector': _gpuConnector,
      'GpuInterfaceType': _gpuInterfaceType, 'GpuMemoryType': _gpuMemoryType,
      'GpuTechnologies': _gpuTechnologies, 'BuildPC': _buildPC,
      'MotherboardSocket': _motherboardSocket,
      'MotherboardNetwork': _motherboardNetwork,
      'MotherboardChipset': _motherboardChipset,
      'PowerSupplyProtectionFunctions': _powerSupplyPF,
      'RamMemoryType': _ramMemoryType, 'RamTimings': _ramTimings,
      'SsdCellsType': _ssdCellsType, 'StorageInterface': _storageInterface,
      'StorageFormFactor': _storageFormFactor
    };

    return components;
  }
}
