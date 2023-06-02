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
      '${_locale?.memoryType}',
      '${_locale?.memoryFrequency}',
      '${_locale?.bus}',
      '${_locale?.tdp}',
      '${_locale?.connector}',
      '${_locale?.interfaceType}',
      '${_locale?.length}',
      '${_locale?.description}',
      '${_locale?.gpuTechnologies}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}',
    ];
    final List<String> _pcCase = [
      'id',
      '${_locale?.name}',
      '${_locale?.producer}',
      '${_locale?.size}',
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
      '${_locale?.socket}',
      '${_locale?.material}',
      '${_locale?.maxTDP}',
      '${_locale?.supportedSockets}',
      '${_locale?.thermotubes}',
      '${_locale?.description}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}'
    ];
    final List<String> _processor = [
      'id',
      '${_locale?.name}',
      '${_locale?.producer}',
      '${_locale?.year}',
      '${_locale?.socket}',
      '${_locale?.countOfCores}',
      '${_locale?.countOfThreads}',
      '${_locale?.baseFrequency}',
      '${_locale?.turboBoostFrequency}',
      '${_locale?.l3Cache}',
      '${_locale?.generation}',
      '${_locale?.technicalProcess}',
      '${_locale?.tdp}',
      '${_locale?.maxTemperature}',
      '${_locale?.pcieController}',
      '${_locale?.description}',
      '${_locale?.embeddedGraphics}'
    ];
    final List<String> _motherboard = [
      'id',
      '${_locale?.name}',
      '${_locale?.producer}',
      '${_locale?.socket}',
      '${_locale?.cpuGeneration}',
      '${_locale?.chipset}',
      '${_locale?.countOfThreads}',
      '${_locale?.baseFrequency}',
      '${_locale?.turboBoostFrequency}',
      '${_locale?.l3Cache}',
      '${_locale?.generation}',
      '${_locale?.technicalProcess}',
      '${_locale?.tdp}',
      '${_locale?.maxTemperature}',
      '${_locale?.pcieController}',
      '${_locale?.description}',
      '${_locale?.embeddedGraphics}'
    ];
    final List<String> _power = [
      'id',
      '${_locale?.name}',
      '${_locale?.producer}',
      '${_locale?.power}',
      '${_locale?.formFactor}',
      '${_locale?.performanceLevel}',
      '${_locale?.protectionFunctions}',
      '${_locale?.cpu_4pin}',
      '${_locale?.cpu_4plus4pin}',
      '${_locale?.pcie_6plus2pin}',
      '${_locale?.pcie_8pin}',
      '${_locale?.pcie_5_16pin}',
      '${_locale?.sata}',
      '${_locale?.countOf_12VLines}',
      '${_locale?.description}',
      '${_locale?.recommendedPrice}',
      '${_locale?.pfcModule}',
      '${_locale?.modularConnection}',
    ];
    final List<String> _ram = [
      'id',
      '${_locale?.name}',
      '${_locale?.producer}',
      '${_locale?.memoryType}',
      '${_locale?.memoryCapacity}',
      '${_locale?.frequency}',
      '${_locale?.timings}',
      '${_locale?.powerSupplyVoltage}',
      '${_locale?.description}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}',
    ];
    final List<String> _hdd = [
      'id',
      '${_locale?.producer}',
      '${_locale?.storageSize}',
      '${_locale?.speed}',
      '${_locale?.formFactor}',
      '${_locale?.storageInterface}',
      '${_locale?.bufferSize}',
      '${_locale?.writingSpeed}',
      '${_locale?.readingSpeed}',
      '${_locale?.description}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}',
    ];
    final List<String> _ssd = [
      'id',
      '${_locale?.producer}',
      '${_locale?.storageSize}',
      '${_locale?.speed}',
      '${_locale?.formFactor}',
      '${_locale?.storageInterface}',
      '${_locale?.bufferSize}',
      '${_locale?.writingSpeed}',
      '${_locale?.readingSpeed}',
      '${_locale?.cellsType}',
      '${_locale?.description}',
      '${_locale?.recommendedPrice}',
      '${_locale?.performanceLevel}',
    ];

    final Map<String, List<String>> components = {
      'Case': _pcCase,
      'Cooler': _cooler,
      'Processor': _processor,
      'GraphicCard': _graphicCard,
      'Motherboard': _motherboard,
      'Power Supply': _power,
      'RAM': _ram,
      'HDD': _hdd,
      'SSD': _ssd
    };

    return components;
  }
}
