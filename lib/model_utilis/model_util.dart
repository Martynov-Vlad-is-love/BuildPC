import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/model/case/case_design_features.dart';
import 'package:buildpc/model/case/case_power_supply_location.dart';
import 'package:buildpc/model/case/case_size.dart';
import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/model/cooler/cooler_socket.dart';
import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/model/cpu/processor.dart';
import 'package:buildpc/model/general/build_pc.dart';
import 'package:buildpc/model/general/e_role.dart';
import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/like.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/general/rating.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/model/gpu/gpu_interface_type.dart';
import 'package:buildpc/model/gpu/gpu_memory_type.dart';
import 'package:buildpc/model/gpu/gpu_technologies.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:buildpc/model/motherboard/motherboard.dart';
import 'package:buildpc/model/motherboard/motherboard_chipset.dart';
import 'package:buildpc/model/motherboard/motherboard_network.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:buildpc/model/power/power_supply.dart';
import 'package:buildpc/model/power/power_supply_protection_functions.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/model/ram/ram_timings.dart';
import 'package:buildpc/model/storage/hdd.dart';
import 'package:buildpc/model/storage/ssd.dart';
import 'package:buildpc/model/storage/ssd_cells_type.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/model/storage/storage_interface.dart';

class ModelUtil {
  static final Map<String, Function> modelMapping = {
    'User': (List<dynamic> values) => User(
          int.tryParse(values.first as String),
          name: values[1] as String,
          username: values[2] as String,
          email: values[3] as String,
          password: values[4] as String?,
          role: values[5] as ERole,
        ),
    'BuildPC': (List<dynamic> values) => BuildPC(
          id: int.tryParse(values.first as String),
          nameOfBuild: values[1] as String,
          user: values[2] as User,
          motherboard: values[3] as Motherboard,
          processor: values[4] as Processor,
          graphicCard: values[5] as GraphicCard,
          ram: values[6] as List<Ram>,
          powerSupply: values[7] as PowerSupply,
          hdd: values[8] as List<Hdd>,
          ssd: values[9] as List<Ssd>,
          pcCase: values[10] as Case,
          cooler: values[11] as Cooler,
          countOfLikes: values[12] as int,
          ratingId: values[13] as Rating,
        ),
    'Cooler': (List<dynamic> values) => Cooler(
          id: int.tryParse(values.first as String),
          name: values[1] as String,
          producer: values[2] as Producers,
          socket: values[3] as List<CoolerSocket>,
          material: values[4] as CoolerMaterial,
          maxTdp: values[5] as int,
          supportedSockets: values[6] as int,
          thermalTubes: values[7] as int,
          description: values[8] as String,
          recommendedPrice: values[9] as int,
          performanceLevel: values[10] as PerformanceLevel,
        ),
    'Case': (List<dynamic> values) => Case(
          id: int.tryParse(values.first as String),
          name: values[1] as String,
          size: values[2] as CaseSize,
          producer: values[3] as Producers,
          formFactor: values[4] as List<FormFactor>,
          powerSupplyLocation: values[5] as CasePowerSupplyLocation,
          fansIncluded: values[6] as bool,
          usb_3_2: values[7] as int,
          usb_3_0: values[8] as int,
          usb_2_0: values[9] as int,
          designFeatures: values[10] as List<CaseDesignFeatures>,
          maxLengthOfGraphicCard: values[11] as int,
          description: values[12] as String,
          recommendedPrice: values[13] as int,
          performanceLevel: values[14] as PerformanceLevel,
        ),
    'PerformanceLevel': (List<dynamic> values) => PerformanceLevel(
          int.tryParse(values.first as String),
          level: values[1] as String,
        ),
    'GraphicCard': (List<dynamic> values) => GraphicCard(
          id: int.tryParse(values.first as String),
          producer: values[1] as Producers,
          name: values[2] as String,
          vendor: values[3] as Producers,
          year: values[4] as int,
          technicalProcess: values[5] as int,
          gpuFrequency: values[6] as int,
          memoryAmount: values[7] as int,
          memoryType: values[8] as GPUMemoryType,
          memoryFrequency: values[9] as int,
          bus: values[10] as int,
          tdp: values[11] as int,
          connector: values[12] as List<GPUConnector>,
          interfaceType: values[13] as GPUInterfaceType,
          length: values[14] as int,
          description: values[15] as String,
          gpuTechnologies: values[16] as GPUTechnologies,
          recommendedPrice: values[17] as int,
          performanceLevel: values[18] as PerformanceLevel,
        ),
    'Motherboard': (List<dynamic> values) => Motherboard(
          id: int.tryParse(values.first as String),
          name: values[1] as String,
          motherboardProducer: values[2] as Producers,
          socket: values[3] as MotherboardSocket,
          cpuGenerations: values[4] as List<CPUGeneration>,
          chipset: values[5] as MotherboardChipset,
          formFactor: values[6] as FormFactor,
          maxTdpOfProcessors: values[7] as int,
          memorySlots: values[8] as int,
          supportedMemoryFrequency: values[9] as int,
          maxAmountOfRam: values[10] as int,
          network: values[11] as MotherboardNetwork,
          bluetooth: values[12] as bool,
          wifi: values[13] as bool,
          pcieVersion: values[14] as CPUPCIeVersion,
          pciExpressX16: values[15] as int,
          pciExpressX4: values[16] as int,
          pciExpressX1: values[17] as int,
          sata3: values[18] as int,
          m2: values[19] as int,
          dSub: values[20] as int,
          dvi: values[21] as int,
          hdmi: values[22] as int,
          displayPort: values[23] as int,
          usb_3_0: values[24] as int,
          usb_2_0: values[25] as int,
          usbTypeC: values[26] as int,
          digitalAudioJack: values[27] as bool,
          description: values[28] as String,
          recommendedPrice: values[29] as int,
          performanceLevel: values[30] as PerformanceLevel,
        ),
    'Hdd': (List<dynamic> values) => Hdd(
          id: int.tryParse(values.first as String),
          producer: values[1] as Producers,
          storageSize: values[2] as int,
          speed: values[3] as int,
          formFactor: values[4] as StorageFormFactor,
          storageInterface: values[5] as StorageInterface,
          bufferSize: values[6] as int,
          readingSpeed: values[7] as int,
          writingSpeed: values[8] as int,
          description: values[9] as String,
          recommendedPrice: values[10] as int,
          performanceLevel: values[11] as PerformanceLevel,
        ),
    'Ssd': (List<dynamic> values) => Ssd(
          id: int.tryParse(values.first as String),
          producer: values[1] as Producers,
          storageSize: values[2] as int,
          formFactor: values[3] as StorageFormFactor,
          storageInterface: values[4] as StorageInterface,
          bufferSize: values[5] as int,
          readingSpeed: values[6] as int,
          writingSpeed: values[7] as int,
          cellsType: values[8] as SsdCellsType,
          description: values[9] as String,
          recommendedPrice: values[10] as int,
          performanceLevel: values[11] as PerformanceLevel,
        ),
    'Ram': (List<dynamic> values) => Ram(
          id: int.tryParse(values.first as String),
          name: values[1] as String,
          producer: values[2] as Producers,
          memoryType: values[3] as RamMemoryType,
          memoryCapacity: values[4] as int,
          frequency: values[5] as int,
          timings: values[6] as RamTimings,
          powerSupplyVoltage: values[7] as double,
          description: values[8] as String,
          recommendedPrice: values[9] as int,
          performanceLevel: values[10] as PerformanceLevel,
        ),
    'Processor': (List<dynamic> values) => Processor(
          id: int.tryParse(values.first as String),
          name: values[1] as String,
          producer: values[2] as Producers,
          socket: values[3] as MotherboardSocket,
          yearOfRelease: values[4] as int,
          countOfCores: values[5] as int,
          countOfThreads: values[6] as int,
          baseFrequency: values[7] as double,
          turboFrequency: values[8] as double,
          l3Cache: values[9] as int,
          cpuGeneration: values[10] as CPUGeneration,
          technicalProcess: values[11] as int,
          tdp: values[12] as int,
          maxTemperature: values[13] as int,
          embeddedGraphic: values[14] as bool,
          pcieVersion: values[15] as CPUPCIeVersion,
          cpuTechnologies: values[16] as List<CPUTechnologies>,
          description: values[17] as String,
          recommendedPrice: values[18] as int,
          performanceLevel: values[19] as PerformanceLevel,
        ),
    'PowerSupply': (List<dynamic> values) => PowerSupply(
          id: int.tryParse(values.first as String),
          name: values[1] as String,
          producer: values[2] as Producers,
          power: values[3] as int,
          formFactor: values[4] as FormFactor,
          protectionFunctions:
              values[5] as List<PowerSupplyProtectionFunctions>,
          cpu_4pin: values[6] as int,
          cpu_4plus4pin: values[7] as int,
          cpu_8pin: values[8] as int,
          pcie_6plus2pin: values[9] as int,
          pcie_8pin: values[10] as int,
          pcie_5_16pin: values[11] as int,
          sata: values[12] as int,
          countOf_12VLines: values[13] as int,
          description: values[14] as String,
          recommendedPrice: values[15] as int,
          performanceLevel: values[16] as PerformanceLevel,
          pfcModule: values[17] as bool,
          modularConnection: values[18] as bool,
        ),
    'CaseDesignFeatures': (List<dynamic> values) => CaseDesignFeatures(
          int.tryParse(values.first as String),
          designFeatures: values[1] as String,
        ),
    'CasePowerSupplyLocation': (List<dynamic> values) =>
        CasePowerSupplyLocation(
          int.tryParse(values.first as String),
          powerSupplyLocation: values[1] as String,
        ),
    'CaseSize': (List<dynamic> values) => CaseSize(
          int.tryParse(values.first as String),
          size: values[1] as String,
        ),
    'CoolerMaterial': (List<dynamic> values) => CoolerMaterial(
          int.tryParse(values.first as String),
          material: values[1] as String,
        ),
    'CoolerSocket': (List<dynamic> values) => CoolerSocket(
          int.tryParse(values.first as String),
          socket: values[1] as String,
        ),
    'CpuGeneration': (List<dynamic> values) => CPUGeneration(
          int.tryParse(values.first as String),
          name: values[1] as String,
        ),
    'CpuPCIeVersion': (List<dynamic> values) => CPUPCIeVersion(
          int.tryParse(values.first as String),
          name: values[1] as String,
        ),
    'CpuTechnologies': (List<dynamic> values) => CPUTechnologies(
          int.tryParse(values.first as String),
          name: values[1] as String,
        ),
    'GpuConnector': (List<dynamic> values) => GPUConnector(
          int.tryParse(values.first as String),
          connector: values[1] as String,
        ),
    'GpuInterfaceType': (List<dynamic> values) => GPUInterfaceType(
          int.tryParse(values.first as String),
          interfaceType: values[1] as String,
        ),
    'GpuMemoryType': (List<dynamic> values) => GPUMemoryType(
          int.tryParse(values.first as String),
          type: values[1] as String,
        ),
    'GpuTechnologies': (List<dynamic> values) => GPUTechnologies(
          int.tryParse(values.first as String),
          name: values[1] as String,
        ),
    'MotherboardChipset': (List<dynamic> values) => MotherboardChipset(
          int.tryParse(values.first as String),
          chipset: values[1] as String,
        ),
    'MotherboardNetwork': (List<dynamic> values) => MotherboardNetwork(
          int.tryParse(values.first as String),
          network: values[1] as String,
        ),
    'MotherboardSocket': (List<dynamic> values) => MotherboardSocket(
          int.tryParse(values.first as String),
          socket: values[1] as String,
        ),
    'PowerSupplyProtectionFunctions': (List<dynamic> values) =>
        PowerSupplyProtectionFunctions(
          int.tryParse(values.first as String),
          name: values[1] as String,
        ),
    'RamMemoryType': (List<dynamic> values) => RamMemoryType(
          int.tryParse(values.first as String),
          memoryType: values[1] as String,
        ),
    'RamTimings': (List<dynamic> values) => RamTimings(
          int.tryParse(values.first as String),
          timings: values[1] as String,
        ),
    'SsdCellsType': (List<dynamic> values) => SsdCellsType(
          int.tryParse(values.first as String),
          name: values[1] as String,
        ),
    'StorageFormFactor': (List<dynamic> values) => StorageFormFactor(
          int.tryParse(values.first as String),
          name: values[1] as String,
        ),
    'StorageInterface': (List<dynamic> values) => StorageInterface(
          int.tryParse(values.first as String),
          name: values[1] as String,
        ),
    'Like': (List<dynamic> values) => Like(
          id: int.tryParse(values.first as String),
          buildPc: values[1] as BuildPC,
          user: values[2] as User,
        ),
    'FormFactor': (List<dynamic> values) => FormFactor(
          name: values[1] as String,
        ),
    'Producers': (List<dynamic> values) => Producers(
          int.tryParse(values.first as String),
          name: values[1] as String,
        ),
  };
// String model = 'Ssd';
// List<dynamic> result = [1, Producers.producer1, 1000,
// StorageFormFactor.formFactor1, StorageInterface.interface1, 64, 200, 150,
// SsdCellsType.cellsType1, 'Description', 100, PerformanceLevel(1, 'Level')];
//
// if (modelMapping.containsKey(model)) {
// Function constructor = modelMapping[model];
// Model instance = constructor(result);
// // Используйте экземпляр класса, например:
// print(instance.description);
// }
}
