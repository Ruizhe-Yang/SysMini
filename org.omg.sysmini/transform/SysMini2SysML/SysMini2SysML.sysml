package SimpleVehicleModel {
	public import Definitions;
	public import ISQ::*;
	package Definitions {
		public import PartDefinitions;
		public import PortDefinitions;
		public import ItemDefinitions;
		public import SignalDefinitions;
		public import InterfaceDefinitions;
		public import AllocationDefinitions;
		public import ActionDefinitions;
		public import StateDefinitions;
		public import RequirementDefinitions;
		public import AttributeDefinitions;
		public import IndividualDefinitions;
		public import MetadataDefinitions;
		public import KeyWord_MetadataDefinitions;
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
				exhibit state vehicleStates {
					ref controller : VehicleController;
					;
					;
				}
			}
			part def Engine {
				attribute mass :> mass;
				attribute peakHorsePower :> power;
				attribute fuelEfficiency : ScalarValues::Real;
				attribute cost : ScalarValues::Real;
				attribute displacement :> volume;
				port engineControlPort;
				port fuelInPort;
				port fuelCmdPort : FuelCmdPort;
				port drivePwrPort : DrivePwrPort;
				port ignitionCmdPort : IgnitionCmdPort;
				port flyWheelPort;
				perform action generateTorque :> Parts::performedActions;
				exhibit state engineStates {
					;
					;
					;
				}
			}
			part def StarterMotor {
				port gearPort : GearPort;
			}
			part def Cylinder;
			part def Transmission {
				attribute gearRatio : ScalarValues::Real;
				port clutchPort;
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
				exhibit state controllerStates {
					;
				}
			}
			part def CruiseController {
				port setSpeedPort;
				port speedSensorPort;
				port cruiseControlPort : CruiseControlPort;
				exhibit state cruiseControllerStates :> Parts::exhibitedStates;
			}
			part def SpeedSensor {
				port speedSensorPort : SpeedSensorPort;
			}
			part def FuelTank {
				attribute mass :> mass;
				item fuel : Fuel {
					attribute :>>;
				}
				attribute fuelKind : FuelKind;
				attribute fuelMassMax :> mass;
				{
					out ref :>> Constraints::null;
				}
				port fuelOutPort : FuelPort;
				port fuelInPort;
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
				out ref torque : TorqueValue;
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
				end port p2;
				flow p1.torque to p2.torque;
			}
			interface def FuelInterface {
				end port fuelOutPort : FuelPort;
				end port fuelInPort;
				flow of Fuelfrom fuelOutPort.fuel to fuelInPort.fuel;
			}
			interface def WheelFastenerInterface {
				end port lugNutPort : LugNutPort;
				end port shankPort : ShankPort;
				attribute maxTorque : TorqueValue;
				{
					out ref :>> Items::null;
				}
			}
			interface def WheelHubInterface {
				end port lugNutCompositePort : LugNutCompositePort;
				end port shankCompositePort : ShankCompositePort;
				interface  wheelFastenerInterface [5] : WheelFastenerInterface connect  lugNutCompositePort.lugNutPort to shankCompositePort.shankPort;
			}
		}
		package AllocationDefinitions {
			allocation def LogicalToPhysical;
		}
		package ActionDefinitions {
			action def ProvidePower {
				item pwrCmd : PwrCmd;
				out ref wheelToRoadTorque [2] : TorqueValue;
			}
			action def GenerateTorque {
				item fuelCmd : FuelCmd;
				out ref engineTorque : TorqueValue;
			}
			action def AmplifyTorque {
				ref engineTorque : TorqueValue;
				out ref transmissionTorque : TorqueValue;
			}
			action def TransferTorque {
				ref transmissionTorque : TorqueValue;
				out ref driveshaftTorque : TorqueValue;
			}
			action def DistributeTorque {
				ref driveshaftTorque : TorqueValue;
				out ref wheelToRoadTorque [2] : TorqueValue;
			}
			action def PerformSelfTest;
			action def ApplyParkingBrake;
			action def SenseTemperature {
				out ref temp : ThermodynamicTemperatureValue;
			}
		}
		package StateDefinitions {
			state def VehicleStates;
			state def ControllerStates;
			state def CruiseControllerStates;
		}
		package RequirementDefinitions {
			requirement def MassRequirement {
				ref :>> Requirements::subj;
				doc \* The actual mass shall be less than the required mass*\
				attribute massRequired :> mass;
				attribute massActual :> mass;
				{
					out ref :>> Requirements::null;
				}
				out ref :>> Requirements::null;
			}
			requirement def ReliabilityRequirement {
				ref :>> Requirements::subj;
				doc \* The actual reliability shall be greater than the required reliability*\
				attribute reliabilityRequired : ScalarValues::Real;
				attribute reliabilityActual : ScalarValues::Real;
				{
					out ref :>> Requirements::null;
				}
				out ref :>> Requirements::null;
			}
			requirement def TorqueGenerationRequirement {
				doc \* The engine shall generate torque as a function of RPM as shown in Table 1. *\
				ref generateTorque : GenerateTorque;
				out ref :>> Requirements::null;
			}
			requirement def DrivePowerOutputRequirement {
				ref :>> Requirements::subj;
				doc \* The engine shall provide a connection point to transfer torque to the transmission.*\
				out ref :>> Requirements::null;
			}
			requirement def FuelEconomyRequirement {
				ref :>> Requirements::subj;
				doc \* The vehicle shall maintain an average fuel economomy of at least x miles per gallon for the nominal 
driving scenario *\
				attribute actualFuelEconomy :>;
				attribute requiredFuelEconomy :>;
				{
					out ref :>> Requirements::null;
				}
				out ref :>> Requirements::null;
			}
		}
		package AttributeDefinitions {
			public import ScalarValues::*;
			public import Quantities::*;
			public import MeasurementReferences::null;
			public import SIPrefixes::null;
			public import NumericalFunctions::*;
			public import SI::*;
			public import USCustomaryUnits::*;
			enum def {
				enum black : Colors;
				enum grey : Colors;
				enum red : Colors;
			}
			enum def {
				enum [;
				enum [;
				enum [;
			}
			attribute cylinderDiameter : DiameterChoices [;
			enum def {
				enum on : IgnitionOnOff;
				enum off : IgnitionOnOff;
			}
			enum def {
				enum gas : FuelKind;
				enum diesel : FuelKind;
			}
			ref distancePerVolume :> scalarQuantities /;
			ref timePerDistance :> scalarQuantities /;
			ref volumePerDistance :> scalarQuantities /;
			ref volumePerTime :> scalarQuantities /;
			ref kpl : MeasurementReferences::DerivedUnit /;
			ref rpm : MeasurementReferences::DerivedUnit /;
			ref kW : MeasurementReferences::DerivedUnit *;
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
			public import Metaobjects::null;
			;
			metadata def <fm> failureMode {
				ref :>> Metaobjects::baseType meta;
			}
			occurrence logicalOccurrences [*];
			metadata def <l> logical {
				ref :>> Metaobjects::baseType meta;
			}
			occurrence physicalOccurrences [*];
			metadata def <p> physical {
				ref :>> Metaobjects::baseType meta;
			}
		}
		package GenericContext {
			part def Context {
				attribute time : DurationValue;
				attribute spatialCF [1] : CartesianSpatial3dCoordinateFrame {
					ref :>> null ,;
				}
				attribute velocityCF [1] : CartesianVelocity3dCoordinateFrame /;
				attribute accelarationCF [1] : CartesianAcceleration3dCoordinateFrame /;
			}
		}
	}
	package VehicleLogicalConfiguration {
		package PartsTree {
			part vehicleLogical {
				;
				part torqueGenerator : TorqueGenerator {
					;
				}
				part electricalGenerator : ElectricalGenerator {
					;
				}
				part steeringSystem : SteeringSubsystem;
				part brakingSubsystem : BrakingSubsystem;
			}
		}
	}
	package VehicleLogicalToPhysicalAllocation {
		public import PartsTree;
		public import PartsTree;
		allocation  vehicleLogicalToPhysicalAllocation : LogicalToPhysical allocate  vehicleLogical to vehicle_b {
			allocation  allocate  vehicleLogical.torqueGenerator to vehicle_b.engine {
				allocation  allocate  vehicleLogical.torqueGenerator.generateTorque to vehicle_b.engine.providePower.generateTorque;
			}
			allocation  allocate  vehicleLogical.electricalGenerator to vehicle_b.engine {
				allocation  allocate  vehicleLogical.electricalGenerator.generateElectricity to vehicle_b.engine.alternator.generateElectricity;
			}
		}
	}
	package VehicleConfigurations {
		package VehicleConfiguration_a {
			package PartsTree {
				part vehicle_a : Vehicle {
					attribute mass :>> +;
					attribute dryMass :>>;
					attribute :>> [;
					attribute partMasses [*];
					part fuelTank : FuelTank {
						attribute :>> [;
						item :>> {
							attribute :>> [;
						}
					}
					part frontAxleAssembly : AxleAssembly {
						attribute mass :> mass [;
						part frontAxle : Axle;
						part frontWheels [2] : Wheel;
					}
					part rearAxleAssembly : AxleAssembly {
						attribute mass :> mass [;
						attribute driveTrainEfficiency : ScalarValues::Real;
						part rearAxle : Axle;
						part rearWheels [2] : Wheel {
							attribute :>>;
						}
					}
				}
			}
			package ActionTree;
			package Requirements;
		}
		package VehicleConfiguration_b {
			public import ShapeItems::null;
			public import ParametersOfInterestMetadata::null;
			public import ModelingMetadata::*;
			package PartsTree {
				part vehicle_b : Vehicle {
					attribute mass + {
						;
					}
					attribute dryMass :>>;
					attribute :>> [;
					attribute partMasses ,;
					attribute avgFuelEconomy :>;
					port fuelCmdPort : FuelCmdPort {
						item fuelCmd :>>;
					}
					port setSpeedPort;
					port vehicleToRoadPort :>> {
						port wheelToRoadPort1 : WheelToRoadPort;
						port wheelToRoadPort2 : WheelToRoadPort;
					}
					perform performSelfTest;
					perform applyParkingBrake;
					perform senseTemperature;
					exhibit state vehicleStates :>>;
					item [1] :> Items::envelopingShapes {
						ref length1 :>> ShapeItems::null [;
						ref width1 :>> ShapeItems::null [;
						ref height1 :>> ShapeItems::null [;
					}
					part fuelTank : FuelTank {
						attribute :>> [;
						item :>> {
							attribute :>> [;
						}
						attribute :>> [;
					}
					part frontAxleAssembly : AxleAssembly {
						attribute mass :> mass [;
						port shaftPort_d : ShaftPort_d;
						part frontAxle : FrontAxle;
						part frontWheels [2] : Wheel;
					}
					part rearAxleAssembly : AxleAssembly {
						attribute mass :> mass [;
						attribute driveTrainEfficiency : ScalarValues::Real;
						port shaftPort_d : ShaftPort_d;
						perform providePower.distributeTorque;
						part rearWheel1 : Wheel {
							attribute :>>;
							port wheelToRoadPort : WheelToRoadPort;
							port lugNutCompositePort :>> {
								port lugNutPort [5] :>>;
							}
						}
						part rearWheel2 : Wheel {
							attribute :>>;
							port wheelToRoadPort : WheelToRoadPort;
							port lugNutCompositePort :>> {
								port lugNutPort [5] :>>;
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
								port shankCompositePort :>> {
									port shankPort [5] :>>;
								}
							}
							part rightHalfAxle : HalfAxle {
								port rightAxleToDiffPort : AxlePort;
								port shankCompositePort :>> {
									port shankPort [5] :>>;
								}
							}
						}
						bind shaftPort_d = differential.shaftPort_d;
						connect  differential.leftDiffPort to rearAxle.leftHalfAxle.leftAxleToDiffPort;
						connect  differential.rightDiffPort to rearAxle.rightHalfAxle.rightAxleToDiffPort;
						interface  wheelToleftHalAxleInterface : WheelHubInterface connect  rearWheel1.lugNutCompositePort[1][1] to rearAxle.leftHalfAxle.shankCompositePort[1][1];
						interface  wheelTorightHalAxleInterface : WheelHubInterface connect  rearWheel2.lugNutCompositePort[1][1] to rearAxle.rightHalfAxle.shankCompositePort[1][1];
					}
					part starterMotor : StarterMotor;
					part engine : Engine {
						part cylinders [4] : Cylinder;
						part alternator {
							;
						}
						{
							ref;
							{
								ref generateTorque :>>;
								out ref :>>;
							}
							{
								ref :>>;
								port torqueOutPort :>>;
								out ref :>>;
							}
							out ref :>>;
						}
					}
					part transmission : Transmission {
						attribute mass :> mass [;
						port shaftPort_a : ShaftPort_a;
						perform providePower.amplifyTorque;
					}
					part driveshaft : Driveshaft {
						attribute mass :> mass [;
						port shaftPort_b : ShaftPort_b;
						port shaftPort_c : ShaftPort_c;
						perform providePower.transferTorque;
					}
					part vehicleSoftware : VehicleSoftware {
						part vehicleController : VehicleController {
							exhibit state controllerStates :>>;
							part cruiseController : CruiseController;
						}
					}
					part speedSensor : SpeedSensor;
					part bodyAssy : BodyAssy {
						part body : Body {
							attribute :>>;
						}
						part bumper {
							{
								ref :>>;
							}
						}
						part keylessEntry {
							;
						}
					}
					part interior {
						part alarm {
							;
						}
						part seatBelt [2] {
							{
								ref :>>;
							}
						}
						part frontSeat [2];
						part driverAirBag {
							{
								ref :>>;
							}
						}
					}
					bind engine.fuelCmdPort = fuelCmdPort;
					interface  engineToTransmissionInterface : EngineToTransmissionInterface connect  engine.drivePwrPort to transmission.clutchPort;
					interface  fuelInterface : FuelInterface connect  fuelTank.fuelOutPort to engine.fuelInPort;
					allocation  allocate  providePower.generateToAmplify to engineToTransmissionInterface;
					bind engine.ignitionCmdPort = ignitionCmdPort;
					connect  starterMotor.gearPort to engine.flyWheelPort;
					connect  vehicleSoftware.vehicleController.controlPort to engine.engineControlPort;
					bind vehicle_b.setSpeedPort = vehicleSoftware.vehicleController.cruiseController.setSpeedPort;
					connect  speedSensor.speedSensorPort to vehicleSoftware.vehicleController.cruiseController.speedSensorPort;
					bind vehicleSoftware.vehicleController.cruiseController.cruiseControlPort = vehicleSoftware.vehicleController.controlPort;
					connect  transmission.shaftPort_a to driveshaft.shaftPort_b;
					connect  driveshaft.shaftPort_c to rearAxleAssembly.shaftPort_d;
					bind rearAxleAssembly.rearWheel1.wheelToRoadPort = vehicleToRoadPort.wheelToRoadPort1;
					bind rearAxleAssembly.rearWheel2.wheelToRoadPort = vehicleToRoadPort.wheelToRoadPort2;
					{
						ref;
						{
							ref :>>;
							attribute :>>;
							attribute :>>;
							out ref :>>;
						}
						out ref :>>;
					}
				}
			}
			package ActionTree {
				{
					item fuelCmd : FuelCmd;
					out ref wheelToRoadTorque [2] :>>;
					{
						item;
					}
					;
					;
					;
					flow generateToAmplify generateTorque.engineTorque to amplifyTorque.engineTorque;
					flow amplifyTorque.transmissionTorque to transferTorque.transmissionTorque;
					flow transferTorque.driveshaftTorque to distributeTorque.driveshaftTorque;
				}
				;
				;
				;
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
								ref;
								ref;
								ref :>> Transfers::receiver;
								ref ignitionCmd : IgnitionCmd;
							}
							{
								ref ignitionCmd : IgnitionCmd;
								ref;
							}
							flow of IgnitionCmdfrom trigger1.ignitionCmd to startEngine.ignitionCmd;
							{
								item ignitionCmd : IgnitionCmd;
								out item es : EngineStatus;
							}
							flow of EngineStatusfrom startEngine.es to sendStatus.es;
							{
								ref;
								ref;
								ref :>> Transfers::receiver;
								ref es : EngineStatus;
							}
							{
								ref es : EngineStatus;
								ref;
							}
						}
						part driver : Driver {
							perform startVehicle.turnVehicleOn;
							perform startVehicle.trigger2;
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						part vehicle : Vehicle {
							perform startVehicle.trigger1;
							perform startVehicle.sendStatus;
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						first vehicle.doorClosed then driver.driverReady;
						message of IgnitionCmdfrom driver.startVehicle.turnVehicleOn to vehicle.startVehicle.trigger1;
						message of EngineStatusfrom vehicle.startVehicle.sendStatus to driver.startVehicle.trigger2;
					}
				}
				occurrence CruiseControl1 {
					part vehicle_b :> {
						port :>> {
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						part :>> {
							port :>> {
								event occurrence :> Occurrences::timeEnclosedOccurrences;
							}
						}
						part :>> {
							part :>> {
								part :>> {
									port :>> {
										event occurrence;
									}
									port :>> {
										event occurrence :> Occurrences::timeEnclosedOccurrences;
									}
									port :>> {
										event occurrence :> Occurrences::timeEnclosedOccurrences;
									}
								}
							}
						}
						part :>> {
							port :>> {
								event occurrence :> Occurrences::timeEnclosedOccurrences;
							}
						}
						message sendSensedSpeed of SensedSpeedfrom speedSensor.speedSensorPort.sensedSpeedSent to vehicleSoftware.vehicleController.cruiseController.speedSensorPort.sensedSpeedReceived;
						message sendFuelCmd of FuelCmdfrom vehicleSoftware.vehicleController.cruiseController.cruiseControlPort.fuelCmdSent to engine.fuelCmdPort.fuelCmdReceived;
					}
				}
				occurrence CruiseControl2 {
					part vehicle_b :> {
						port :>> {
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						part :>> {
							port :>> {
								event sendSensedSpeed;
							}
						}
						part :>> {
							part :>> {
								part :>> {
									port :>> {
										event occurrence;
									}
									port :>> {
										event occurrence;
										first setSpeedReceived then done {
											end ref;
										}
										event sendSensedSpeed;
									}
									port :>> {
										event sendFuelCmd;
									}
								}
							}
						}
						part :>> {
							port :>> {
								event sendFuelCmd;
							}
						}
						;
						;
					}
				}
			}
			package Requirements {
				public import RequirementDerivation::*;
				public import ModelingMetadata::*;
				item marketSurvey :> Items::items;
				{
					ref vehicle : Vehicle;
					{
						ref :>>;
						doc \* The total mass of the vehicle shall be less than or equal to the required mass.
Assume total mass includes a full tank of gas of 60 kg*\
						attribute :>> [;
						attribute :>> +;
						attribute fuelMassActual :> mass;
						attribute fuelMassMax :> mass [;
						{
							out ref :>> Requirements::null;
						}
						out ref :>>;
					}
					allocation  allocate  vehicleMassRequirement to vehicle_b.mass;
					{
						ref :>> Requirements::null;
						doc \* fuel economy requirements group *\
						attribute assumedCargoMass :> mass;
						{
							ref :>>;
							ref :>> [;
							{
								out ref :>> Requirements::null;
							}
							out ref :>>;
						}
						{
							ref :>>;
							ref :>> [;
							{
								out ref :>> Requirements::null;
							}
							{
								ref :>> status;
								ref :>> originator;
								ref :>> owner;
							}
							out ref :>>;
						}
						out ref :>> Requirements::null;
					}
					out ref :>> Requirements::null;
				}
				{
					ref engine1 : Engine;
					{
						ref :>>;
						doc \* The total mass of the engine shall be less than or equal to the required mass.*\
						attribute :>> [;
						attribute :>>;
						out ref :>>;
					}
					{
						ref generateTorque;
						out ref :>>;
					}
					{
						ref :>>;
						port torqueOutPort {
							out ref torque : TorqueValue;
						}
						out ref :>>;
					}
					out ref :>> Requirements::null;
				}
				{
					;
				}
			}
		}
		package Engine4Cyl_Variant {
			public import ModelingMetadata::*;
			part engine : Engine {
				part cylinders [4] : Cylinder;
			}
			part engine4Cyl :> {
				part [4] :>>;
				part cylinder1 [1] :>;
				part cylinder2 [1] :>;
				part cylinder3 [1] :>;
				part cylinder4 [1] :>;
			}
		}
		package WheelHubAssemblies {
			part wheelHubAssy1 {
				part wheel1 : Wheel {
					port :>> {
						port lugNutPort [5] :>>;
					}
				}
				part hub1 : Hub {
					port :>> {
						port shankPort [5] :>>;
					}
				}
				interface  wheelHubInterface : WheelHubInterface connect  wheel1.lugNutCompositePort[1][1] to hub1.shankCompositePort[1][1];
			}
			part wheelHubAssy2 {
				part wheel1 : Wheel {
					port :>> {
						port lugNutPort [5] :>>;
					}
				}
				part hub1 : Hub {
					port :>> {
						port shankPort [5] :>>;
					}
				}
				interface  wheelHubInterface : WheelHubInterface connect  lugNutCompositePort to shankCompositePort {
					interface  wheelFastenerInterface1 :> connect  lugNutPort to shankPort;
				}
			}
			part wheelHubAssy3 {
				part wheel1 : Wheel {
					port lugNutCompositePort :>> {
						port lugNutPort [5] {
							attribute :>> [;
							attribute :>> [;
						}
						port lugNutPort1 [1];
						port lugNutPort2 [1];
						port lugNutPort3 [1];
					}
				}
				part hub1 : Hub {
					port shankCompositePort :>> {
						port shankPort [5] {
							attribute :>> [;
							attribute :>> [;
							attribute :>> [;
						}
						port shankPort1 [1];
						port shankPort2 [1];
						port shankPort3 [1];
					}
				}
				interface  wheelHubInterface : WheelHubInterface connect  lugNutCompositePort to shankCompositePort {
					interface  wheelFastenerInterface1 :> connect  lugNutPort to shankPort {
						attribute :>> *;
					}
					interface  wheelFastenerInterface2 :> connect  lugNutPort to shankPort {
						attribute :>> *;
					}
					interface  wheelFastenerInterface3 :> connect  lugNutPort to shankPort {
						attribute :>> *;
					}
				}
			}
		}
	}
	package VehicleAnalysis {
		public import RiskMetadata::*;
		public import RiskMetadata::RiskLevelEnum;
		public import VehicleConfiguration_b;
		package FuelEconomyAnalysisModel {
			public import SampledFunctions::null;
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
				attribute wayPoint [1] {
					attribute elapseTime [1];
					attribute position [1];
				}
			}
			calc def FuelConsumption {
				ref bestFuelConsumption : ScalarValues::Real;
				ref idlingFuelConsumption : ScalarValues::Real;
				ref tpd_avg :>;
				attribute f +;
				out ref dpv :> /;
			}
			calc def AverageTravelTimePerDistance {
				ref scenario : Scenario;
				out ref tpd_avg :>;
			}
			calc def TraveledDistance {
				ref scenario : Scenario;
				out ref distance :> length;
			}
			calc def IdlingFuelConsumptionPerTime {
				ref engine : Engine;
				attribute idlingFuelConsumptionPerDisplacement : ScalarValues::Real;
				out ref f_a : ScalarValues::Real *;
			}
			attribute specificGravityOfGasoline : ScalarValues::Real;
			calc def BestFuelConsumptionPerDistance {
				ref mass : MassValue;
				ref bsfc : ScalarValues::Real;
				ref tpd_avg :>;
				ref distance :> length;
				attribute required_power_avg :> power;
				{
					out ref :>> Constraints::null;
				}
				out ref f_b : ScalarValues::Real *;
			}
			calc def ComputeBSFC {
				ref engine : Engine;
				out ref : ScalarValues::Real;
			}
			{
				ref;
				{
					ref :>> AnalysisCases::null;
					doc \* estimate the vehicle fuel economy*\
					{
						out ref :>>;
					}
					out ref :>> AnalysisCases::null;
				}
				attribute scenario : Scenario;
				attribute distance;
				attribute tpd_avg;
				attribute bsfc;
				attribute f_a;
				attribute f_b;
				out attribute calculatedFuelEconomy :>;
			}
		}
		package ElectricalPowerAnalysis;
		package ReliabilityAnalyis;
		package VehicleTradeOffAnalysis {
			comment about \* The following example provides the rationale for selecting the engine4cyl. 
The rationale and risk are contained in a metadata library. *\
			{
				ref :>> ModelingMetadata::explanation;
				ref :>> ModelingMetadata::text;
			}
			{
				ref :>> totalRisk;
				ref :>> technicalRisk;
				ref :>> scheduleRisk;
				ref :>> costRisk;
			}
			{
				ref :>> technicalRisk {
					ref :>> probability;
					ref :>> impact;
				}
			}
			public import TradeStudies::*;
			calc def EngineEvaluation {
				ref engineMass :> mass;
				ref enginePower :> power;
				ref engineFuelEfficiency : ScalarValues::Real;
				ref engineCost : ScalarValues::Real;
				out ref eval : ScalarValues::Real;
			}
			calc def EngineEvaluation_4cyl {
				ref engineMass :> mass;
				ref enginePower :> power;
				ref engineFuelEfficiency : ScalarValues::Real;
				ref engineCost : ScalarValues::Real;
				out ref eval : ScalarValues::Real;
			}
			calc def EngineEvaluation_6cyl {
				ref engineMass :> mass;
				ref enginePower :> power;
				ref engineFuelEfficiency : ScalarValues::Real;
				ref engineCost : ScalarValues::Real;
				out ref eval : ScalarValues::Real;
			}
			{
				ref vehicleAlternatives [2];
				part vehicle_b_engine4cyl :> {
					part engine :>> {
						part cylinders [4] :>>;
						attribute mass :>> [;
						attribute peakHorsePower :>> [;
						attribute fuelEfficiency :>>;
						attribute cost :>>;
					}
				}
				part vehicle_b_engine6cyl :> {
					part engine :>> {
						part cylinders [6] :>>;
						attribute mass :>> [;
						attribute peakHorsePower :>> [;
						attribute fuelEfficiency :>>;
						attribute cost :>>;
					}
				}
				{
					ref :>> null;
					out ref :>> null;
				}
				comment about \* Select vehicle alternative with the engine whose evaluation function returns the max value*\
				{
					part vehicle :>;
					out attribute eval : ScalarValues::Real;
				}
				{
					part vehicle :>;
					out attribute eval : ScalarValues::Real;
				}
				out part selectedVehicle :>;
			}
		}
	}
	package VehicleVerification {
		public import VehicleConfiguration_b;
		public import VerificationCaseDefinitions;
		public import VerificationCases1;
		public import VerificationCases::*;
		public import VerificationSystem;
		package VerificationCaseDefinitions {
			verification def MassTest {
				ref :>> subj;
				{
					ref :>> subj;
					out ref :>> null;
				}
				out ref :>> verdict;
			}
			verification def AccelerationTest {
				ref :>> subj;
				{
					ref :>> subj;
					out ref :>> null;
				}
				out ref :>> verdict;
			}
			verification def ReliabilityTest {
				ref :>> subj;
				{
					ref :>> subj;
					out ref :>> null;
				}
				out ref :>> verdict;
			}
		}
		package VerificationCases1 {
			{
				ref vehicle_uut :>;
				part vehicleVerificationSubSystem_1;
				{
					ref :>>;
					{
						ref :>>;
						ref :>>;
						out ref :>>;
					}
					out ref :>>;
				}
				{
					ref :>> kind ,;
				}
				{
					out ref massMeasured :> mass;
				}
				first weighVehicle then evaluatePassFail;
				{
					ref massMeasured :> mass;
					out ref verdict;
				}
				flow weighVehicle.massMeasured to evaluatePassFail.massMeasured;
				out ref :>>;
			}
		}
		package VerificationSystem {
			part verificationContext {
				perform massTests;
				part vehicle_UnitUnderTest :>;
				part massVerificationSystem {
					part scale {
						perform massTests.weighVehicle;
					}
					part operator {
						perform massTests.evaluatePassFail;
					}
				}
			}
		}
	}
	package VehicleIndividuals {
		individual occurrence a : VehicleRoadContext_1 {
			occurrence t0_t2_a {
				snapshot occurrence t0_a {
					attribute t0 :>> [;
					snapshot occurrence t0_r : Road_1 {
						ref :>>;
						ref :>>;
					}
					snapshot occurrence t0_v : Vehicle_1 {
						ref :>> [;
						ref :>> [;
						ref :>> [;
						snapshot occurrence t0_fa : FrontAxleAssembly_1 {
							snapshot occurrence t0_leftFront : Wheel_1;
							snapshot occurrence t0_rightFront : Wheel_2;
						}
					}
				}
				snapshot occurrence t1_a {
					attribute t1 :>> [;
					snapshot occurrence t1_r : Road_1 {
						ref :>>;
						ref :>>;
					}
					snapshot occurrence t1_v : Vehicle_1 {
						ref :>> [;
						ref :>> [;
						ref :>> [;
						snapshot occurrence t1_fa : FrontAxleAssembly_1 {
							snapshot occurrence t1_leftFront : Wheel_1;
							snapshot occurrence t1_rightFront : Wheel_2;
						}
					}
				}
				snapshot occurrence t2_a {
					attribute t2 :>> [;
					snapshot occurrence t2_r : Road_1 {
						ref :>>;
						ref :>>;
					}
					snapshot occurrence t2_v : Vehicle_1 {
						ref :>> [;
						ref :>> [;
						ref :>> [;
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
		public import VehicleConfiguration_b;
		public import ParametersOfInterestMetadata::null;
		public import TransportPassengerScenario;
		package ContextDefinitions {
			part def MissionContext;
			part def Road;
			part def Driver {
				port handPort : HandPort;
				exhibit state driverStates {
					;
					;
					;
					;
					;
				}
			}
			part def Passenger;
			{
				ref :>> Requirements::null;
				out ref :>> Requirements::null;
			}
			use case def TransportPassenger {
				{
					ref :>> UseCases::null;
					doc \* deliver passenger to destination safely, comfortably, and within acceptable time*\
					{
						out ref :>>;
					}
					out ref :>> UseCases::null;
				}
				ref vehicle : Vehicle;
				part environment;
				part road;
				part driver;
				part passenger [0];
				include use case getInVehicle_a [1] {
					ref :>>;
					{
						ref :>> Requirements::null;
						out ref :>>;
					}
					out ref :>>;
				}
				include use case getOutOfVehicle_a [1] {
					ref :>>;
					{
						ref :>> Requirements::null;
						out ref :>>;
					}
					out ref :>>;
				}
				out ref :>> UseCases::null;
			}
			{
				ref :>>;
				;
				first unlockDoor_in then openDoor_in;
				;
				first openDoor_in then enterVehicle;
				;
				first enterVehicle then closeDoor_in;
				;
				{
					ref :>>;
					out ref :>>;
				}
				out ref :>>;
			}
			use case def GetInVehicle {
				ref vehicle : Vehicle;
				part driver [0];
				part passenger [0];
				{
					out ref :>> Constraints::null;
				}
				{
					ref :>> UseCases::null;
					out ref :>> UseCases::null;
				}
				out ref :>> UseCases::null;
			}
			{
				ref :>>;
				;
				first openDoor_out then exitVehicle;
				;
				first exitVehicle then closeDoor_out;
				;
				first closeDoor_out then lockDoor_out;
				;
				{
					ref :>>;
					out ref :>>;
				}
				out ref :>>;
			}
			use case def GetOutOfVehicle {
				ref vehicle : Vehicle;
				part driver [0];
				part passenger [0];
				{
					out ref :>> Constraints::null;
				}
				{
					ref :>> UseCases::null;
					out ref :>> UseCases::null;
				}
				out ref :>> UseCases::null;
			}
		}
		package TransportPassengerScenario {
			public import TransportPassenger;
			{
				ref :>>;
				first start then a {
					end ref;
				}
				{
					;
					;
				}
				first a then trigger;
				{
					ref ignitionCmd : IgnitionCmd;
					ref :>> Transfers::receiver;
				}
				first trigger then b;
				{
					;
					;
				}
				first b then c;
				{
					;
					;
				}
				first c then done {
					end ref;
				}
				{
					ref :>>;
					out ref :>>;
				}
				out ref :>>;
			}
			{
				ref :>>;
				;
				;
				;
				;
				;
				;
				item def VehicleOnSignal;
				;
				;
				;
				{
					ref ignitionCmd : IgnitionCmd;
					ref :>> Transfers::receiver;
				}
				first start then fork1 {
					end ref;
				}
				;
				first fork1 then driverGetInVehicle;
				first fork1 then passenger1GetInVehicle;
				first driverGetInVehicle then join1;
				first passenger1GetInVehicle then join1;
				first join1 then trigger;
				first trigger then fork2;
				;
				first fork2 then driveVehicleToDestination;
				first fork2 then providePower;
				first driveVehicleToDestination then join2;
				first providePower then join2;
				first join2 then fork3;
				;
				first fork3 then driverGetOutOfVehicle;
				first fork3 then passenger1GetOutOfVehicle;
				first driverGetOutOfVehicle then join3;
				first passenger1GetOutOfVehicle then join3;
				first join3 then done {
					end ref;
				}
				{
					ref :>>;
					out ref :>>;
				}
				out ref :>>;
			}
		}
		part missionContext : MissionContext {
			attribute transportTime {
				;
			}
			perform transportPassenger;
			part road : Road;
			part driver : Driver {
				perform transportPassenger.a.driverGetInVehicle.unlockDoor_in;
				perform transportPassenger.a.driverGetInVehicle.openDoor_in;
				perform transportPassenger.a.driverGetInVehicle.enterVehicle;
				perform transportPassenger.a.driverGetInVehicle.closeDoor_in;
				perform transportPassenger.c.driverGetOutOfVehicle.openDoor_out;
				perform transportPassenger.c.driverGetOutOfVehicle.exitVehicle;
				perform transportPassenger.c.driverGetOutOfVehicle.closeDoor_out;
				perform transportPassenger.c.driverGetOutOfVehicle.lockDoor_out;
				perform transportPassenger.b.driveVehicleToDestination;
			}
			part passenger1 : Passenger {
				perform transportPassenger.a.passenger1GetInVehicle.unlockDoor_in;
				perform transportPassenger.a.passenger1GetInVehicle.openDoor_in;
				perform transportPassenger.a.passenger1GetInVehicle.enterVehicle;
				perform transportPassenger.a.passenger1GetInVehicle.closeDoor_in;
				perform transportPassenger.c.passenger1GetOutOfVehicle.openDoor_out;
				perform transportPassenger.c.passenger1GetOutOfVehicle.exitVehicle;
				perform transportPassenger.c.passenger1GetOutOfVehicle.closeDoor_out;
				perform transportPassenger.c.passenger1GetOutOfVehicle.lockDoor_out;
			}
			part vehicle_b_1 :> {
				attribute :>> position3dVector [;
				perform transportPassenger.b.providePower;
				perform transportPassenger.trigger;
			}
			connect  driver.handPort to vehicle_b_1.ignitionCmdPort;
			connect  road to vehicle_b_1.vehicleToRoadPort;
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
			public import VariationPointDefinitions;
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
				part sunroof [0] : Sunroof;
				{
					out ref :>> Constraints::null;
				}
				part driveshaft;
				part frontAxleAssembly;
				part rearAxleAssembly;
			}
		}
	}
	package SafetyandSecurityGroups {
		public import PartsTree;
		package SafetyGroup {
			comment about \* Parts that contribute to safety. *\
			public import vehicle_b;
		}
		package SecurityGroup {
			comment about \* Parts that contribute to security. *\
			public import vehicle_b;
		}
		package SafetyandSecurityGroup {
			comment about \* Parts that contribute to safety OR security. *\
			public import vehicle_b;
		}
		package MandatorySafetyGroup {
			comment about \* Parts that contribute to safety AND are mandatory. *\
			public import vehicle_b;
		}
	}
	package Views_Viewpoints {
		package ViewpointDefinitions {
			viewpoint def BehaviorViewpoint {
				ref :>> Views::subj;
				out ref :>> Views::null;
			}
			viewpoint def SafetyViewpoint {
				ref :>> Views::subj;
				{
					ref :>> Requirements::null;
					out ref :>>;
				}
				out ref :>> Views::null;
			}
			part def SafetyEngineer;
			concern def VehicleSafety {
				ref :>> Requirements::null;
				doc \* identify system safety features *\
				part se : SafetyEngineer;
				out ref :>> Requirements::null;
			}
		}
		package ViewDefinitions {
			public import Views::*;
			view def TreeView {
				rendering;
			}
			view def NestedView;
			view def RelationshipView;
			view def TableView;
			view def PartsTreeView;
			view def PartsInterconnection;
		}
		package VehicleViews {
			public import ViewpointDefinitions;
			public import ViewDefinitions;
			public import VehicleConfiguration_b;
			view vehiclePartsTree_Safety : PartsTreeView {
				{
					ref :>>;
					out ref :>>;
				}
				protected PartsTree;
			}
		}
	}
}

