import 'package:flutter/material.dart';

const kPrimaryColor = Colors.blueAccent;
const kTopNavigationBarHeight = 20.0;
const kTopNavigationBarBorderRadius = 25.0;
const authority = 'host';
const unEncodedPath = 'api/';

const List<String> graphicCard = [
  'id',
  'producer',
  'name',
  'vendor',
  'year',
  'technicalProcess',
  'gpuFrequency',
  'memoryAmount',
  'memoryType',
  'memoryFrequency',
  'bus',
  'tdp',
  'connector',
  'interfaceType',
  'length',
  'description',
  'gpuTechnologies',
  'recommendedPrice',
  'performanceLevel',
];
const List<String> pcCase = [];
const List<String> cooler = [];
const List<String> processor = [];
const List<String> motherboard = [];
const List<String> power = [];
const List<String> ram = [];
const List<String> storage = [];
const List<String> admin = [];
const List<String> buildPc = [];
const List<String> formFactor = [];
const List<String> like = [];
const List<String> performanceLevel = [];
const List<String> producers = [];
const List<String> rating = [];
const List<String> user = [];

const Map<String, List<String>> components = {
  'Case': pcCase,
  'Cooler': cooler,
  'Processor': processor,
  'GraphicCard': graphicCard,
  'Motherboard': motherboard,
  'Power': power,
  'RAM': ram,
  'Storage': storage,
};
