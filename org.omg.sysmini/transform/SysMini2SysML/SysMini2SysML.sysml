package SimpleVehicleModel {
	public import Definitions;
	public import ISQ::*;
	package Definitions {

		package PartDefinitions {
			part def Vehicle {;
			}
			part def Engine {
				attribute mass :> mass;
				attribute peakHorsePower :> power;
				attribute fuelEfficiency : ScalarValues::Real;
				attribute cost : ScalarValues::Real;
				attribute displacement :> volume;
				port engineControlPort : ~ControlPort;
				port fuelInPort : ~FuelPort;
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
				port clutchPort : ~DrivePwrPort;
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
				port setSpeedPort : ~SetSpeedPort;
				port speedSensorPort : ~SpeedSensorPort;
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
				assert constraint fuelConstraint {
					out ref :>> Constraints::null;
				}
				port fuelOutPort : FuelPort;
				port fuelInPort : ~FuelPort;
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
				end port p2 : ~DrivePwrPort;
				flow p1.torque to p2.torque;
			}
			interface def FuelInterface {
				end port fuelOutPort : FuelPort;
				end port fuelInPort : ~FuelPort;
				flow of Fuelfrom fuelOutPort.fuel to fuelInPort.fuel;
			}
			interface def WheelFastenerInterface {
				end port lugNutPort : LugNutPort;
				end port shankPort : ShankPort;
				attribute maxTorque : TorqueValue;
				constraint {
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
				constraint {
					out ref :>> Requirements::null;
				}
				out ref :>> Requirements::null;
			}
			requirement def ReliabilityRequirement {
				subject :>> Requirements::subj;
				doc \* The actual reliability shall be greater than the required reliability*\
				attribute reliabilityRequired : ScalarValues::Real;
				attribute reliabilityActual : ScalarValues::Real;
				constraint {
					out ref :>> Requirements::null;
				}
				out ref :>> Requirements::null;
			}
			requirement def TorqueGenerationRequirement {
				doc \* The engine shall generate torque as a function of RPM as shown in Table 1. *\
				subject generateTorque : GenerateTorque;
				out ref :>> Requirements::null;
			}
			requirement def DrivePowerOutputRequirement {
				subject :>> Requirements::subj;
				doc \* The engine shall provide a connection point to transfer torque to the transmission.*\
				out ref :>> Requirements::null;
			}
			requirement def FuelEconomyRequirement {
				subject :>> Requirements::subj;
				doc \* The vehicle shall maintain an average fuel economomy of at least x miles per gallon for the nominal 
driving scenario *\
				attribute actualFuelEconomy :>;
				attribute requiredFuelEconomy :>;
				constraint {
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
			public alias Torque for ISQMechanics::TorqueValue;
			enum def {
				enum black : Colors;
				enum grey : Colors;
				enum red : Colors;
			}
			enum def {
				enum : [OperatorExpression];
				enum : [OperatorExpression];
				enum : [OperatorExpression];
			}
			attribute cylinderDiameter : DiameterChoices : [OperatorExpression];
			enum def {
				enum on : IgnitionOnOff;
				enum off : IgnitionOnOff;
			}
			enum def {
				enum gas : FuelKind;
				enum diesel : FuelKind;
			}
			distancePerVolume :> scalarQuantities : [OperatorExpression];
			timePerDistance :> scalarQuantities : [OperatorExpression];
			volumePerDistance :> scalarQuantities : [OperatorExpression];
			volumePerTime :> scalarQuantities : [OperatorExpression];
			kpl : MeasurementReferences::DerivedUnit : [OperatorExpression];
			rpm : MeasurementReferences::DerivedUnit : [OperatorExpression];
			kW : MeasurementReferences::DerivedUnit : [OperatorExpression];
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
			state failureModes [*];
			metadata def <fm> failureMode {
				:>> Metaobjects::baseType : [OperatorExpression];
			}
			occurrence logicalOccurrences [*];
			metadata def <l> logical {
				:>> Metaobjects::baseType : [OperatorExpression];
			}
			occurrence physicalOccurrences [*];
			metadata def <p> physical {
				:>> Metaobjects::baseType : [OperatorExpression];
			}
		}
		package GenericContext {
			part def Context {
				attribute time : DurationValue;
				attribute spatialCF [1] : CartesianSpatial3dCoordinateFrame {
					:>> null : [OperatorExpression];
				}
				attribute velocityCF [1] : CartesianVelocity3dCoordinateFrame : [OperatorExpression];
				attribute accelarationCF [1] : CartesianAcceleration3dCoordinateFrame : [OperatorExpression];
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
		public import PartsTree;
		public import PartsTree;
		allocation  vehicleLogicalToPhysicalAllocation : LogicalToPhysical allocate  vehicleLogical to vehicle_b {
			allocate  vehicleLogical.torqueGenerator to vehicle_b.engine {
				allocate  vehicleLogical.torqueGenerator.generateTorque to vehicle_b.engine.providePower.generateTorque;
			}
			allocate  vehicleLogical.electricalGenerator to vehicle_b.engine {
				allocate  vehicleLogical.electricalGenerator.generateElectricity to vehicle_b.engine.alternator.generateElectricity;
			}
		}
	}
	package VehicleConfigurations {
		package VehicleConfiguration_a {
			package PartsTree {
				part vehicle_a : Vehicle {
					attribute mass :>> : [OperatorExpression];
					attribute dryMass :>> : [nullCoalescingExpression];
					attribute :>> : [OperatorExpression];
					attribute partMasses [*];
					part fuelTank : FuelTank {
						attribute :>> : [OperatorExpression];
						item :>> {
							attribute :>> : [OperatorExpression];
						}
					}
					part frontAxleAssembly : AxleAssembly {
						attribute mass :> mass : [OperatorExpression];
						part frontAxle : Axle;
						part frontWheels [2] : Wheel;
					}
					part rearAxleAssembly : AxleAssembly {
						attribute mass :> mass : [OperatorExpression];
						attribute driveTrainEfficiency : ScalarValues::Real : [nullCoalescingExpression];
						part rearAxle : Axle;
						part rearWheels [2] : Wheel {
							attribute :>>;
						}
					}
				}
			}
			package ActionTree {}
			package Requirements {}
		}
		package VehicleConfiguration_b {
			public import ShapeItems::null;
			public import ParametersOfInterestMetadata::null;
			public import ModelingMetadata::*;
			package PartsTree {
				part vehicle_b : Vehicle {
					[prefixMetadata] attribute mass : [OperatorExpression];
					attribute dryMass :>> : [nullCoalescingExpression];
					attribute :>> default [OperatorExpression];
					attribute partMasses : [OperatorExpression];
					attribute avgFuelEconomy :>;
					port fuelCmdPort : FuelCmdPort {
						item fuelCmd :>>;
					}
					port setSpeedPort : ~SetSpeedPort;
					port vehicleToRoadPort :>> {
						port wheelToRoadPort1 : WheelToRoadPort;
						port wheelToRoadPort2 : WheelToRoadPort;
					}
					perform performSelfTest;
					perform applyParkingBrake;
					perform senseTemperature;
					exhibit state vehicleStates :>>;
					item [1] :> Items::envelopingShapes {
						length1 :>> ShapeItems::null : [OperatorExpression];
						width1 :>> ShapeItems::null : [OperatorExpression];
						height1 :>> ShapeItems::null : [OperatorExpression];
					}
					part fuelTank : FuelTank {
						attribute :>> : [OperatorExpression];
						item :>> {
							attribute :>> : [OperatorExpression];
						}
						attribute :>> : [OperatorExpression];
					}
					part frontAxleAssembly : AxleAssembly {
						attribute mass :> mass : [OperatorExpression];
						port shaftPort_d : ShaftPort_d;
						part frontAxle : FrontAxle;
						part frontWheels [2] : Wheel;
					}
					part rearAxleAssembly : AxleAssembly {
						attribute mass :> mass : [OperatorExpression];
						attribute driveTrainEfficiency : ScalarValues::Real : [nullCoalescingExpression];
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
							action generateElectricity :> Parts::ownedActions;
						}
						satisfy engineSpecification {
							subject : [nullCoalescingExpression];
							requirement torqueGenerationRequirement :>> {
								subject generateTorque :>> : [nullCoalescingExpression];
								out ref :>>;
							}
							requirement drivePowerOuputRequirement {
								subject :>>;
								port torqueOutPort :>> : [nullCoalescingExpression];
								out ref :>>;
							}
							out ref :>>;
						}
					}
					part transmission : Transmission {
						attribute mass :> mass : [OperatorExpression];
						port shaftPort_a : ShaftPort_a;
						perform providePower.amplifyTorque;
					}
					part driveshaft : Driveshaft {
						attribute mass :> mass : [OperatorExpression];
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
							attribute :>> : [nullCoalescingExpression];
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
					bind engine.fuelCmdPort = fuelCmdPort;
					interface  engineToTransmissionInterface : EngineToTransmissionInterface connect  engine.drivePwrPort to transmission.clutchPort;
					interface  fuelInterface : FuelInterface connect  fuelTank.fuelOutPort to engine.fuelInPort;
					allocate  providePower.generateToAmplify to engineToTransmissionInterface;
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
					satisfy vehicleSpecification by vehicle_b {
						subject : [nullCoalescingExpression];
						requirement vehicleMassRequirement {
							subject :>>;
							attribute :>> : [nullCoalescingExpression];
							attribute :>> : [nullCoalescingExpression];
							out ref :>>;
						}
						out ref :>>;
					}
				}
			}
			package ActionTree {
				action providePower : ProvidePower {
					item fuelCmd : FuelCmd;
					wheelToRoadTorque [2] :>> : [nullCoalescingExpression];
					action generateTorque : GenerateTorque {
						item : [nullCoalescingExpression];
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
								ref : [nullCoalescingExpression];
								ref : [nullCoalescingExpression];
								ref :>> Transfers::receiver;
								ignitionCmd : IgnitionCmd;
							}
							{
								ignitionCmd : IgnitionCmd;
								ref : [nullCoalescingExpression];
							}
							flow of IgnitionCmdfrom trigger1.ignitionCmd to startEngine.ignitionCmd;
							action startEngine {
								item ignitionCmd : IgnitionCmd;
								out item es : EngineStatus;
							}
							flow of EngineStatusfrom startEngine.es to sendStatus.es;
							{
								ref : [nullCoalescingExpression];
								ref : [nullCoalescingExpression];
								ref :>> Transfers::receiver;
								es : EngineStatus;
							}
							{
								es : EngineStatus;
								ref : [nullCoalescingExpression];
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
										event occurrence : [nullCoalescingExpression];
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
										event occurrence : [nullCoalescingExpression];
									}
									port :>> {
										event occurrence : [nullCoalescingExpression];
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
				dependency vehicleSpecificationto marketSurvey;
				requirement vehicleSpecification {
					subject vehicle : Vehicle;
					requirement vehicleMassRequirement {
						subject :>>;
						doc \* The total mass of the vehicle shall be less than or equal to the required mass.
Assume total mass includes a full tank of gas of 60 kg*\
						attribute :>> : [OperatorExpression];
						attribute :>> default [OperatorExpression];
						attribute fuelMassActual :> mass;
						attribute fuelMassMax :> mass : [OperatorExpression];
						constraint {
							out ref :>> Requirements::null;
						}
						out ref :>>;
					}
					allocate  vehicleMassRequirement to vehicle_b.mass;
					requirement vehicleFuelEconomyRequirements {
						subject :>> Requirements::null;
						doc \* fuel economy requirements group *\
						attribute assumedCargoMass :> mass;
						requirement cityFuelEconomyRequirement {
							subject :>>;
							:>> : [OperatorExpression];
							constraint {
								out ref :>> Requirements::null;
							}
							out ref :>>;
						}
						[prefixMetadata] requirement highwayFuelEconomyRequirement {
							subject :>>;
							:>> : [OperatorExpression];
							constraint {
								out ref :>> Requirements::null;
							}
							out ref :>>;
						}
						out ref :>> Requirements::null;
					}
					out ref :>> Requirements::null;
				}
				requirement engineSpecification {
					subject engine1 : Engine;
					requirement engineMassRequirement {
						subject :>>;
						doc \* The total mass of the engine shall be less than or equal to the required mass.*\
						attribute :>> : [OperatorExpression];
						attribute :>> : [nullCoalescingExpression];
						out ref :>>;
					}
					requirement torqueGenerationRequirement : TorqueGenerationRequirement {
						subject generateTorque default [nullCoalescingExpression];
						out ref :>>;
					}
					requirement drivePowerOutputRequirement {
						subject :>>;
						port torqueOutPort {
							torque : TorqueValue;
						}
						out ref :>>;
					}
					out ref :>> Requirements::null;
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
				part cylinders [4] : Cylinder;
			}
			part engine4Cyl :> {
				part [4] :>>;
				part cylinder1 [1] :>;
				part cylinder2 [1] :>;
				part cylinder3 [1] :>;
				part cylinder4 [1] :>;
			}
			dependency engine4Cylto engine{
				@ModelingMetadata::Refinement :;
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
							attribute :>> : [OperatorExpression];
							attribute :>> : [OperatorExpression];
						}
						port lugNutPort1 [1];
						port lugNutPort2 [1];
						port lugNutPort3 [1];
					}
				}
				part hub1 : Hub {
					port shankCompositePort :>> {
						port shankPort [5] {
							attribute :>> : [OperatorExpression];
							attribute :>> : [OperatorExpression];
							attribute :>> : [OperatorExpression];
						}
						port shankPort1 [1];
						port shankPort2 [1];
						port shankPort3 [1];
					}
				}
				interface  wheelHubInterface : WheelHubInterface connect  lugNutCompositePort to shankCompositePort {
					interface  wheelFastenerInterface1 :> connect  lugNutPort to shankPort {
						attribute :>> : [OperatorExpression];
					}
					interface  wheelFastenerInterface2 :> connect  lugNutPort to shankPort {
						attribute :>> : [OperatorExpression];
					}
					interface  wheelFastenerInterface3 :> connect  lugNutPort to shankPort {
						attribute :>> : [OperatorExpression];
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
				bestFuelConsumption : ScalarValues::Real;
				idlingFuelConsumption : ScalarValues::Real;
				tpd_avg :>;
				attribute f : [OperatorExpression];
				return out dpv :> : [OperatorExpression];
			}
			calc def AverageTravelTimePerDistance {
				scenario : Scenario;
				return out tpd_avg :>;
			}
			calc def TraveledDistance {
				scenario : Scenario;
				return out distance :> length;
			}
			calc def IdlingFuelConsumptionPerTime {
				engine : Engine;
				attribute idlingFuelConsumptionPerDisplacement : ScalarValues::Real : [nullCoalescingExpression];
				return out f_a : ScalarValues::Real : [OperatorExpression];
			}
			attribute specificGravityOfGasoline : ScalarValues::Real : [nullCoalescingExpression];
			calc def BestFuelConsumptionPerDistance {
				mass : MassValue;
				bsfc : ScalarValues::Real;
				tpd_avg :>;
				distance :> length;
				attribute required_power_avg :> power;
				constraint {
					out ref :>> Constraints::null;
				}
				return out f_b : ScalarValues::Real : [OperatorExpression];
			}
			calc def ComputeBSFC {
				engine : Engine;
				out ref : ScalarValues::Real;
			}
			analysis fuelEconomyAnalysis {
				subject : [nullCoalescingExpression];
				requirement fuelEconomyAnalysisObjective {
					subject :>> AnalysisCases::null;
					doc \* estimate the vehicle fuel economy*\
					constraint {
						out ref :>>;
					}
					out ref :>> AnalysisCases::null;
				}
				attribute scenario : Scenario;
				attribute distance : [nullCoalescingExpression];
				attribute tpd_avg : [nullCoalescingExpression];
				attribute bsfc : [nullCoalescingExpression];
				attribute f_a : [nullCoalescingExpression];
				attribute f_b : [nullCoalescingExpression];
				return out attribute calculatedFuelEconomy :> : [nullCoalescingExpression];
			}
		}
		package ElectricalPowerAnalysis {}
		package ReliabilityAnalyis {}
		package VehicleTradeOffAnalysis {
			comment about \* The following example provides the rationale for selecting the engine4cyl. 
The rationale and risk are contained in a metadata library. *\
			@ModelingMetadata::Rationale : about vehicle_b_engine4cyl{
				:>> ModelingMetadata::explanation : [nullCoalescingExpression];
				:>> ModelingMetadata::text : [nullCoalescingExpression];
			}
			@RiskMetadata::Risk : about vehicle_b_engine4cyl{
				:>> totalRisk : [nullCoalescingExpression];
				:>> technicalRisk : [nullCoalescingExpression];
				:>> scheduleRisk : [nullCoalescingExpression];
				:>> costRisk : [nullCoalescingExpression];
			}
			@RiskMetadata::Risk : about fuelEfficiency{
				:>> technicalRisk {
					:>> probability : [nullCoalescingExpression];
					:>> impact : [nullCoalescingExpression];
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
				part vehicle_b_engine4cyl :> {
					part engine :>> {
						part cylinders [4] :>>;
						attribute mass :>> : [OperatorExpression];
						attribute peakHorsePower :>> : [OperatorExpression];
						attribute fuelEfficiency :>> : [nullCoalescingExpression];
						attribute cost :>> : [nullCoalescingExpression];
					}
				}
				part vehicle_b_engine6cyl :> {
					part engine :>> {
						part cylinders [6] :>>;
						attribute mass :>> : [OperatorExpression];
						attribute peakHorsePower :>> : [OperatorExpression];
						attribute fuelEfficiency :>> : [nullCoalescingExpression];
						attribute cost :>> : [nullCoalescingExpression];
					}
				}
				requirement {
					subject :>> null;
					out ref :>> null;
				}
				comment about \* Select vehicle alternative with the engine whose evaluation function returns the max value*\
				calc :> evaluationFunction {
					part vehicle :>;
					return out attribute eval : ScalarValues::Real : [nullCoalescingExpression];
				}
				calc :> evaluationFunction {
					part vehicle :>;
					return out attribute eval : ScalarValues::Real : [nullCoalescingExpression];
				}
				return out part selectedVehicle :>;
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
				subject :>> subj;
				requirement {
					subject :>> subj;
					out ref :>> null;
				}
				out ref :>> verdict;
			}
			verification def AccelerationTest {
				subject :>> subj;
				requirement {
					subject :>> subj;
					out ref :>> null;
				}
				out ref :>> verdict;
			}
			verification def ReliabilityTest {
				subject :>> subj;
				requirement {
					subject :>> subj;
					out ref :>> null;
				}
				out ref :>> verdict;
			}
		}
		package VerificationCases1 {
			[prefixMetadata] verification massTests : MassTest {
				subject vehicle_uut :>;
				part vehicleVerificationSubSystem_1 : [nullCoalescingExpression];
				requirement {
					subject :>>;
					requirement {
						subject :>>;
						:>> : [nullCoalescingExpression];
						out ref :>>;
					}
					out ref :>>;
				}
				action weighVehicle {
					massMeasured :> mass;
				}
				first weighVehicle then evaluatePassFail;
				action evaluatePassFail {
					massMeasured :> mass;
					verdict : [nullCoalescingExpression];
				}
				flow weighVehicle.massMeasured to evaluatePassFail.massMeasured;
				out ref :>> : [nullCoalescingExpression];
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
					attribute t0 :>> : [OperatorExpression];
					snapshot occurrence t0_r : Road_1 {
						:>> : [nullCoalescingExpression];
						:>> : [nullCoalescingExpression];
					}
					snapshot occurrence t0_v : Vehicle_1 {
						:>> : [OperatorExpression];
						:>> : [OperatorExpression];
						:>> : [OperatorExpression];
						snapshot occurrence t0_fa : FrontAxleAssembly_1 {
							snapshot occurrence t0_leftFront : Wheel_1;
							snapshot occurrence t0_rightFront : Wheel_2;
						}
					}
				}
				snapshot occurrence t1_a {
					attribute t1 :>> : [OperatorExpression];
					snapshot occurrence t1_r : Road_1 {
						:>> : [nullCoalescingExpression];
						:>> : [nullCoalescingExpression];
					}
					snapshot occurrence t1_v : Vehicle_1 {
						:>> : [OperatorExpression];
						:>> : [OperatorExpression];
						:>> : [OperatorExpression];
						snapshot occurrence t1_fa : FrontAxleAssembly_1 {
							snapshot occurrence t1_leftFront : Wheel_1;
							snapshot occurrence t1_rightFront : Wheel_2;
						}
					}
				}
				snapshot occurrence t2_a {
					attribute t2 :>> : [OperatorExpression];
					snapshot occurrence t2_r : Road_1 {
						:>> : [nullCoalescingExpression];
						:>> : [nullCoalescingExpression];
					}
					snapshot occurrence t2_v : Vehicle_1 {
						:>> : [OperatorExpression];
						:>> : [OperatorExpression];
						:>> : [OperatorExpression];
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
				exhibit state driverStates;
			}
			part def Passenger;
			requirement transportRequirements {
				subject :>> Requirements::null;
				out ref :>> Requirements::null;
			}
			use case def TransportPassenger {
				requirement TransportObjective {
					subject :>> UseCases::null;
					doc \* deliver passenger to destination safely, comfortably, and within acceptable time*\
					constraint {
						out ref :>>;
					}
					out ref :>> UseCases::null;
				}
				subject vehicle : Vehicle;
				part environment;
				part road;
				part driver;
				part passenger [0];
				include use case getInVehicle_a [1] {
					subject :>>;
					requirement {
						subject :>> Requirements::null;
						out ref :>>;
					}
					out ref :>>;
				}
				include use case getOutOfVehicle_a [1] {
					subject :>>;
					requirement {
						subject :>> Requirements::null;
						out ref :>>;
					}
					out ref :>>;
				}
				out ref :>> UseCases::null;
			}
			use case getInVehicle {
				subject :>>;
				action unlockDoor_in [0];
				first unlockDoor_in then openDoor_in;
				action openDoor_in :> Actions::subactions;
				first openDoor_in then enterVehicle;
				action enterVehicle :> Actions::subactions;
				first enterVehicle then closeDoor_in;
				action closeDoor_in :> Actions::subactions;
				requirement {
					subject :>>;
					out ref :>>;
				}
				out ref :>>;
			}
			use case def GetInVehicle {
				subject vehicle : Vehicle;
				part driver [0];
				part passenger [0];
				assert constraint {
					out ref :>> Constraints::null;
				}
				requirement {
					subject :>> UseCases::null;
					out ref :>> UseCases::null;
				}
				out ref :>> UseCases::null;
			}
			use case getOutOfVehicle {
				subject :>>;
				action openDoor_out :> Actions::subactions;
				first openDoor_out then exitVehicle;
				action exitVehicle :> Actions::subactions;
				first exitVehicle then closeDoor_out;
				action closeDoor_out :> Actions::subactions;
				first closeDoor_out then lockDoor_out;
				action lockDoor_out :> Actions::subactions;
				requirement {
					subject :>>;
					out ref :>>;
				}
				out ref :>>;
			}
			use case def GetOutOfVehicle {
				subject vehicle : Vehicle;
				part driver [0];
				part passenger [0];
				assert constraint {
					out ref :>> Constraints::null;
				}
				requirement {
					subject :>> UseCases::null;
					out ref :>> UseCases::null;
				}
				out ref :>> UseCases::null;
			}
		}
		package TransportPassengerScenario {
			public import TransportPassenger;
			use case transportPassenger {
				subject :>>;
				public first UseCases::start;
				first start then a {
					end ref;
				}
				action a {
					action driverGetInVehicle [1] :>;
					action passenger1GetInVehicle [1] :>;
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
					action driverGetOutOfVehicle [1] :>;
					action passenger1GetOutOfVehicle [1] :>;
				}
				first c then done {
					end ref;
				}
				requirement {
					subject :>>;
					out ref :>>;
				}
				out ref :>>;
			}
			use case transportPassenger_1 {
				subject :>>;
				action driverGetInVehicle [1] :>;
				action passenger1GetInVehicle [1] :>;
				action driverGetOutOfVehicle [1] :>;
				action passenger1GetOutOfVehicle [1] :>;
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
					end ref;
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
					end ref;
				}
				requirement {
					subject :>>;
					out ref :>>;
				}
				out ref :>>;
			}
		}
		part missionContext : MissionContext {
			[prefixMetadata] attribute transportTime;
			perform transportPassenger;
			part road : Road : [nullCoalescingExpression];
			part driver : Driver : [nullCoalescingExpression] {
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
			part passenger1 : Passenger : [nullCoalescingExpression] {
				perform transportPassenger.a.passenger1GetInVehicle.unlockDoor_in;
				perform transportPassenger.a.passenger1GetInVehicle.openDoor_in;
				perform transportPassenger.a.passenger1GetInVehicle.enterVehicle;
				perform transportPassenger.a.passenger1GetInVehicle.closeDoor_in;
				perform transportPassenger.c.passenger1GetOutOfVehicle.openDoor_out;
				perform transportPassenger.c.passenger1GetOutOfVehicle.exitVehicle;
				perform transportPassenger.c.passenger1GetOutOfVehicle.closeDoor_out;
				perform transportPassenger.c.passenger1GetOutOfVehicle.lockDoor_out;
			}
			part vehicle_b_1 :> : [nullCoalescingExpression] {
				attribute :>> position3dVector : [OperatorExpression];
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
				assert constraint selectionConstraint {
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
			public filter [OperatorExpression];
		}
		package SecurityGroup {
			comment about \* Parts that contribute to security. *\
			public import vehicle_b;
			public filter [OperatorExpression];
		}
		package SafetyandSecurityGroup {
			comment about \* Parts that contribute to safety OR security. *\
			public import vehicle_b;
			public filter [OperatorExpression];
		}
		package MandatorySafetyGroup {
			comment about \* Parts that contribute to safety AND are mandatory. *\
			public import vehicle_b;
			public filter [OperatorExpression];
		}
	}
	package Views_Viewpoints {
		package ViewpointDefinitions {
			viewpoint def BehaviorViewpoint {
				subject :>> Views::subj;
				out ref :>> Views::null;
			}
			viewpoint def SafetyViewpoint {
				subject :>> Views::subj;
				concern vs {
					subject :>> Requirements::null;
					out ref :>>;
				}
				out ref :>> Views::null;
			}
			part def SafetyEngineer;
			concern def VehicleSafety {
				subject :>> Requirements::null;
				doc \* identify system safety features *\
				part se : SafetyEngineer;
				out ref :>> Requirements::null;
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
				public filter [OperatorExpression];
			}
			view def PartsInterconnection;
		}
		package VehicleViews {
			public import ViewpointDefinitions;
			public import ViewDefinitions;
			public import VehicleConfiguration_b;
			view vehiclePartsTree_Safety : PartsTreeView {
				satisfy requirement sv {
					subject :>>;
					out ref :>>;
				}
				protected expose PartsTree;
				public filter [OperatorExpression];
			}
		}
	}
}

