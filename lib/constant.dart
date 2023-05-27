import 'package:flutter/material.dart';

const kPrimaryColor = Colors.blueAccent;
const kTopNavigationBarHeight = 20.0;
const kTopNavigationBarBorderRadius = 25.0;
const authority = 'host';
const unEncodedPath = 'api/';

const List<String> graphicCard = [
  'id',
  'Producer',
  'Name',
  'Vendor',
  'Year',
  'Technical process',
  'GPU frequency',
  'Memory size',
  'Memory type',
  'Memory frequency',
  'Bus',
  'TDP',
  'Connector',
  'Interface type',
  'Length',
  'Description',
  'GPU technologies',
  'Recommended price',
  'Performance level',
];
const List<String> pcCase = [
  'id',
  'Name',
  'Producer',
  'Size',
  'Form factor',
  'Power supply location',
  'Fans included',
  'USB 3.2',
  'USB 3.0',
  'USB 2.0',
  'Design features',
  'Max length of graphic card',
  'Power supply form factor',
  'Description',
  'Recommended price',
  'Performance level'
];
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
