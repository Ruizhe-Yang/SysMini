package SimpleVehicleModel {
	public import Definitions::*;
	public import ISQ::*;
	package Definitions {
		public import PartDefinitions::*;
		public import PortDefinitions::*;
		public import ItemDefinitions::*;
		public import SignalDefinitions::*;
		public import InterfaceDefinitions::*;
		public import AllocationDefinitions::*;
		public import ActionDefinitions::*;
		public import StateDefinitions::*;
		public import RequirementDefinitions::*;
		public import AttributeDefinitions::*;
		public import IndividualDefinitions::*;
		public import MetadataDefinitions::**;
		public import KeyWord_MetadataDefinitions::*;
		package PartDefinitions {
			part def Vehicle {
				attribute mass :> mass;
				attribute dryMass :> mass;
				attribute cargoMass :> mass;
				attribute position :> length;
				attribute velocity :> speed;
				attribute acceleration :> acceleration;
				attribute electricalPower :> power;
				attribute Tmax :> thermodynamicTemperature;
				attribute maintenanceTime : Time::DateTime;
				attribute brakePedalDepressed : ScalarValues::Boolean;
				port ignitionCmdPort : IgnitionCmdPort;
				port pwrCmdPort : PwrCmdPort;
				port vehicleToRoadPort : VehicleToRoadPort;
				port statusPort : StatusPort;
				perform action providePower :> Parts::performedActions;
				perform action provideBraking :> Parts::performedActions;
				perform action controlDirection :> Parts::performedActions;
				perform action performSelfTest :> Parts::performedActions;
				perform action applyParkingBrake :> Parts::performedActions;
				perform action senseTemperature :> Parts::performedActions;
				exhibit state vehicleStates parallel;
			}
			part def Engine {
				attribute mass :> mass;
				attribute peakHorsePower :> power;
				attribute fuelEfficiency : ScalarValues::Real;
				attribute cost : ScalarValues::Real;
				attribute displacement :> volume;
				port engineControlPort = ~ControlPort;
				port fuelInPort = ~FuelPort;
				port fuelCmdPort : FuelCmdPort;
				port drivePwrPort : DrivePwrPort;
				port ignitionCmdPort : IgnitionCmdPort;
				port flyWheelPort;
				perform action generateTorque :> Parts::performedActions;
				exhibit state engineStates;
			}
			part def StarterMotor {
				port gearPort : GearPort;
			}
			part def Cylinder;
			part def Transmission {
				attribute gearRatio : ScalarValues::Real;
				port clutchPort = ~DrivePwrPort;
				exhibit state transmissionStates :> Parts::exhibitedStates;
			}
			part def Driveshaft;
			part def AxleAssembly;
			part def Axle {
				attribute mass :> mass;
			}
			part def FrontAxle {
				attribute steeringAngle :> angularMeasure;
			}
			part def HalfAxle {
				port shankCompositePort : ShankCompositePort;
			}
			part def Differential;
			part def Wheel {
				attribute diameter : LengthValue;
				port lugNutCompositePort : LugNutCompositePort;
			}
			part def Hub {
				port shankCompositePort : ShankCompositePort;
			}
			abstract part def Software;
			part def VehicleSoftware;
			part def VehicleController {
				port controlPort : ControlPort;
				exhibit state controllerStates parallel;
			}
			part def CruiseController {
				port setSpeedPort = ~SetSpeedPort;
				port speedSensorPort = ~SpeedSensorPort;
				port cruiseControlPort : CruiseControlPort;
				exhibit state cruiseControllerStates :> Parts::exhibitedStates;
			}
			part def SpeedSensor {
				port speedSensorPort : SpeedSensorPort;
			}
			part def FuelTank {
				attribute mass :> mass;
				item fuel : Fuel {
					attribute :>> fuelMass;
				}
				attribute fuelKind : FuelKind;
				attribute fuelMassMax :> mass;
				assert constraint fuelConstraint;
				port fuelOutPort : FuelPort;
				port fuelInPort = ~FuelPort;
			}
			part def BodyAssy;
			part def Body {
				attribute color : Colors;
			}
			part def Thermostat;
			part def WaterHose;
			part def Road {
				attribute incline : ScalarValues::Real;
				attribute friction : ScalarValues::Real;
			}
			part def Engine4Cyl;
			part def Engine6Cyl;
			part def TransmissionChoices;
			part def TransmissionAutomatic;
			part def TransmissionManual;
			part def Sunroof;
			part def ElectricalGenerator;
			part def TorqueGenerator;
			part def SteeringSubsystem;
			part def BrakingSubsystem;
		}
		package PortDefinitions {
			port def IgnitionCmdPort {
				item ignitionCmd : IgnitionCmd;
			}
			port def StatusPort;
			port def GearPort;
			port def PwrCmdPort {
				item pwrCmd : PwrCmd;
			}
			port def FuelCmdPort {
				item fuelCmd : FuelCmd;
			}
			port def FuelPort {
				out item fuel : Fuel;
			}
			port def DrivePwrPort {
				torque : TorqueValue;
			}
			port def ShaftPort_a;
			port def ShaftPort_b;
			port def ShaftPort_c;
			port def ShaftPort_d;
			port def DiffPort;
			port def AxlePort;
			port def AxleToWheelPort;
			port def WheelToAxlePort;
			port def WheelToRoadPort;
			port def LugNutCompositePort {
				port lugNutPort [*] : LugNutPort;
			}
			port def ShankCompositePort {
				port shankPort [*] : ShankPort;
			}
			port def LugNutPort {
				attribute threadDia;
				attribute threadPitch;
			}
			port def ShankPort {
				attribute threadDia;
				attribute threadPitch;
				attribute shaftLength;
			}
			port def VehicleToRoadPort;
			port def ControlPort;
			port def CruiseControlPort;
			port def SpeedSensorPort;
			port def SetSpeedPort;
			port def DriverCmdPort {
				out item driverCmd [*];
			}
			port def HandPort {
				out item ignitionCmd : IgnitionCmd;
				out item pwrCmd : PwrCmd;
			}
		}
		package ItemDefinitions {
			item def PwrCmd {
				attribute throttleLevel : ScalarValues::Real;
			}
			item def FuelCmd;
			item def Fuel {
				attribute fuelMass :> mass;
			}
			item def SensedSpeed {
				attribute speed :> speed;
			}
		}
		package SignalDefinitions {
			item def Cmd;
			item def DriverCmd;
			item def IgnitionCmd {
				attribute ignitionOnOff : IgnitionOnOff;
			}
			item def EngineStatus;
			attribute def VehicleStartSignal;
			attribute def VehicleOnSignal;
			attribute def VehicleOffSignal;
			attribute def StartSignal;
			attribute def OffSignal;
			attribute def OverTemp;
			attribute def ReturnToNormal;
			attribute def SetSpeed;
		}
		package InterfaceDefinitions {
			interface def EngineToTransmissionInterface {
				end port p1 : DrivePwrPort;
				end port p2 = ~DrivePwrPort;
				flow p1.torque to p2.torque;
			}
			interface def FuelInterface {
				end port fuelOutPort : FuelPort;
				end port fuelInPort = ~FuelPort;
				flow of Fuelfrom fuelOutPort.fuel to fuelInPort.fuel;
			}
			interface def WheelFastenerInterface {
				end port lugNutPort : LugNutPort;
				end port shankPort : ShankPort;
				attribute maxTorque : TorqueValue;
				;
			}
			interface def WheelHubInterface {
				end port lugNutCompositePort : LugNutCompositePort;
				end port shankCompositePort : ShankCompositePort;
				interface  wheelFastenerInterface [5] : WheelFastenerInterface connect  lugNutCompositePort.lugNutPort to shankCompositePort.shankPort;
			}
		}
		package AllocationDefinitions {
			allocation def LogicalToPhysical {
				end [prefixMetadata] logicalEnd;
				end [prefixMetadata] physicalEnd;
			}
		}
		package ActionDefinitions {
			action def ProvidePower {
				item pwrCmd : PwrCmd;
				wheelToRoadTorque [2] : TorqueValue;
			}
			action def GenerateTorque {
				item fuelCmd : FuelCmd;
				engineTorque : TorqueValue;
			}
			action def AmplifyTorque {
				engineTorque : TorqueValue;
				transmissionTorque : TorqueValue;
			}
			action def TransferTorque {
				transmissionTorque : TorqueValue;
				driveshaftTorque : TorqueValue;
			}
			action def DistributeTorque {
				driveshaftTorque : TorqueValue;
				wheelToRoadTorque [2] : TorqueValue;
			}
			action def PerformSelfTest;
			action def ApplyParkingBrake;
			action def SenseTemperature {
				temp : ThermodynamicTemperatureValue;
			}
		}
		package StateDefinitions {
			state def VehicleStates;
			state def ControllerStates;
			state def CruiseControllerStates;
		}
		package RequirementDefinitions {
			requirement def MassRequirement {
				subject :>> Requirements::subj;
				doc \* The actual mass shall be less than the required mass*\
				attribute massRequired :> mass;
				attribute massActual :> mass;
				requirement;
			}
			requirement def ReliabilityRequirement {
				subject :>> Requirements::subj;
				doc \* The actual reliability shall be greater than the required reliability*\
				attribute reliabilityRequired : ScalarValues::Real;
				attribute reliabilityActual : ScalarValues::Real;
				requirement;
			}
			requirement def TorqueGenerationRequirement {
				doc \* The engine shall generate torque as a function of RPM as shown in Table 1. *\
				subject generateTorque : GenerateTorque;
			}
			requirement def DrivePowerOutputRequirement {
				subject :>> Requirements::subj;
				doc \* The engine shall provide a connection point to transfer torque to the transmission.*\
			}
			requirement def FuelEconomyRequirement {
				subject :>> Requirements::subj;
				doc \* The vehicle shall maintain an average fuel economomy of at least x miles per gallon for the nominal 
driving scenario *\
				attribute actualFuelEconomy :> distancePerVolume;
				attribute requiredFuelEconomy :> distancePerVolume;
				requirement;
			}
		}
		package AttributeDefinitions {
			public import ScalarValues::*;
			public import Quantities::*;
			public import MeasurementReferences::null::*;
			public import SIPrefixes::null::*;
			public import NumericalFunctions::*;
			public import SI::*;
			public import USCustomaryUnits::*;
			public alias Torque for ISQMechanics::TorqueValue;
			enum def {
				enum black :> Base::dataValues;
				enum grey :> Base::dataValues;
				enum red :> Base::dataValues;
			}
			enum def {
				enum = 60 [SI::millimetre];
				enum = 80 [SI::millimetre];
				enum = 100 [SI::millimetre];
			}
			attribute cylinderDiameter : DiameterChoices = 80 [SI::millimetre];
			enum def {
				enum on :> Base::dataValues;
				enum off :> Base::dataValues;
			}
			enum def {
				enum gas :> Base::dataValues;
				enum diesel :> Base::dataValues;
			}
			distancePerVolume :> scalarQuantities = ISQSpaceTime::distance/ISQSpaceTime::volume;
			timePerDistance :> scalarQuantities = ISQBase::duration/ISQSpaceTime::distance;
			volumePerDistance :> scalarQuantities = ISQSpaceTime::volume/ISQSpaceTime::distance;
			volumePerTime :> scalarQuantities = ISQSpaceTime::volume/ISQBase::duration;
			kpl : MeasurementReferences::DerivedUnit = SI::kilometre/SI::litre;
			rpm : MeasurementReferences::DerivedUnit = 1/SI::minute;
			kW : MeasurementReferences::DerivedUnit = SIPrefixes::kilo*SI::watt;
		}
		package IndividualDefinitions {
			individual occurrence def VehicleRoadContext_1;
			individual occurrence def Vehicle_1;
			individual occurrence def FrontAxleAssembly_1;
			individual occurrence def FrontAxle_1;
			individual occurrence def Wheel_1;
			individual occurrence def Wheel_2;
			individual occurrence def RearAxleAssembly_1;
			individual occurrence def Road_1;
		}
		package MetadataDefinitions {
			public import AnalysisTooling::*;
			metadata def Safety {
				attribute isMandatory : ScalarValues::Boolean;
			}
			metadata def Security;
		}
		package KeyWord_MetadataDefinitions {
			public import Metaobjects::null::*;
			state failureModes [*];
			metadata def <fm> failureMode {
				:>> Metaobjects::baseType = failureModes meta SysML::StateUsage;
			}
			occurrence logicalOccurrences [*];
			metadata def <l> logical {
				:>> Metaobjects::baseType = logicalOccurrences meta SysML::Usage;
			}
			occurrence physicalOccurrences [*];
			metadata def <p> physical {
				:>> Metaobjects::baseType = physicalOccurrences meta SysML::Usage;
			}
		}
		package GenericContext {
			part def Context {
				attribute time : DurationValue;
				attribute spatialCF [1] : CartesianSpatial3dCoordinateFrame {
					:>> null = [SequenceExpression];
				}
				attribute velocityCF [1] : CartesianVelocity3dCoordinateFrame = spatialCF/SI::second;
				attribute accelarationCF [1] : CartesianAcceleration3dCoordinateFrame = velocityCF/SI::second;
			}
		}
	}
	package VehicleLogicalConfiguration {
		package PartsTree {
			[prefixMetadata] part vehicleLogical {
				part torqueGenerator : TorqueGenerator {
					action generateTorque :> Parts::ownedActions;
				}
				part electricalGenerator : ElectricalGenerator {
					action generateElectricity :> Parts::ownedActions;
				}
				part steeringSystem : SteeringSubsystem;
				part brakingSubsystem : BrakingSubsystem;
			}
		}
	}
	package VehicleLogicalToPhysicalAllocation {
		public import PartsTree::**;
		public import PartsTree::*;
		allocation  vehicleLogicalToPhysicalAllocation : LogicalToPhysical allocate  vehicleLogical to vehicle_b {
			allocate  vehicleLogical.torqueGenerator to vehicle_b.engine {
				end ref vehicleLogical.torqueGenerator;
				end ref vehicle_b.engine;
				allocate  vehicleLogical.torqueGenerator.generateTorque to vehicle_b.engine.providePower.generateTorque {
					end ref vehicleLogical.torqueGenerator.generateTorque;
					end ref vehicle_b.engine.providePower.generateTorque;
				}
			}
			allocate  vehicleLogical.electricalGenerator to vehicle_b.engine {
				end ref vehicleLogical.electricalGenerator;
				end ref vehicle_b.engine;
				allocate  vehicleLogical.electricalGenerator.generateElectricity to vehicle_b.engine.alternator.generateElectricity {
					end ref vehicleLogical.electricalGenerator.generateElectricity;
					end ref vehicle_b.engine.alternator.generateElectricity;
				}
			}
		}
	}
	package VehicleConfigurations {
		package VehicleConfiguration_a {
			package PartsTree {
				part vehicle_a : Vehicle {
					attribute mass :>> mass = dryMass + cargoMass + fuel.fuelMass;
					attribute dryMass :>> dryMass = NumericalFunctions::sum(NumericalFunctions::collection=partMasses);
					attribute :>> cargoMass = 0 [SI::kilogram];
					attribute partMasses [*];
					part fuelTank : FuelTank {
						attribute :>> mass = 75 [SI::kilogram];
						item :>> fuel {
							attribute :>> fuelMass = 50 [SI::kilogram];
						}
					}
					part frontAxleAssembly : AxleAssembly {
						attribute mass :> mass = 800 [SI::kilogram];
						part frontAxle : Axle;
						part frontWheels [2] : Wheel;
					}
					part rearAxleAssembly : AxleAssembly {
						attribute mass :> mass = 875 [SI::kilogram];
						attribute driveTrainEfficiency : ScalarValues::Real = 0.6;
						part rearAxle : Axle;
						part rearWheels [2] : Wheel {
							attribute :>> diameter;
						}
					}
				}
			}
			package ActionTree {}
			package Requirements {}
		}
		package VehicleConfiguration_b {
			public import ShapeItems::null::*;
			public import ParametersOfInterestMetadata::null::*;
			public import ModelingMetadata::*;
			package PartsTree {
				part vehicle_b : Vehicle {
					[prefixMetadata] attribute mass = dryMass + cargoMass + fuel.fuelMass;
					attribute dryMass :>> dryMass = NumericalFunctions::sum(NumericalFunctions::collection=partMasses);
					attribute :>> cargoMass default 0 [SI::kilogram];
					attribute partMasses = [SequenceExpression];
					attribute avgFuelEconomy :> distancePerVolume;
					port fuelCmdPort : FuelCmdPort {
						item fuelCmd :>> pwrCmd;
					}
					port setSpeedPort = ~SetSpeedPort;
					port vehicleToRoadPort :>> vehicleToRoadPort {
						port wheelToRoadPort1 : WheelToRoadPort;
						port wheelToRoadPort2 : WheelToRoadPort;
					}
					perform performSelfTest performSelfTest;
					perform applyParkingBrake applyParkingBrake;
					perform senseTemperature senseTemperature;
					exhibit state vehicleStates :>> vehicleStates;
					item [1] :> Items::envelopingShapes {
						length1 :>> ShapeItems::null = 4800 [SI::millimetre];
						width1 :>> ShapeItems::null = 1840 [SI::millimetre];
						height1 :>> ShapeItems::null = 1350 [SI::millimetre];
					}
					part fuelTank : FuelTank {
						attribute :>> mass = 75 [SI::kilogram];
						item :>> fuel {
							attribute :>> fuelMass = 60 [SI::kilogram];
						}
						attribute :>> fuelMassMax = 60 [SI::kilogram];
					}
					part frontAxleAssembly : AxleAssembly {
						attribute mass :> mass = 800 [SI::kilogram];
						port shaftPort_d : ShaftPort_d;
						part frontAxle : FrontAxle;
						part frontWheels [2] : Wheel;
					}
					part rearAxleAssembly : AxleAssembly {
						attribute mass :> mass = 875 [SI::kilogram];
						attribute driveTrainEfficiency : ScalarValues::Real = 0.6;
						port shaftPort_d : ShaftPort_d;
						perform providePower.distributeTorque providePower.distributeTorque;
						part rearWheel1 : Wheel {
							attribute :>> diameter;
							port wheelToRoadPort : WheelToRoadPort;
							port lugNutCompositePort :>> lugNutCompositePort {
								port lugNutPort [5] :>> lugNutPort;
							}
						}
						part rearWheel2 : Wheel {
							attribute :>> diameter;
							port wheelToRoadPort : WheelToRoadPort;
							port lugNutCompositePort :>> lugNutCompositePort {
								port lugNutPort [5] :>> lugNutPort;
							}
						}
						part differential : Differential {
							port shaftPort_d : ShaftPort_d;
							port leftDiffPort : DiffPort;
							port rightDiffPort : DiffPort;
						}
						part rearAxle {
							part leftHalfAxle : HalfAxle {
								port leftAxleToDiffPort : AxlePort;
								port shankCompositePort :>> shankCompositePort {
									port shankPort [5] :>> shankPort;
								}
							}
							part rightHalfAxle : HalfAxle {
								port rightAxleToDiffPort : AxlePort;
								port shankCompositePort :>> shankCompositePort {
									port shankPort [5] :>> shankPort;
								}
							}
						}
						bind shaftPort_d = differential.shaftPort_d {
							end ref differential.shaftPort_d;
						}
						connect  differential.leftDiffPort to rearAxle.leftHalfAxle.leftAxleToDiffPort {
							end ref differential.leftDiffPort;
							end ref rearAxle.leftHalfAxle.leftAxleToDiffPort;
						}
						connect  differential.rightDiffPort to rearAxle.rightHalfAxle.rightAxleToDiffPort {
							end ref differential.rightDiffPort;
							end ref rearAxle.rightHalfAxle.rightAxleToDiffPort;
						}
						interface  wheelToleftHalAxleInterface : WheelHubInterface connect  rearWheel1.lugNutCompositePort[1][1] to rearAxle.leftHalfAxle.shankCompositePort[1][1];
						interface  wheelTorightHalAxleInterface : WheelHubInterface connect  rearWheel2.lugNutCompositePort[1][1] to rearAxle.rightHalfAxle.shankCompositePort[1][1];
					}
					part starterMotor : StarterMotor;
					part engine : Engine {
						perform providePower.generateTorque providePower.generateTorque;
						part cylinders [4..6] : Cylinder;
						part alternator {
							action generateElectricity :> Parts::ownedActions;
						}
						satisfy engineSpecification engineSpecification {
							subject = [FeatureReferenceExpression];
							requirement torqueGenerationRequirement :>> torqueGenerationRequirement {
								subject generateTorque :>> generateTorque = engine.providePower.generateTorque;
							}
							requirement drivePowerOuputRequirement {
								subject :>> Requirements::subj;
								port torqueOutPort :>> torqueOutPort = engine.drivePwrPort;
							}
						}
					}
					part transmission : Transmission {
						attribute mass :> mass = 100 [SI::kilogram];
						port shaftPort_a : ShaftPort_a;
						perform providePower.amplifyTorque providePower.amplifyTorque;
					}
					part driveshaft : Driveshaft {
						attribute mass :> mass = 100 [SI::kilogram];
						port shaftPort_b : ShaftPort_b;
						port shaftPort_c : ShaftPort_c;
						perform providePower.transferTorque providePower.transferTorque;
					}
					part vehicleSoftware : VehicleSoftware {
						part vehicleController : VehicleController {
							exhibit state controllerStates :>> controllerStates;
							part cruiseController : CruiseController;
						}
					}
					part speedSensor : SpeedSensor;
					part bodyAssy : BodyAssy {
						part body : Body {
							attribute :>> color = red;
						}
						[prefixMetadata] part bumper;
						[prefixMetadata] part keylessEntry;
					}
					part interior {
						[prefixMetadata] part alarm;
						[prefixMetadata] part seatBelt [2];
						part frontSeat [2];
						[prefixMetadata] part driverAirBag;
					}
					bind engine.fuelCmdPort = fuelCmdPort {
						end ref engine.fuelCmdPort;
					}
					interface  engineToTransmissionInterface : EngineToTransmissionInterface connect  engine.drivePwrPort to transmission.clutchPort;
					interface  fuelInterface : FuelInterface connect  fuelTank.fuelOutPort to engine.fuelInPort;
					allocate  providePower.generateToAmplify to engineToTransmissionInterface {
						end ref providePower.generateToAmplify;
					}
					bind engine.ignitionCmdPort = ignitionCmdPort {
						end ref engine.ignitionCmdPort;
					}
					connect  starterMotor.gearPort to engine.flyWheelPort {
						end ref starterMotor.gearPort;
						end ref engine.flyWheelPort;
					}
					connect  vehicleSoftware.vehicleController.controlPort to engine.engineControlPort {
						end ref vehicleSoftware.vehicleController.controlPort;
						end ref engine.engineControlPort;
					}
					bind vehicle_b.setSpeedPort = vehicleSoftware.vehicleController.cruiseController.setSpeedPort {
						end ref vehicle_b.setSpeedPort;
						end ref vehicleSoftware.vehicleController.cruiseController.setSpeedPort;
					}
					connect  speedSensor.speedSensorPort to vehicleSoftware.vehicleController.cruiseController.speedSensorPort {
						end ref speedSensor.speedSensorPort;
						end ref vehicleSoftware.vehicleController.cruiseController.speedSensorPort;
					}
					bind vehicleSoftware.vehicleController.cruiseController.cruiseControlPort = vehicleSoftware.vehicleController.controlPort {
						end ref vehicleSoftware.vehicleController.cruiseController.cruiseControlPort;
						end ref vehicleSoftware.vehicleController.controlPort;
					}
					connect  transmission.shaftPort_a to driveshaft.shaftPort_b {
						end ref transmission.shaftPort_a;
						end ref driveshaft.shaftPort_b;
					}
					connect  driveshaft.shaftPort_c to rearAxleAssembly.shaftPort_d {
						end ref driveshaft.shaftPort_c;
						end ref rearAxleAssembly.shaftPort_d;
					}
					bind rearAxleAssembly.rearWheel1.wheelToRoadPort = vehicleToRoadPort.wheelToRoadPort1 {
						end ref rearAxleAssembly.rearWheel1.wheelToRoadPort;
						end ref vehicleToRoadPort.wheelToRoadPort1;
					}
					bind rearAxleAssembly.rearWheel2.wheelToRoadPort = vehicleToRoadPort.wheelToRoadPort2 {
						end ref rearAxleAssembly.rearWheel2.wheelToRoadPort;
						end ref vehicleToRoadPort.wheelToRoadPort2;
					}
					satisfy vehicleSpecification vehicleSpecification by vehicle_b {
						subject = vehicle_b;
						requirement vehicleMassRequirement {
							subject :>> Requirements::subj;
							attribute :>> massActual = [FeatureChainExpression];
							attribute :>> fuelMassActual = fuelTank.fuel.fuelMass;
						}
					}
				}
			}
			package ActionTree {
				action providePower : ProvidePower {
					item fuelCmd : FuelCmd;
					wheelToRoadTorque [2] :>> wheelToRoadTorque = [FeatureChainExpression];
					action generateTorque : GenerateTorque {
						item = [FeatureChainExpression];
					}
					action amplifyTorque : AmplifyTorque;
					action transferTorque : TransferTorque;
					action distributeTorque : DistributeTorque;
					flow generateToAmplify generateTorque.engineTorque to amplifyTorque.engineTorque;
					flow amplifyTorque.transmissionTorque to transferTorque.transmissionTorque;
					flow transferTorque.driveshaftTorque to distributeTorque.driveshaftTorque;
				}
				action performSelfTest : PerformSelfTest;
				action applyParkingBrake : ApplyParkingBrake;
				action senseTemperature : SenseTemperature;
			}
			package DiscreteInteractions {
				package Sequence {
					part def Driver {
						port p1;
						port p2;
					}
					part part0 {
						perform action startVehicle {
							{
								ref = ignitionCmd;
								ref = [FeatureChainExpression];
								ref :>> Transfers::receiver;
								ignitionCmd : IgnitionCmd;
							}
							{
								ignitionCmd : IgnitionCmd;
								ref = [FeatureChainExpression];
							}
							flow of IgnitionCmdfrom trigger1.ignitionCmd to startEngine.ignitionCmd;
							action startEngine {
								item ignitionCmd : IgnitionCmd;
								out item es : EngineStatus;
							}
							flow of EngineStatusfrom startEngine.es to sendStatus.es;
							{
								ref = es;
								ref = [FeatureChainExpression];
								ref :>> Transfers::receiver;
								es : EngineStatus;
							}
							{
								es : EngineStatus;
								ref = [FeatureChainExpression];
							}
						}
						part driver : Driver {
							perform startVehicle.turnVehicleOn startVehicle.turnVehicleOn;
							perform startVehicle.trigger2 startVehicle.trigger2;
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						part vehicle : Vehicle {
							perform startVehicle.trigger1 startVehicle.trigger1;
							perform startVehicle.sendStatus startVehicle.sendStatus;
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						first vehicle.doorClosed then driver.driverReady {
							end ref vehicle.doorClosed;
							end ref driver.driverReady;
						}
						message of IgnitionCmdfrom driver.startVehicle.turnVehicleOn to vehicle.startVehicle.trigger1;
						message of EngineStatusfrom vehicle.startVehicle.sendStatus to driver.startVehicle.trigger2;
					}
				}
				occurrence CruiseControl1 {
					part vehicle_b :> vehicle_b {
						port :>> setSpeedPort {
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						part :>> speedSensor {
							port :>> speedSensorPort {
								event occurrence :> Occurrences::timeEnclosedOccurrences;
							}
						}
						part :>> vehicleSoftware {
							part :>> vehicleController {
								part :>> cruiseController {
									port :>> setSpeedPort {
										event occurrence = setSpeedPort.setSpeedReceived;
									}
									port :>> speedSensorPort {
										event occurrence :> Occurrences::timeEnclosedOccurrences;
									}
									port :>> cruiseControlPort {
										event occurrence :> Occurrences::timeEnclosedOccurrences;
									}
								}
							}
						}
						part :>> engine {
							port :>> fuelCmdPort {
								event occurrence :> Occurrences::timeEnclosedOccurrences;
							}
						}
						message sendSensedSpeed of SensedSpeedfrom speedSensor.speedSensorPort.sensedSpeedSent to vehicleSoftware.vehicleController.cruiseController.speedSensorPort.sensedSpeedReceived;
						message sendFuelCmd of FuelCmdfrom vehicleSoftware.vehicleController.cruiseController.cruiseControlPort.fuelCmdSent to engine.fuelCmdPort.fuelCmdReceived;
					}
				}
				occurrence CruiseControl2 {
					part vehicle_b :> vehicle_b {
						port :>> setSpeedPort {
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						part :>> speedSensor {
							port :>> speedSensorPort {
								event sendSensedSpeed.Connections::source sendSensedSpeed.Connections::source;
							}
						}
						part :>> vehicleSoftware {
							part :>> vehicleController {
								part :>> cruiseController {
									port :>> setSpeedPort {
										event occurrence = setSpeedPort.setSpeedReceived;
									}
									port :>> speedSensorPort {
										event occurrence = [FeatureChainExpression];
										first setSpeedReceived then done {
											end ref sendSensedSpeed.Connections::target;
										}
										event sendSensedSpeed.Connections::target sendSensedSpeed.Connections::target;
									}
									port :>> cruiseControlPort {
										event sendFuelCmd.Connections::source sendFuelCmd.Connections::source;
									}
								}
							}
						}
						part :>> engine {
							port :>> fuelCmdPort {
								event sendFuelCmd.Connections::target sendFuelCmd.Connections::target;
							}
						}
						message sendSensedSpeed of SensedSpeed;
						message sendFuelCmd of FuelCmd;
					}
				}
			}
			package Requirements {
				public import RequirementDerivation::*;
				public import ModelingMetadata::*;
				item marketSurvey :> Items::items;
				dependency vehicleSpecificationto marketSurvey;
				requirement vehicleSpecification {
					subject vehicle : Vehicle;
					requirement vehicleMassRequirement {
						subject :>> Requirements::subj;
						doc \* The total mass of the vehicle shall be less than or equal to the required mass.
Assume total mass includes a full tank of gas of 60 kg*\
						attribute :>> massRequired = 2000 [SI::kilogram];
						attribute :>> massActual default [FeatureChainExpression] + fuelMassActual;
						attribute fuelMassActual :> mass;
						attribute fuelMassMax :> mass = 60 [SI::kilogram];
						assumption;
					}
					allocate  vehicleMassRequirement to vehicle_b.mass {
						end ref vehicle_b.mass;
					}
					requirement vehicleFuelEconomyRequirements {
						subject :>> Requirements::null;
						doc \* fuel economy requirements group *\
						attribute assumedCargoMass :> mass;
						requirement cityFuelEconomyRequirement {
							subject :>> Requirements::subj;
							:>> requiredFuelEconomy = 10 [SI::kilometre/SI::litre];
							assumption;
						}
						[prefixMetadata] requirement highwayFuelEconomyRequirement {
							subject :>> Requirements::subj;
							:>> requiredFuelEconomy = 12.75 [SI::kilometre/SI::litre];
							assumption;
						}
					}
				}
				requirement engineSpecification {
					subject engine1 : Engine;
					requirement engineMassRequirement {
						subject :>> Requirements::subj;
						doc \* The total mass of the engine shall be less than or equal to the required mass.*\
						attribute :>> massRequired = 200 [SI::kilogram];
						attribute :>> massActual = [FeatureChainExpression];
					}
					requirement torqueGenerationRequirement : TorqueGenerationRequirement {
						subject generateTorque default [FeatureChainExpression];
					}
					requirement drivePowerOutputRequirement {
						subject :>> Requirements::subj;
						port torqueOutPort {
							torque : TorqueValue;
						}
					}
				}
				[prefixMetadata] {
					end [prefixMetadata];
					end [prefixMetadata];
				}
			}
		}
		package Engine4Cyl_Variant {
			public import ModelingMetadata::*;
			part engine : Engine {
				part cylinders [4..8] : Cylinder;
			}
			part engine4Cyl :> engine {
				part [4] :>> cylinders;
				part cylinder1 [1] :> cylinders;
				part cylinder2 [1] :> cylinders;
				part cylinder3 [1] :> cylinders;
				part cylinder4 [1] :> cylinders;
			}
			dependency engine4Cylto engine{
				@ModelingMetadata::Refinement :;
			}
		}
		package WheelHubAssemblies {
			part wheelHubAssy1 {
				part wheel1 : Wheel {
					port :>> lugNutCompositePort {
						port lugNutPort [5] :>> lugNutPort;
					}
				}
				part hub1 : Hub {
					port :>> shankCompositePort {
						port shankPort [5] :>> shankPort;
					}
				}
				interface  wheelHubInterface : WheelHubInterface connect  wheel1.lugNutCompositePort[1][1] to hub1.shankCompositePort[1][1];
			}
			part wheelHubAssy2 {
				part wheel1 : Wheel {
					port :>> lugNutCompositePort {
						port lugNutPort [5] :>> lugNutPort;
					}
				}
				part hub1 : Hub {
					port :>> shankCompositePort {
						port shankPort [5] :>> shankPort;
					}
				}
				interface  wheelHubInterface : WheelHubInterface connect  lugNutCompositePort to shankCompositePort {
					interface  wheelFastenerInterface1 :> wheelFastenerInterface connect  lugNutPort to shankPort;
				}
			}
			part wheelHubAssy3 {
				part wheel1 : Wheel {
					port lugNutCompositePort :>> lugNutCompositePort {
						port lugNutPort [5] {
							attribute :>> threadDia = 14 [SI::millimetre];
							attribute :>> threadPitch = 1.5 [SI::millimetre];
						}
						port lugNutPort1 [1];
						port lugNutPort2 [1];
						port lugNutPort3 [1];
					}
				}
				part hub1 : Hub {
					port shankCompositePort :>> shankCompositePort {
						port shankPort [5] {
							attribute :>> threadDia = 14 [SI::millimetre];
							attribute :>> threadPitch = 1.5 [SI::millimetre];
							attribute :>> shaftLength = 70 [SI::millimetre];
						}
						port shankPort1 [1];
						port shankPort2 [1];
						port shankPort3 [1];
					}
				}
				interface  wheelHubInterface : WheelHubInterface connect  lugNutCompositePort to shankCompositePort {
					interface  wheelFastenerInterface1 :> wheelFastenerInterface connect  lugNutPort to shankPort {
						attribute :>> maxTorque = 90*1.356 [SI::newton*SI::metre];
					}
					interface  wheelFastenerInterface2 :> wheelFastenerInterface connect  lugNutPort to shankPort {
						attribute :>> maxTorque = 90*1.356 [SI::newton*SI::metre];
					}
					interface  wheelFastenerInterface3 :> wheelFastenerInterface connect  lugNutPort to shankPort {
						attribute :>> maxTorque = 90*1.356 [SI::newton*SI::metre];
					}
				}
			}
		}
	}
	package VehicleAnalysis {
		public import RiskMetadata::*;
		public import RiskMetadata::RiskLevelEnum::*;
		public import VehicleConfiguration_b::**;
		package FuelEconomyAnalysisModel {
			public import SampledFunctions::null::*;
			comment about \* This analysis model was provided by Hisashi Miyashita on January 27, 2021
We use the simplest fuel consumption analysis model introduced in:
Akcelik, R. "Fuel efficiency and other objectives in traffic system management." Traffic Engineering and Control 22.2 (1981): 54-65. 

Fuel consumption rate f can be decomposed to:
f = f_a + f_b * tpd_avg,
where tpd_avg is average interrupted travel time per unit distance, actually the inverse of the average velocity [t/km];
f_a is the best fuel consumption per distance; and
f_b is the additional fuel consumption per distance and average travel time, which can be regarded as the idling fuel consumption.
Approximately, it is proportional to engine displacement and it ranges from 0.5 to 0.6 [l/hour/litre of engine displacement]
according to:
Review of the Incidence, Energy Use and Costs of Passenger Vehicle Idling; Gordon W. Taylor, P.Eng. Prepared for the Office of Energy Efficiency, Natural Resources Canada, 2003

We assume f_a can be approximated to
fuel_consumption / distance = BSFC * SGG * required_power_avg * tpd_avg,
where required_power_avg is the required power, and it can be approximately derived from:
total_energy == P_req * tpd_avg * distance == 1/2 * mass / tpd_avg^2
This part is computed with BestFuelConsumptionPerDistance calc def.

BSFC means Brake-Specific Fuel Consumption, defined as gram/power.  SGG is the specific gravity of gasoline.
The high octane gasoline is about 0.76[l/kg].
*\
			attribute def Scenario {
				attribute wayPoint [1..*] {
					attribute elapseTime [1];
					attribute position [1];
				}
			}
			calc def FuelConsumption {
				bestFuelConsumption : ScalarValues::Real;
				idlingFuelConsumption : ScalarValues::Real;
				tpd_avg :> timePerDistance;
				attribute f = bestFuelConsumption + idlingFuelConsumption*tpd_avg;
				return out dpv :> distancePerVolume = 1/f;
			}
			calc def AverageTravelTimePerDistance {
				scenario : Scenario;
				return out tpd_avg :> timePerDistance;
			}
			calc def TraveledDistance {
				scenario : Scenario;
				return out distance :> length;
			}
			calc def IdlingFuelConsumptionPerTime {
				engine : Engine;
				attribute idlingFuelConsumptionPerDisplacement : ScalarValues::Real = 0.5;
				return out f_a : ScalarValues::Real = [FeatureChainExpression]*idlingFuelConsumptionPerDisplacement;
			}
			attribute specificGravityOfGasoline : ScalarValues::Real = 0.76;
			calc def BestFuelConsumptionPerDistance {
				mass : MassValue;
				bsfc : ScalarValues::Real;
				tpd_avg :> timePerDistance;
				distance :> length;
				attribute required_power_avg :> power;
				;
				return out f_b : ScalarValues::Real = bsfc*specificGravityOfGasoline*required_power_avg*tpd_avg;
			}
			calc def ComputeBSFC {
				engine : Engine;
			}
			analysis fuelEconomyAnalysis {
				subject = vehicle_b;
				requirement fuelEconomyAnalysisObjective {
					subject :>> AnalysisCases::null;
					doc \* estimate the vehicle fuel economy*\
					requirement;
				}
				attribute scenario : Scenario;
				attribute distance = TraveledDistance(scenario);
				attribute tpd_avg = AverageTravelTimePerDistance(scenario);
				attribute bsfc = ComputeBSFC(engine=[FeatureChainExpression]);
				attribute f_a = BestFuelConsumptionPerDistance(mass=[FeatureChainExpression], bsfc, tpd_avg, distance);
				attribute f_b = IdlingFuelConsumptionPerTime(engine=[FeatureChainExpression]);
				return out attribute calculatedFuelEconomy :> distancePerVolume = FuelConsumption(bestFuelConsumption=f_a, idlingFuelConsumption=f_b, tpd_avg);
			}
		}
		package ElectricalPowerAnalysis {}
		package ReliabilityAnalyis {}
		package VehicleTradeOffAnalysis {
			comment about \* The following example provides the rationale for selecting the engine4cyl. 
The rationale and risk are contained in a metadata library. *\
			@ModelingMetadata::Rationale : about vehicle_b_engine4cyl{
				:>> ModelingMetadata::explanation = engineTradeOffAnalysis;
				:>> ModelingMetadata::text = the engine4cyl was evaluated to have a higher objective function compared to the engine6cyl based on the trade-off analyiss;
			}
			@RiskMetadata::Risk : about vehicle_b_engine4cyl{
				:>> totalRisk = RiskMetadata::medium;
				:>> technicalRisk = RiskMetadata::medium;
				:>> scheduleRisk = RiskMetadata::medium;
				:>> costRisk = RiskMetadata::low;
			}
			@RiskMetadata::Risk : about fuelEfficiency{
				:>> technicalRisk {
					:>> probability = 0.3;
					:>> impact = 0.5;
				}
			}
			public import TradeStudies::*;
			calc def EngineEvaluation {
				engineMass :> mass;
				enginePower :> power;
				engineFuelEfficiency : ScalarValues::Real;
				engineCost : ScalarValues::Real;
				return out eval : ScalarValues::Real;
			}
			calc def EngineEvaluation_4cyl {
				engineMass :> mass;
				enginePower :> power;
				engineFuelEfficiency : ScalarValues::Real;
				engineCost : ScalarValues::Real;
				return out eval : ScalarValues::Real;
			}
			calc def EngineEvaluation_6cyl {
				engineMass :> mass;
				enginePower :> power;
				engineFuelEfficiency : ScalarValues::Real;
				engineCost : ScalarValues::Real;
				return out eval : ScalarValues::Real;
			}
			analysis engineTradeOffAnalysis : TradeStudy {
				subject vehicleAlternatives [2];
				part vehicle_b_engine4cyl :> vehicleAlternatives {
					part engine :>> engine {
						part cylinders [4] :>> cylinders;
						attribute mass :>> mass = 180 [SI::kilogram];
						attribute peakHorsePower :>> peakHorsePower = 180 [SI::watt];
						attribute fuelEfficiency :>> fuelEfficiency = 0.6;
						attribute cost :>> cost = 1000;
					}
				}
				part vehicle_b_engine6cyl :> vehicleAlternatives {
					part engine :>> engine {
						part cylinders [6] :>> cylinders;
						attribute mass :>> mass = 220 [SI::kilogram];
						attribute peakHorsePower :>> peakHorsePower = 220 [SI::watt];
						attribute fuelEfficiency :>> fuelEfficiency = 0.5;
						attribute cost :>> cost = 1500;
					}
				}
				requirement {
					subject :>> null;
				}
				comment about \* Select vehicle alternative with the engine whose evaluation function returns the max value*\
				calc :> evaluationFunction {
					part vehicle :> vehicle_b_engine4cyl;
					return out attribute eval : ScalarValues::Real = EngineEvaluation_4cyl(engineMass=engine.mass, enginePower=engine.peakHorsePower, engineFuelEfficiency=engine.fuelEfficiency, engineCost=engine.cost);
				}
				calc :> evaluationFunction {
					part vehicle :> vehicle_b_engine6cyl;
					return out attribute eval : ScalarValues::Real = EngineEvaluation_6cyl(engineMass=engine.mass, enginePower=engine.peakHorsePower, engineFuelEfficiency=engine.fuelEfficiency, engineCost=engine.cost);
				}
				return out part selectedVehicle :> vehicle_b;
			}
		}
	}
	package VehicleVerification {
		public import VehicleConfiguration_b::**;
		public import VerificationCaseDefinitions::*;
		public import VerificationCases1::*;
		public import VerificationCases::*;
		public import VerificationSystem::*;
		package VerificationCaseDefinitions {
			verification def MassTest {
				subject :>> subj;
				requirement {
					subject :>> subj;
				}
			}
			verification def AccelerationTest {
				subject :>> subj;
				requirement {
					subject :>> subj;
				}
			}
			verification def ReliabilityTest {
				subject :>> subj;
				requirement {
					subject :>> subj;
				}
			}
		}
		package VerificationCases1 {
			[prefixMetadata] verification massTests : MassTest {
				subject vehicle_uut :> vehicle_b;
				part vehicleVerificationSubSystem_1 = [FeatureChainExpression];
				requirement {
					subject :>> subj;
					requirement {
						subject :>> Requirements::subj;
						:>> massActual = [FeatureChainExpression];
					}
				}
				action weighVehicle {
					massMeasured :> mass;
				}
				first weighVehicle then evaluatePassFail;
				action evaluatePassFail {
					massMeasured :> mass;
					verdict = VerificationCases::PassIf(VerificationCases::isPassing=(vehicle_uut));
				}
				flow weighVehicle.massMeasured to evaluatePassFail.massMeasured;
			}
		}
		package VerificationSystem {
			part verificationContext {
				perform massTests massTests;
				part vehicle_UnitUnderTest :> vehicle_b;
				part massVerificationSystem {
					part scale {
						perform massTests.weighVehicle massTests.weighVehicle;
					}
					part operator {
						perform massTests.evaluatePassFail massTests.evaluatePassFail;
					}
				}
			}
		}
	}
	package VehicleIndividuals {
		individual occurrence a : VehicleRoadContext_1 {
			occurrence t0_t2_a {
				snapshot occurrence t0_a {
					attribute t0 :>> time = 0 [SI::second];
					snapshot occurrence t0_r : Road_1 {
						:>> incline = 0;
						:>> friction = 0.1;
					}
					snapshot occurrence t0_v : Vehicle_1 {
						:>> position = 0 [SI::metre];
						:>> velocity = 0 [SI::metre];
						:>> acceleration = 1.96 [SI::metre/SI::second**2];
						snapshot occurrence t0_fa : FrontAxleAssembly_1 {
							snapshot occurrence t0_leftFront : Wheel_1;
							snapshot occurrence t0_rightFront : Wheel_2;
						}
					}
				}
				snapshot occurrence t1_a {
					attribute t1 :>> time = 1 [SI::second];
					snapshot occurrence t1_r : Road_1 {
						:>> incline = 0;
						:>> friction = 0.1;
					}
					snapshot occurrence t1_v : Vehicle_1 {
						:>> position = 0.98 [SI::metre];
						:>> velocity = 1.96 [SI::metre/SI::second];
						:>> acceleration = 1.96 [SI::metre/SI::second**2];
						snapshot occurrence t1_fa : FrontAxleAssembly_1 {
							snapshot occurrence t1_leftFront : Wheel_1;
							snapshot occurrence t1_rightFront : Wheel_2;
						}
					}
				}
				snapshot occurrence t2_a {
					attribute t2 :>> time = 2 [SI::second];
					snapshot occurrence t2_r : Road_1 {
						:>> incline = 0;
						:>> friction = 0.1;
					}
					snapshot occurrence t2_v : Vehicle_1 {
						:>> position = 3.92 [SI::metre];
						:>> velocity = 3.92 [SI::metre/SI::second];
						:>> acceleration = 1.96 [SI::metre/SI::second**2];
						snapshot occurrence t2_fa : FrontAxleAssembly_1 {
							snapshot occurrence t2_leftFront : Wheel_1;
							snapshot occurrence t2_rightFront : Wheel_2;
						}
					}
				}
			}
		}
	}
	package MissionContext {
		comment about \* Define mission context with mission use cases for vehicle_b *\
		public import VehicleConfiguration_b::**;
		public import ParametersOfInterestMetadata::null::*;
		public import TransportPassengerScenario::*;
		package ContextDefinitions {
			part def MissionContext;
			part def Road;
			part def Driver {
				port handPort : HandPort;
				exhibit state driverStates;
			}
			part def Passenger;
			requirement transportRequirements {
				subject :>> Requirements::null;
			}
			use case def TransportPassenger {
				requirement TransportObjective {
					subject :>> UseCases::null;
					doc \* deliver passenger to destination safely, comfortably, and within acceptable time*\
					requirement;
				}
				subject vehicle : Vehicle;
				part environment;
				part road;
				part driver;
				part passenger [0..4];
				include use case getInVehicle_a [1..5] {
					subject :>> vehicle;
					requirement {
						subject :>> UseCases::null;
					}
				}
				include use case getOutOfVehicle_a [1..5] {
					subject :>> vehicle;
					requirement {
						subject :>> UseCases::null;
					}
				}
			}
			use case getInVehicle {
				subject :>> vehicle;
				action unlockDoor_in [0..1];
				first unlockDoor_in then openDoor_in;
				action openDoor_in :> Actions::subactions;
				first openDoor_in then enterVehicle;
				action enterVehicle :> Actions::subactions;
				first enterVehicle then closeDoor_in;
				action closeDoor_in :> Actions::subactions;
				requirement {
					subject :>> UseCases::null;
				}
			}
			use case def GetInVehicle {
				subject vehicle : Vehicle;
				part driver [0..1];
				part passenger [0..1];
				assert constraint;
				requirement {
					subject :>> UseCases::null;
				}
			}
			use case getOutOfVehicle {
				subject :>> vehicle;
				action openDoor_out :> Actions::subactions;
				first openDoor_out then exitVehicle;
				action exitVehicle :> Actions::subactions;
				first exitVehicle then closeDoor_out;
				action closeDoor_out :> Actions::subactions;
				first closeDoor_out then lockDoor_out;
				action lockDoor_out :> Actions::subactions;
				requirement {
					subject :>> UseCases::null;
				}
			}
			use case def GetOutOfVehicle {
				subject vehicle : Vehicle;
				part driver [0..1];
				part passenger [0..1];
				assert constraint;
				requirement {
					subject :>> UseCases::null;
				}
			}
		}
		package TransportPassengerScenario {
			public import TransportPassenger::*;
			use case transportPassenger {
				subject :>> vehicle;
				public first UseCases::start;
				first start then a {
					end ref UseCases::start;
				}
				action a {
					action driverGetInVehicle [1] :> getInVehicle_a;
					action passenger1GetInVehicle [1] :> getInVehicle_a;
				}
				first a then trigger;
				{
					ignitionCmd : IgnitionCmd;
					ref :>> Transfers::receiver;
				}
				first trigger then b;
				action b {
					action driveVehicleToDestination :> Actions::subactions;
					action providePower :> Actions::subactions;
				}
				first b then c;
				action c {
					action driverGetOutOfVehicle [1] :> getOutOfVehicle_a;
					action passenger1GetOutOfVehicle [1] :> getOutOfVehicle_a;
				}
				first c then done {
					end ref UseCases::done;
				}
				requirement {
					subject :>> UseCases::null;
				}
			}
			use case transportPassenger_1 {
				subject :>> vehicle;
				action driverGetInVehicle [1] :> getInVehicle_a;
				action passenger1GetInVehicle [1] :> getInVehicle_a;
				action driverGetOutOfVehicle [1] :> getOutOfVehicle_a;
				action passenger1GetOutOfVehicle [1] :> getOutOfVehicle_a;
				action driveVehicleToDestination :> Actions::subactions;
				action providePower :> Actions::subactions;
				item def VehicleOnSignal;
				join join1 :> Actions::joins;
				join join2 :> Actions::joins;
				join join3 :> Actions::joins;
				{
					ignitionCmd : IgnitionCmd;
					ref :>> Transfers::receiver;
				}
				public first UseCases::start;
				first start then fork1 {
					end ref UseCases::start;
				}
				fork fork1 :> Actions::forks;
				first fork1 then driverGetInVehicle;
				first fork1 then passenger1GetInVehicle;
				first driverGetInVehicle then join1;
				first passenger1GetInVehicle then join1;
				first join1 then trigger;
				first trigger then fork2;
				fork fork2 :> Actions::forks;
				first fork2 then driveVehicleToDestination;
				first fork2 then providePower;
				first driveVehicleToDestination then join2;
				first providePower then join2;
				first join2 then fork3;
				fork fork3 :> Actions::forks;
				first fork3 then driverGetOutOfVehicle;
				first fork3 then passenger1GetOutOfVehicle;
				first driverGetOutOfVehicle then join3;
				first passenger1GetOutOfVehicle then join3;
				first join3 then done {
					end ref UseCases::done;
				}
				requirement {
					subject :>> UseCases::null;
				}
			}
		}
		part missionContext : MissionContext {
			[prefixMetadata] attribute transportTime;
			perform transportPassenger transportPassenger;
			part road : Road = [FeatureChainExpression];
			part driver : Driver = [FeatureChainExpression] {
				perform transportPassenger.a.driverGetInVehicle.unlockDoor_in transportPassenger.a.driverGetInVehicle.unlockDoor_in;
				perform transportPassenger.a.driverGetInVehicle.openDoor_in transportPassenger.a.driverGetInVehicle.openDoor_in;
				perform transportPassenger.a.driverGetInVehicle.enterVehicle transportPassenger.a.driverGetInVehicle.enterVehicle;
				perform transportPassenger.a.driverGetInVehicle.closeDoor_in transportPassenger.a.driverGetInVehicle.closeDoor_in;
				perform transportPassenger.c.driverGetOutOfVehicle.openDoor_out transportPassenger.c.driverGetOutOfVehicle.openDoor_out;
				perform transportPassenger.c.driverGetOutOfVehicle.exitVehicle transportPassenger.c.driverGetOutOfVehicle.exitVehicle;
				perform transportPassenger.c.driverGetOutOfVehicle.closeDoor_out transportPassenger.c.driverGetOutOfVehicle.closeDoor_out;
				perform transportPassenger.c.driverGetOutOfVehicle.lockDoor_out transportPassenger.c.driverGetOutOfVehicle.lockDoor_out;
				perform transportPassenger.b.driveVehicleToDestination transportPassenger.b.driveVehicleToDestination;
			}
			part passenger1 : Passenger = [FeatureChainExpression] {
				perform transportPassenger.a.passenger1GetInVehicle.unlockDoor_in transportPassenger.a.passenger1GetInVehicle.unlockDoor_in;
				perform transportPassenger.a.passenger1GetInVehicle.openDoor_in transportPassenger.a.passenger1GetInVehicle.openDoor_in;
				perform transportPassenger.a.passenger1GetInVehicle.enterVehicle transportPassenger.a.passenger1GetInVehicle.enterVehicle;
				perform transportPassenger.a.passenger1GetInVehicle.closeDoor_in transportPassenger.a.passenger1GetInVehicle.closeDoor_in;
				perform transportPassenger.c.passenger1GetOutOfVehicle.openDoor_out transportPassenger.c.passenger1GetOutOfVehicle.openDoor_out;
				perform transportPassenger.c.passenger1GetOutOfVehicle.exitVehicle transportPassenger.c.passenger1GetOutOfVehicle.exitVehicle;
				perform transportPassenger.c.passenger1GetOutOfVehicle.closeDoor_out transportPassenger.c.passenger1GetOutOfVehicle.closeDoor_out;
				perform transportPassenger.c.passenger1GetOutOfVehicle.lockDoor_out transportPassenger.c.passenger1GetOutOfVehicle.lockDoor_out;
			}
			part vehicle_b_1 :> vehicle_b = [FeatureChainExpression] {
				attribute :>> position3dVector = [SequenceExpression] [spatialCF];
				perform transportPassenger.b.providePower transportPassenger.b.providePower;
				perform transportPassenger.trigger transportPassenger.trigger;
			}
			connect  driver.handPort to vehicle_b_1.ignitionCmdPort {
				end ref driver.handPort;
				end ref vehicle_b_1.ignitionCmdPort;
			}
			connect  road to vehicle_b_1.vehicleToRoadPort {
				end ref vehicle_b_1.vehicleToRoadPort;
			}
		}
	}
	package VehicleSuperSetModel {
		comment about \* all of vehicleFamily is included in the superset model to enable subsetting a specific vehicle configuration*\
		package VariationPointDefinitions {
			variation part def TransmissionChoices {
				part transmissionAutomatic : TransmissionAutomatic;
				part transmissionManual : TransmissionManual;
			}
		}
		package VehiclePartsTree {
			public import VariationPointDefinitions::*;
			abstract part vehicleFamily {
				variation part engine : Engine {
					part engine4Cyl : Engine4Cyl;
					part engine6Cyl : Engine6Cyl {
						part cylinder [6] : Cylinder {
							variation attribute diameter : LengthValue {
								attribute smallDiameter : LengthValue;
								attribute largeDiagmeter : LengthValue;
							}
						}
					}
				}
				part transmissionChoices : TransmissionChoices;
				part sunroof [0..1] : Sunroof;
				assert constraint selectionConstraint;
				part driveshaft;
				part frontAxleAssembly;
				part rearAxleAssembly;
			}
		}
	}
	package SafetyandSecurityGroups {
		public import PartsTree::*;
		package SafetyGroup {
			comment about \* Parts that contribute to safety. *\
			public import vehicle_b::**;
			public filter @Safety;
		}
		package SecurityGroup {
			comment about \* Parts that contribute to security. *\
			public import vehicle_b::**;
			public filter @Security;
		}
		package SafetyandSecurityGroup {
			comment about \* Parts that contribute to safety OR security. *\
			public import vehicle_b::**;
			public filter @Safety or [BodyExpression];
		}
		package MandatorySafetyGroup {
			comment about \* Parts that contribute to safety AND are mandatory. *\
			public import vehicle_b::**;
			public filter @Safety and [BodyExpression];
		}
	}
	package Views_Viewpoints {
		package ViewpointDefinitions {
			viewpoint def BehaviorViewpoint {
				subject :>> Views::subj;
			}
			viewpoint def SafetyViewpoint {
				subject :>> Views::subj;
				concern vs {
					subject :>> Requirements::null;
				}
			}
			part def SafetyEngineer;
			concern def VehicleSafety {
				subject :>> Requirements::null;
				doc \* identify system safety features *\
				part se : SafetyEngineer;
			}
		}
		package ViewDefinitions {
			public import Views::*;
			view def TreeView {
				;
			}
			view def NestedView;
			view def RelationshipView;
			view def TableView;
			view def PartsTreeView {
				public filter @SysML::PartUsage;
			}
			view def PartsInterconnection;
		}
		package VehicleViews {
			public import ViewpointDefinitions::*;
			public import ViewDefinitions::*;
			public import VehicleConfiguration_b::*;
			view vehiclePartsTree_Safety : PartsTreeView {
				satisfy requirement sv {
					subject :>> Views::subj;
				}
				protected expose PartsTree::**;
				public filter @Safety;
			}
		}
	}
}

