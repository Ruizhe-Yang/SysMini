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
				attribute maintenanceTime : Base::dataValues;
				attribute brakePedalDepressed : Base::dataValues;
				port ignitionCmdPort : Ports::ports;
				port pwrCmdPort : Ports::ports;
				port vehicleToRoadPort : Ports::ports;
				port statusPort : Ports::ports;
				perform action providePower :> Parts::performedActions;
				perform action provideBraking :> Parts::performedActions;
				perform action controlDirection :> Parts::performedActions;
				perform action performSelfTest :> Parts::performedActions;
				perform action applyParkingBrake :> Parts::performedActions;
				perform action senseTemperature :> Parts::performedActions;
				exhibit state vehicleStates :> Parts::exhibitedStates parallel;
			}
			part def Engine {
				attribute mass :> mass;
				attribute peakHorsePower :> power;
				attribute fuelEfficiency : Base::dataValues;
				attribute cost : Base::dataValues;
				attribute displacement :> volume;
				port engineControlPort :> Ports::ports = ~ControlPort;
				port fuelInPort :> Ports::ports = ~FuelPort;
				port fuelCmdPort : Ports::ports;
				port drivePwrPort : Ports::ports;
				port ignitionCmdPort : Ports::ports;
				port flyWheelPort :> Ports::ports;
				perform action generateTorque :> Parts::performedActions;
				exhibit state engineStates :> Parts::exhibitedStates;
			}
			part def StarterMotor {
				port gearPort : Ports::ports;
			}
			part def Cylinder;
			part def Transmission {
				attribute gearRatio : Base::dataValues;
				port clutchPort :> Ports::ports = ~DrivePwrPort;
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
				port shankCompositePort : Ports::ports;
			}
			part def Differential;
			part def Wheel {
				attribute diameter : Base::dataValues;
				port lugNutCompositePort : Ports::ports;
			}
			part def Hub {
				port shankCompositePort : Ports::ports;
			}
			abstract part def Software;
			part def VehicleSoftware;
			part def VehicleController {
				port controlPort : Ports::ports;
				exhibit state controllerStates :> Parts::exhibitedStates parallel;
			}
			part def CruiseController {
				port setSpeedPort :> Ports::ports = ~SetSpeedPort;
				port speedSensorPort :> Ports::ports = ~SpeedSensorPort;
				port cruiseControlPort : Ports::ports;
				exhibit state cruiseControllerStates :> Parts::exhibitedStates;
			}
			part def SpeedSensor {
				port speedSensorPort : Ports::ports;
			}
			part def FuelTank {
				attribute mass :> mass;
				item fuel : Items::items {
					attribute :>> fuelMass;
				}
				attribute fuelKind : Base::dataValues;
				attribute fuelMassMax :> mass;
				assert constraint fuelConstraint :> Constraints::assertedConstraintChecks {
					fuel.fuelMass <= fuelMassMax;
				}
				port fuelOutPort : Ports::ports;
				port fuelInPort :> Ports::ports = ~FuelPort;
			}
			part def BodyAssy;
			part def Body {
				attribute color : Base::dataValues;
			}
			part def Thermostat;
			part def WaterHose;
			part def Road {
				attribute incline : Base::dataValues;
				attribute friction : Base::dataValues;
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
				item ignitionCmd : Items::items;
			}
			port def StatusPort;
			port def GearPort;
			port def PwrCmdPort {
				item pwrCmd : Items::items;
			}
			port def FuelCmdPort {
				item fuelCmd : pwrCmd;
			}
			port def FuelPort {
				out item fuel : Items::items;
			}
			port def DrivePwrPort {
				torque : Base::dataValues;
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
				port lugNutPort [*] : Ports::subports;
			}
			port def ShankCompositePort {
				port shankPort [*] : Ports::subports;
			}
			port def LugNutPort {
				attribute threadDia :> Base::dataValues;
				attribute threadPitch :> Base::dataValues;
			}
			port def ShankPort {
				attribute threadDia :> Base::dataValues;
				attribute threadPitch :> Base::dataValues;
				attribute shaftLength :> Base::dataValues;
			}
			port def VehicleToRoadPort;
			port def ControlPort;
			port def CruiseControlPort;
			port def SpeedSensorPort;
			port def SetSpeedPort;
			port def DriverCmdPort {
				out item driverCmd [*] : Items::items;
			}
			port def HandPort {
				out item ignitionCmd : driverCmd;
				out item pwrCmd : driverCmd;
			}
		}
		package ItemDefinitions {
			item def PwrCmd {
				attribute throttleLevel : Base::dataValues;
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
				attribute ignitionOnOff : Base::dataValues;
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
				end port p1 : Interfaces::source;
				end port p2 :>> Interfaces::target = ~DrivePwrPort;
				flow :> Connections::flowConnections p1.torque to p2.torque;
			}
			interface def FuelInterface {
				end port fuelOutPort : Interfaces::source;
				end port fuelInPort :>> Interfaces::target = ~FuelPort;
				flow :> Connections::flowConnections of Fuelfrom fuelOutPort.fuel to fuelInPort.fuel;
			}
			interface def WheelFastenerInterface {
				end port lugNutPort : Interfaces::source;
				end port shankPort : Interfaces::target;
				attribute maxTorque : Base::dataValues;
				{
					lugNutPort.threadDia == shankPort.threadDia;
				}
			}
			interface def WheelHubInterface {
				end port lugNutCompositePort : Interfaces::source;
				end port shankCompositePort : Interfaces::target;
				interface wheelFastenerInterface [5] : Interfaces::binaryInterfaces connect lugNutCompositePort.lugNutPort to shankCompositePort.shankPort;
			}
		}
		package AllocationDefinitions {
			allocation def LogicalToPhysical {
				end #logical logicalEnd :>> logicalOccurrences;
				end #physical physicalEnd :>> physicalOccurrences;
			}
		}
		package ActionDefinitions {
			action def ProvidePower {
				item pwrCmd : Items::items;
				wheelToRoadTorque [2] : Base::dataValues;
			}
			action def GenerateTorque {
				item fuelCmd : Items::items;
				engineTorque : Base::dataValues;
			}
			action def AmplifyTorque {
				engineTorque : Base::dataValues;
				transmissionTorque : Base::dataValues;
			}
			action def TransferTorque {
				transmissionTorque : Base::dataValues;
				driveshaftTorque : Base::dataValues;
			}
			action def DistributeTorque {
				driveshaftTorque : Base::dataValues;
				wheelToRoadTorque [2] : Base::dataValues;
			}
			action def PerformSelfTest;
			action def ApplyParkingBrake;
			action def SenseTemperature {
				temp : Base::dataValues;
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
				requirement {
					massActual <= massRequired;
				}
			}
			requirement def ReliabilityRequirement {
				subject :>> Requirements::subj;
				doc \* The actual reliability shall be greater than the required reliability*\
				attribute reliabilityRequired : Base::dataValues;
				attribute reliabilityActual : Base::dataValues;
				requirement {
					reliabilityActual >= reliabilityRequired;
				}
			}
			requirement def TorqueGenerationRequirement {
				doc \* The engine shall generate torque as a function of RPM as shown in Table 1. *\
				subject generateTorque : Occurrences::occurrences;
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
				requirement {
					actualFuelEconomy >= requiredFuelEconomy;
				}
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
				enum black :> Colors;
				enum grey :> Colors;
				enum red :> Colors;
			}
			enum def {
				enum :> DiameterChoices = 60[SI::millimetre];
				enum :> DiameterChoices = 80[SI::millimetre];
				enum :> DiameterChoices = 100[SI::millimetre];
			}
			attribute cylinderDiameter : Base::dataValues = 80[SI::millimetre];
			enum def {
				enum on :> IgnitionOnOff;
				enum off :> IgnitionOnOff;
			}
			enum def {
				enum gas :> FuelKind;
				enum diesel :> FuelKind;
			}
			distancePerVolume :> scalarQuantities = ISQSpaceTime::distance/ISQSpaceTime::volume;
			timePerDistance :> scalarQuantities = ISQBase::duration/ISQSpaceTime::distance;
			volumePerDistance :> scalarQuantities = ISQSpaceTime::volume/ISQSpaceTime::distance;
			volumePerTime :> scalarQuantities = ISQSpaceTime::volume/ISQBase::duration;
			kpl : Base::dataValues = SI::kilometre/SI::litre;
			rpm : Base::dataValues = 1/SI::minute;
			kW : Base::dataValues = SIPrefixes::kilo*SI::watt;
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
				attribute isMandatory : Base::dataValues;
			}
			metadata def Security;
		}
		package KeyWord_MetadataDefinitions {
			public import Metaobjects::null::*;
			state failureModes [*] :> States::stateActions;
			metadata def <fm> failureMode {
				:>> Metaobjects::baseType = failureModes meta SysML::StateUsage;
			}
			occurrence logicalOccurrences [*] :> Occurrences::occurrences;
			metadata def <l> logical {
				:>> Metaobjects::baseType = logicalOccurrences meta SysML::Usage;
			}
			occurrence physicalOccurrences [*] :> Occurrences::occurrences;
			metadata def <p> physical {
				:>> Metaobjects::baseType = physicalOccurrences meta SysML::Usage;
			}
		}
		package GenericContext {
			part def Context {
				attribute time : Base::dataValues;
				attribute spatialCF [1] : Base::dataValues {
					:>> null = (SI::metre,SI::metre,SI::metre);
				}
				attribute velocityCF [1] : Base::dataValues = spatialCF/SI::second;
				attribute accelarationCF [1] : Base::dataValues = velocityCF/SI::second;
			}
		}
	}
	package VehicleLogicalConfiguration {
		package PartsTree {
			#logical part vehicleLogical : Parts::parts {
				part torqueGenerator : Items::subparts {
					action generateTorque :> Parts::ownedActions;
				}
				part electricalGenerator : Items::subparts {
					action generateElectricity :> Parts::ownedActions;
				}
				part steeringSystem : Items::subparts;
				part brakingSubsystem : Items::subparts;
			}
		}
	}
	package VehicleLogicalToPhysicalAllocation {
		public import PartsTree::**;
		public import PartsTree::*;
		allocation vehicleLogicalToPhysicalAllocation : Allocations::allocations allocate vehicleLogical to vehicle_b {
			allocate vehicleLogical.torqueGenerator to vehicle_b.engine {
				allocate vehicleLogical.torqueGenerator.generateTorque to vehicle_b.engine.generateTorque;
			}
			allocate vehicleLogical.electricalGenerator to vehicle_b.engine {
				allocate vehicleLogical.electricalGenerator.generateElectricity to vehicle_b.engine.alternator.generateElectricity;
			}
		}
	}
	package VehicleConfigurations {
		package VehicleConfiguration_a {
			package PartsTree {
				part vehicle_a : Parts::parts {
					attribute mass :>> mass = dryMass + cargoMass + fuelTank;
					attribute dryMass :>> dryMass = NumericalFunctions::sum(NumericalFunctions::collection=partMasses);
					attribute :>> cargoMass = 0[SI::kilogram];
					attribute partMasses [*] :> mass;
					part fuelTank : Items::subparts {
						attribute :>> mass = 75[SI::kilogram];
						item :>> fuel {
							attribute :>> fuelMass = 50[SI::kilogram];
						}
					}
					part frontAxleAssembly : Items::subparts {
						attribute mass :> mass = 800[SI::kilogram];
						part frontAxle : Items::subparts;
						part frontWheels [2] : Items::subparts;
					}
					part rearAxleAssembly : Items::subparts {
						attribute mass :> mass = 875[SI::kilogram];
						attribute driveTrainEfficiency : Base::dataValues = 0.6;
						part rearAxle : Items::subparts;
						part rearWheels [2] : Items::subparts {
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
				part vehicle_b : Parts::parts {
					#ParametersOfInterestMetadata::MeasureOfPerformance attribute mass :>> ParametersOfInterestMetadata::measuresOfPerformance = dryMass + cargoMass + fuelTank;
					attribute dryMass :>> dryMass = NumericalFunctions::sum(NumericalFunctions::collection=partMasses);
					attribute :>> cargoMass default 0[SI::kilogram];
					attribute partMasses :> Base::dataValues = (fuelTank.mass,frontAxleAssembly.mass,rearAxleAssembly.mass,engine.mass,transmission.mass,driveshaft.mass);
					attribute avgFuelEconomy :> distancePerVolume;
					port fuelCmdPort : pwrCmdPort {
						item fuelCmd :>> pwrCmd;
					}
					port setSpeedPort :> Ports::ports = ~SetSpeedPort;
					port vehicleToRoadPort :>> vehicleToRoadPort {
						port wheelToRoadPort1 : Ports::subports;
						port wheelToRoadPort2 : Ports::subports;
					}
					perform providePower;
					perform performSelfTest;
					perform applyParkingBrake;
					perform senseTemperature;
					exhibit state vehicleStates :>> vehicleStates;
					item [1] :> ShapeItems::RectangularCuboid {
						length1 :>> ShapeItems::null = 4800[SI::millimetre];
						width1 :>> ShapeItems::null = 1840[SI::millimetre];
						height1 :>> ShapeItems::null = 1350[SI::millimetre];
					}
					part fuelTank : Items::subparts {
						attribute :>> mass = 75[SI::kilogram];
						item :>> fuel {
							attribute :>> fuelMass = 60[SI::kilogram];
						}
						attribute :>> fuelMassMax = 60[SI::kilogram];
					}
					part frontAxleAssembly : Items::subparts {
						attribute mass :> mass = 800[SI::kilogram];
						port shaftPort_d : Ports::ports;
						part frontAxle : Items::subparts;
						part frontWheels [2] : Items::subparts;
					}
					part rearAxleAssembly : Items::subparts {
						attribute mass :> mass = 875[SI::kilogram];
						attribute driveTrainEfficiency : Base::dataValues = 0.6;
						port shaftPort_d : Ports::ports;
						perform Parts::performedActions;
						part rearWheel1 : Items::subparts {
							attribute :>> diameter;
							port wheelToRoadPort : Ports::ports;
							port lugNutCompositePort :>> lugNutCompositePort {
								port lugNutPort [5] :>> lugNutPort;
							}
						}
						part rearWheel2 : Items::subparts {
							attribute :>> diameter;
							port wheelToRoadPort : Ports::ports;
							port lugNutCompositePort :>> lugNutCompositePort {
								port lugNutPort [5] :>> lugNutPort;
							}
						}
						part differential : Items::subparts {
							port shaftPort_d : Ports::ports;
							port leftDiffPort : Ports::ports;
							port rightDiffPort : Ports::ports;
						}
						part rearAxle :> Items::subparts {
							part leftHalfAxle : Items::subparts {
								port leftAxleToDiffPort : Ports::ports;
								port shankCompositePort :>> shankCompositePort {
									port shankPort [5] :>> shankPort;
								}
							}
							part rightHalfAxle : Items::subparts {
								port rightAxleToDiffPort : Ports::ports;
								port shankCompositePort :>> shankCompositePort {
									port shankPort [5] :>> shankPort;
								}
							}
						}
						bind shaftPort_d = differential.shaftPort_d;
						:> Connections::binaryConnections connect differential.leftDiffPort to rearAxle.leftHalfAxle.leftAxleToDiffPort;
						:> Connections::binaryConnections connect differential.rightDiffPort to rearAxle.rightHalfAxle.rightAxleToDiffPort;
						interface wheelToleftHalAxleInterface : Interfaces::binaryInterfaces connect rearWheel1.lugNutCompositePort[1] to rearAxle.leftHalfAxle.shankCompositePort[1];
						interface wheelTorightHalAxleInterface : Interfaces::binaryInterfaces connect rearWheel2.lugNutCompositePort[1] to rearAxle.rightHalfAxle.shankCompositePort[1];
					}
					part starterMotor : Items::subparts;
					part engine : Items::subparts {
						perform generateTorque;
						part cylinders [4..6] : Items::subparts;
						part alternator :> Items::subparts {
							action generateElectricity :> Parts::ownedActions;
						}
						satisfy Requirements::satisfiedRequirementChecks by vehicle_b.engine {
							requirement torqueGenerationRequirement :>> torqueGenerationRequirement {
								subject generateTorque :>> generateTorque = vehicle_b;
							}
							requirement drivePowerOuputRequirement :>> drivePowerOutputRequirement {
								subject :>> Requirements::subj;
								port torqueOutPort :>> torqueOutPort = vehicle_b;
							}
						}
					}
					part transmission : Items::subparts {
						attribute mass :> mass = 100[SI::kilogram];
						port shaftPort_a : Ports::ports;
						perform Parts::performedActions;
					}
					part driveshaft : Items::subparts {
						attribute mass :> mass = 100[SI::kilogram];
						port shaftPort_b : Ports::ports;
						port shaftPort_c : Ports::ports;
						perform Parts::performedActions;
					}
					part vehicleSoftware : Items::subparts {
						part vehicleController : Items::subparts {
							exhibit state controllerStates :>> controllerStates;
							part cruiseController : Items::subparts;
						}
					}
					part speedSensor : Items::subparts;
					part bodyAssy : Items::subparts {
						part body : Items::subparts {
							attribute :>> color = red;
						}
						#Safety part bumper :> Items::subparts;
						#Security part keylessEntry :> Items::subparts;
					}
					part interior :> Items::subparts {
						#Security part alarm :> Items::subparts;
						#Safety part seatBelt [2] :> Items::subparts;
						part frontSeat [2] :> Items::subparts;
						#Safety part driverAirBag :> Items::subparts;
					}
					bind engine.fuelCmdPort = fuelCmdPort;
					interface engineToTransmissionInterface : Interfaces::binaryInterfaces connect engine.drivePwrPort to transmission.clutchPort;
					interface fuelInterface : Interfaces::binaryInterfaces connect fuelTank.fuelOutPort to engine.fuelInPort;
					allocate providePower.generateToAmplify to engineToTransmissionInterface;
					bind engine.ignitionCmdPort = ignitionCmdPort;
					:> Connections::binaryConnections connect starterMotor.gearPort to engine.flyWheelPort;
					:> Connections::binaryConnections connect vehicleSoftware.vehicleController.controlPort to engine.engineControlPort;
					bind vehicle_b.setSpeedPort = vehicleSoftware.vehicleController.cruiseController.setSpeedPort;
					:> Connections::binaryConnections connect speedSensor.speedSensorPort to vehicleSoftware.vehicleController.cruiseController.speedSensorPort;
					bind vehicleSoftware.vehicleController.cruiseController.cruiseControlPort = vehicleSoftware.vehicleController.controlPort;
					:> Connections::binaryConnections connect transmission.shaftPort_a to driveshaft.shaftPort_b;
					:> Connections::binaryConnections connect driveshaft.shaftPort_c to rearAxleAssembly.shaftPort_d;
					bind rearAxleAssembly.rearWheel1.wheelToRoadPort = vehicleToRoadPort.wheelToRoadPort1;
					bind rearAxleAssembly.rearWheel2.wheelToRoadPort = vehicleToRoadPort.wheelToRoadPort2;
					satisfy Requirements::satisfiedRequirementChecks by vehicle_b {
						requirement vehicleMassRequirement :>> vehicleMassRequirement {
							subject :>> Requirements::subj;
							attribute :>> massActual = vehicle_b.mass;
							attribute :>> fuelMassActual = vehicle_b;
						}
					}
				}
			}
			package ActionTree {
				action providePower : Actions::actions {
					item fuelCmd : pwrCmd;
					wheelToRoadTorque [2] :>> wheelToRoadTorque = distributeTorque.wheelToRoadTorque;
					action generateTorque : Actions::subactions {
						item :>> fuelCmd = providePower.fuelCmd;
					}
					action amplifyTorque : Actions::subactions;
					action transferTorque : Actions::subactions;
					action distributeTorque : Actions::subactions;
					flow generateToAmplify :> Connections::flowConnections generateTorque.engineTorque to amplifyTorque.engineTorque;
					flow :> Connections::flowConnections amplifyTorque.transmissionTorque to transferTorque.transmissionTorque;
					flow :> Connections::flowConnections transferTorque.driveshaftTorque to distributeTorque.driveshaftTorque;
				}
				action performSelfTest : Actions::actions;
				action applyParkingBrake : Actions::actions;
				action senseTemperature : Actions::actions;
			}
			package DiscreteInteractions {
				package Sequence {
					part def Driver {
						port p1 :> Ports::ports;
						port p2 :> Ports::ports;
					}
					part part0 :> Parts::parts {
						perform action startVehicle :> Parts::performedActions {
							action turnVehicleOn :> Actions::sendSubactions send ignitionCmd via driver.p1 {
								ignitionCmd : Objects::objects;
							}
							{
								ignitionCmd : Objects::objects;
								ref :>> Transfers::receiver = vehicle.ignitionCmdPort;
							}
							flow :> Connections::flowConnections of IgnitionCmdfrom trigger1.ignitionCmd to startEngine.ignitionCmd;
							action startEngine :> Actions::subactions {
								item ignitionCmd : Items::items;
								out item es : Items::items;
							}
							flow :> Connections::flowConnections of EngineStatusfrom startEngine.es to sendStatus.es;
							action sendStatus :> Actions::sendSubactions send es via vehicle.statusPort {
								es : Objects::objects;
							}
							{
								es : Objects::objects;
								ref :>> Transfers::receiver = driver.p2;
							}
						}
						part driver : Items::subparts {
							perform Parts::performedActions;
							perform Parts::performedActions;
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						part vehicle : Items::subparts {
							perform Parts::performedActions;
							perform Parts::performedActions;
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						first vehicle.doorClosed then driver.driverReady;
						message :> Connections::messageConnections of IgnitionCmdfrom driver.Parts::performedActions to vehicle.Parts::performedActions;
						message :> Connections::messageConnections of EngineStatusfrom vehicle.Parts::performedActions to driver.Parts::performedActions;
					}
				}
				occurrence CruiseControl1 :> Occurrences::occurrences {
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
										event occurrence = vehicle_b;
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
						message sendSensedSpeed :> Connections::messageConnections of SensedSpeedfrom speedSensor.speedSensorPort.sensedSpeedSent to vehicleSoftware.vehicleController.cruiseController.speedSensorPort.sensedSpeedReceived;
						message sendFuelCmd :> Connections::messageConnections of FuelCmdfrom vehicleSoftware.vehicleController.cruiseController.cruiseControlPort.fuelCmdSent to engine.fuelCmdPort.fuelCmdReceived;
					}
				}
				occurrence CruiseControl2 :> Occurrences::occurrences {
					part vehicle_b :> vehicle_b {
						port :>> setSpeedPort {
							event occurrence :> Occurrences::timeEnclosedOccurrences;
						}
						part :>> speedSensor {
							port :>> speedSensorPort {
								event Occurrences::timeEnclosedOccurrences;
							}
						}
						part :>> vehicleSoftware {
							part :>> vehicleController {
								part :>> cruiseController {
									port :>> setSpeedPort {
										event occurrence = vehicle_b;
									}
									port :>> speedSensorPort {
										event occurrence = setSpeedPort.setSpeedReceived;
										first setSpeedReceived then done {
											end ref :>> Occurrences::laterOccurrence;
										}
										event Occurrences::timeEnclosedOccurrences;
									}
									port :>> cruiseControlPort {
										event Occurrences::timeEnclosedOccurrences;
									}
								}
							}
						}
						part :>> engine {
							port :>> fuelCmdPort {
								event Occurrences::timeEnclosedOccurrences;
							}
						}
						message sendSensedSpeed :> Connections::messageConnections of SensedSpeed;
						message sendFuelCmd :> Connections::messageConnections of FuelCmd;
					}
				}
			}
			package Requirements {
				public import RequirementDerivation::*;
				public import ModelingMetadata::*;
				item marketSurvey :> Items::items;
				dependency vehicleSpecification to marketSurvey;
				requirement vehicleSpecification :> Requirements::requirementChecks {
					subject vehicle : Objects::objects;
					requirement vehicleMassRequirement : Requirements::subrequirements {
						subject :>> Requirements::subj;
						doc \* The total mass of the vehicle shall be less than or equal to the required mass.
Assume total mass includes a full tank of gas of 60 kg*\
						attribute :>> massRequired = 2000[SI::kilogram];
						attribute :>> massActual default vehicle.dryMass + fuelMassActual;
						attribute fuelMassActual :> mass;
						attribute fuelMassMax :> mass = 60[SI::kilogram];
						assumption {
							fuelMassActual == fuelMassMax;
						}
					}
					allocate vehicleMassRequirement to vehicle_b.mass;
					requirement vehicleFuelEconomyRequirements :> Requirements::subrequirements {
						subject :>> Requirements::null;
						doc \* fuel economy requirements group *\
						attribute assumedCargoMass :> mass;
						requirement cityFuelEconomyRequirement : Requirements::subrequirements {
							subject :>> Requirements::subj;
							:>> requiredFuelEconomy = 10[SI::kilometre/SI::litre];
							assumption {
								assumedCargoMass <= 500[SI::kilogram];
							}
						}
						#ModelingMetadata::StatusInfo requirement highwayFuelEconomyRequirement : Requirements::subrequirements {
							subject :>> Requirements::subj;
							:>> requiredFuelEconomy = 12.75[SI::kilometre/SI::litre];
							assumption {
								assumedCargoMass <= 500[SI::kilogram];
							}
						}
					}
				}
				requirement engineSpecification :> Requirements::requirementChecks {
					subject engine1 : Objects::objects;
					requirement engineMassRequirement : Requirements::subrequirements {
						subject :>> Requirements::subj;
						doc \* The total mass of the engine shall be less than or equal to the required mass.*\
						attribute :>> massRequired = 200[SI::kilogram];
						attribute :>> massActual = engine1.mass;
					}
					requirement torqueGenerationRequirement : Requirements::subrequirements {
						subject generateTorque :>> generateTorque default engine1.generateTorque;
					}
					requirement drivePowerOutputRequirement : Requirements::subrequirements {
						subject :>> Requirements::subj;
						port torqueOutPort :> Ports::ports {
							torque : Base::dataValues;
						}
					}
				}
				#RequirementDerivation::DerivationMetadata :> Connections::binaryConnections {
					end #RequirementDerivation::OriginalRequirementMetadata :>> DerivationConnections::originalRequirements;
					end #RequirementDerivation::DerivedRequirementMetadata :>> DerivationConnections::derivedRequirements;
				}
			}
		}
		package Engine4Cyl_Variant {
			public import ModelingMetadata::*;
			part engine : Parts::parts {
				part cylinders [4..8] : Items::subparts;
			}
			part engine4Cyl :> engine {
				part [4] :>> cylinders;
				part cylinder1 [1] :> cylinders;
				part cylinder2 [1] :> cylinders;
				part cylinder3 [1] :> cylinders;
				part cylinder4 [1] :> cylinders;
			}
			#ModelingMetadata::Refinement dependency engine4Cyl to engine;
		}
		package WheelHubAssemblies {
			part wheelHubAssy1 :> Parts::parts {
				part wheel1 : Items::subparts {
					port :>> LugNutCompositePort {
						port lugNutPort [5] :>> lugNutPort;
					}
				}
				part hub1 : Items::subparts {
					port :>> ShankCompositePort {
						port shankPort [5] :>> shankPort;
					}
				}
				interface wheelHubInterface : Interfaces::binaryInterfaces connect wheel1.LugNutCompositePort[1] to hub1.ShankCompositePort[1];
			}
			part wheelHubAssy2 :> Parts::parts {
				part wheel1 : Items::subparts {
					port :>> LugNutCompositePort {
						port lugNutPort [5] :>> lugNutPort;
					}
				}
				part hub1 : Items::subparts {
					port :>> ShankCompositePort {
						port shankPort [5] :>> shankPort;
					}
				}
				interface wheelHubInterface : Interfaces::binaryInterfaces connect lugNutCompositePort ::> wheel1.LugNutCompositePort[1] to shankCompositePort ::> hub1.ShankCompositePort[1] {
					interface wheelFastenerInterface1 :> wheelFastenerInterface connect lugNutPort ::> lugNutCompositePort.lugNutPort[5] to shankPort ::> shankCompositePort.shankPort[5];
				}
			}
			part wheelHubAssy3 :> Parts::parts {
				part wheel1 : Items::subparts {
					port lugNutCompositePort :>> lugNutCompositePort {
						port lugNutPort [5] :>> lugNutPort {
							attribute :>> threadDia = 14[SI::millimetre];
							attribute :>> threadPitch = 1.5[SI::millimetre];
						}
						port lugNutPort1 [1] :> lugNutPort;
						port lugNutPort2 [1] :> lugNutPort;
						port lugNutPort3 [1] :> lugNutPort;
					}
				}
				part hub1 : Items::subparts {
					port shankCompositePort :>> shankCompositePort {
						port shankPort [5] :>> shankPort {
							attribute :>> threadDia = 14[SI::millimetre];
							attribute :>> threadPitch = 1.5[SI::millimetre];
							attribute :>> shaftLength = 70[SI::millimetre];
						}
						port shankPort1 [1] :> shankPort;
						port shankPort2 [1] :> shankPort;
						port shankPort3 [1] :> shankPort;
					}
				}
				interface wheelHubInterface : Interfaces::binaryInterfaces connect lugNutCompositePort ::> wheel1.lugNutCompositePort[1] to shankCompositePort ::> hub1.shankCompositePort[1] {
					interface wheelFastenerInterface1 :> wheelFastenerInterface connect lugNutPort ::> lugNutCompositePort.lugNutPort1 to shankPort ::> shankCompositePort.shankPort1 {
						attribute :>> maxTorque = 90*1.356[SI::newton*SI::metre];
					}
					interface wheelFastenerInterface2 :> wheelFastenerInterface connect lugNutPort ::> lugNutCompositePort.lugNutPort2 to shankPort ::> shankCompositePort.shankPort2 {
						attribute :>> maxTorque = 90*1.356[SI::newton*SI::metre];
					}
					interface wheelFastenerInterface3 :> wheelFastenerInterface connect lugNutPort ::> lugNutCompositePort.lugNutPort3 to shankPort ::> shankCompositePort.shankPort3 {
						attribute :>> maxTorque = 90*1.356[SI::newton*SI::metre];
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
				attribute wayPoint [1..*] :> Base::dataValues {
					attribute elapseTime [1] :> duration;
					attribute position [1] :> distance;
				}
			}
			calc def FuelConsumption {
				bestFuelConsumption : Base::dataValues;
				idlingFuelConsumption : Base::dataValues;
				tpd_avg :> timePerDistance;
				attribute f = bestFuelConsumption + idlingFuelConsumption*tpd_avg;
				return out dpv :> Calculations::null = 1/f;
			}
			calc def AverageTravelTimePerDistance {
				scenario : Base::dataValues;
				return out tpd_avg :> Calculations::null;
			}
			calc def TraveledDistance {
				scenario : Base::dataValues;
				return out distance :> Calculations::null;
			}
			calc def IdlingFuelConsumptionPerTime {
				engine : Objects::objects;
				attribute idlingFuelConsumptionPerDisplacement : Base::dataValues = 0.5;
				return out f_a : Base::dataValues = engine.displacement*idlingFuelConsumptionPerDisplacement;
			}
			attribute specificGravityOfGasoline : Base::dataValues = 0.76;
			calc def BestFuelConsumptionPerDistance {
				mass : Base::dataValues;
				bsfc : Base::dataValues;
				tpd_avg :> timePerDistance;
				distance :> length;
				attribute required_power_avg :> power;
				{
					required_power_avg == 1/2*mass*tpd_avg**(-3)/distance;
				}
				return out f_b : Base::dataValues = bsfc*specificGravityOfGasoline*required_power_avg*tpd_avg;
			}
			calc def ComputeBSFC {
				engine : Objects::objects;
			}
			analysis fuelEconomyAnalysis :> AnalysisCases::analysisCases {
				subject :>> AnalysisCases::null = vehicle_b;
				requirement fuelEconomyAnalysisObjective :>> AnalysisCases::null {
					subject :>> AnalysisCases::null;
					doc \* estimate the vehicle fuel economy*\
					requirement;
				}
				attribute scenario : Base::dataValues;
				attribute distance = TraveledDistance(scenario);
				attribute tpd_avg = AverageTravelTimePerDistance(scenario);
				attribute bsfc = ComputeBSFC(engine=vehicle_b.engine);
				attribute f_a = BestFuelConsumptionPerDistance(mass=vehicle_b.mass, bsfc, tpd_avg, distance);
				attribute f_b = IdlingFuelConsumptionPerTime(engine=vehicle_b.engine);
				return out attribute calculatedFuelEconomy :> AnalysisCases::null = FuelConsumption(bestFuelConsumption=f_a, idlingFuelConsumption=f_b, tpd_avg);
			}
		}
		package ElectricalPowerAnalysis {}
		package ReliabilityAnalyis {}
		#RiskMetadata::Risk package VehicleTradeOffAnalysis {
			comment about \* The following example provides the rationale for selecting the engine4cyl. 
The rationale and risk are contained in a metadata library. *\
			public import TradeStudies::*;
			calc def EngineEvaluation {
				engineMass :> mass;
				enginePower :> power;
				engineFuelEfficiency : Base::dataValues;
				engineCost : Base::dataValues;
				return out eval : Base::dataValues;
			}
			calc def EngineEvaluation_4cyl {
				engineMass :> mass;
				enginePower :> power;
				engineFuelEfficiency : Base::dataValues;
				engineCost : Base::dataValues;
				return out eval : Base::dataValues;
			}
			calc def EngineEvaluation_6cyl {
				engineMass :> mass;
				enginePower :> power;
				engineFuelEfficiency : Base::dataValues;
				engineCost : Base::dataValues;
				return out eval : Base::dataValues;
			}
			analysis engineTradeOffAnalysis : AnalysisCases::analysisCases {
				subject vehicleAlternatives [2] :> studyAlternatives;
				part vehicle_b_engine4cyl :> vehicleAlternatives {
					part engine :>> engine {
						part cylinders [4] :>> cylinders;
						attribute mass :>> mass = 180[SI::kilogram];
						attribute peakHorsePower :>> peakHorsePower = 180[SI::watt];
						attribute fuelEfficiency :>> fuelEfficiency = 0.6;
						attribute cost :>> cost = 1000;
					}
				}
				part vehicle_b_engine6cyl :> vehicleAlternatives {
					part engine :>> engine {
						part cylinders [6] :>> cylinders;
						attribute mass :>> mass = 220[SI::kilogram];
						attribute peakHorsePower :>> peakHorsePower = 220[SI::watt];
						attribute fuelEfficiency :>> fuelEfficiency = 0.5;
						attribute cost :>> cost = 1500;
					}
				}
				comment about \* Select vehicle alternative with the engine whose evaluation function returns the max value*\
				calc :> evaluationFunction {
					part vehicle :> alternative;
					return out attribute eval : null = EngineEvaluation_4cyl(engineMass=vehicle, enginePower=vehicle, engineFuelEfficiency=vehicle, engineCost=vehicle);
				}
				calc :> evaluationFunction {
					part vehicle :> alternative;
					return out attribute eval : null = EngineEvaluation_6cyl(engineMass=vehicle, enginePower=vehicle, engineFuelEfficiency=vehicle, engineCost=vehicle);
				}
				return out part selectedVehicle :> selectedAlternative;
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
			}
			verification def AccelerationTest {
				subject :>> subj;
			}
			verification def ReliabilityTest {
				subject :>> subj;
			}
		}
		package VerificationCases1 {
			#VerificationCases::VerificationMethod verification massTests : verificationCases {
				subject vehicle_uut :> subj;
				part vehicleVerificationSubSystem_1 :> Cases::actors = verificationContext.massVerificationSystem;
				action weighVehicle :> Actions::subactions {
					massMeasured :> mass;
				}
				first weighVehicle then evaluatePassFail;
				action evaluatePassFail :> Actions::subactions {
					massMeasured :> mass;
					verdict :> Base::things = VerificationCases::PassIf(VerificationCases::isPassing=(vehicle_uut));
				}
				flow :> Connections::flowConnections weighVehicle.massMeasured to evaluatePassFail.massMeasured;
			}
		}
		package VerificationSystem {
			part verificationContext :> Parts::parts {
				perform Parts::performedActions;
				part vehicle_UnitUnderTest :> vehicle_b;
				part massVerificationSystem :> Items::subparts {
					part scale :> Items::subparts {
						perform Parts::performedActions;
					}
					part operator :> Items::subparts {
						perform Parts::performedActions;
					}
				}
			}
		}
	}
	package VehicleIndividuals {
		individual occurrence a : Occurrences::occurrences {
			occurrence t0_t2_a :> a {
				snapshot occurrence t0_a :> t0_t2_a {
					attribute t0 :>> time = 0[SI::second];
					snapshot occurrence t0_r : Occurrences::suboccurrences {
						:>> incline = 0;
						:>> friction = 0.1;
					}
					snapshot occurrence t0_v : Occurrences::suboccurrences {
						:>> position = 0[SI::metre];
						:>> velocity = 0[SI::metre];
						:>> acceleration = 1.96[SI::metre/SI::second**2];
						snapshot occurrence t0_fa : Occurrences::suboccurrences {
							snapshot occurrence t0_leftFront : Occurrences::suboccurrences;
							snapshot occurrence t0_rightFront : Occurrences::suboccurrences;
						}
					}
				}
				snapshot occurrence t1_a :> t0_t2_a {
					attribute t1 :>> time = 1[SI::second];
					snapshot occurrence t1_r : Occurrences::suboccurrences {
						:>> incline = 0;
						:>> friction = 0.1;
					}
					snapshot occurrence t1_v : Occurrences::suboccurrences {
						:>> position = 0.98[SI::metre];
						:>> velocity = 1.96[SI::metre/SI::second];
						:>> acceleration = 1.96[SI::metre/SI::second**2];
						snapshot occurrence t1_fa : Occurrences::suboccurrences {
							snapshot occurrence t1_leftFront : Occurrences::suboccurrences;
							snapshot occurrence t1_rightFront : Occurrences::suboccurrences;
						}
					}
				}
				snapshot occurrence t2_a :> t0_t2_a {
					attribute t2 :>> time = 2[SI::second];
					snapshot occurrence t2_r : Occurrences::suboccurrences {
						:>> incline = 0;
						:>> friction = 0.1;
					}
					snapshot occurrence t2_v : Occurrences::suboccurrences {
						:>> position = 3.92[SI::metre];
						:>> velocity = 3.92[SI::metre/SI::second];
						:>> acceleration = 1.96[SI::metre/SI::second**2];
						snapshot occurrence t2_fa : Occurrences::suboccurrences {
							snapshot occurrence t2_leftFront : Occurrences::suboccurrences;
							snapshot occurrence t2_rightFront : Occurrences::suboccurrences;
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
				port handPort : Ports::ports;
				exhibit state driverStates :> Parts::exhibitedStates;
			}
			part def Passenger;
			requirement transportRequirements :> Requirements::requirementChecks {
				subject :>> Requirements::null;
			}
			use case def TransportPassenger {
				requirement TransportObjective :>> UseCases::obj {
					subject :>> UseCases::null;
					doc \* deliver passenger to destination safely, comfortably, and within acceptable time*\
					requirement;
				}
				subject vehicle : Objects::objects;
				part environment :> Cases::actors;
				part road :> Cases::actors;
				part driver :> Cases::actors;
				part passenger [0..4] :> Cases::actors;
				include use case getInVehicle_a [1..5] :> getInVehicle {
					subject :>> vehicle;
				}
				include use case getOutOfVehicle_a [1..5] :> getOutOfVehicle {
					subject :>> vehicle;
				}
			}
			use case getInVehicle : UseCases::useCases {
				subject :>> vehicle;
				action unlockDoor_in [0..1] :> Actions::subactions;
				first unlockDoor_in then openDoor_in;
				action openDoor_in :> Actions::subactions;
				first openDoor_in then enterVehicle;
				action enterVehicle :> Actions::subactions;
				first enterVehicle then closeDoor_in;
				action closeDoor_in :> Actions::subactions;
			}
			use case def GetInVehicle {
				subject vehicle : Objects::objects;
				part driver [0..1] :> Cases::actors;
				part passenger [0..1] :> Cases::actors;
				assert constraint :> Constraints::assertedConstraintChecks {
					driver != null xor passenger != null;
				}
			}
			use case getOutOfVehicle : UseCases::useCases {
				subject :>> vehicle;
				action openDoor_out :> Actions::subactions;
				first openDoor_out then exitVehicle;
				action exitVehicle :> Actions::subactions;
				first exitVehicle then closeDoor_out;
				action closeDoor_out :> Actions::subactions;
				first closeDoor_out then lockDoor_out;
				action lockDoor_out :> Actions::subactions;
			}
			use case def GetOutOfVehicle {
				subject vehicle : Objects::objects;
				part driver [0..1] :> Cases::actors;
				part passenger [0..1] :> Cases::actors;
				assert constraint :> Constraints::assertedConstraintChecks {
					driver != null xor passenger != null;
				}
			}
		}
		package TransportPassengerScenario {
			public import TransportPassenger::*;
			use case transportPassenger : UseCases::useCases {
				subject :>> vehicle;
				public first UseCases::start;
				first start then a {
					end ref :>> Occurrences::earlierOccurrence;
				}
				action a :> Actions::subactions {
					action driverGetInVehicle [1] :> getInVehicle_a;
					action passenger1GetInVehicle [1] :> getInVehicle_a;
				}
				first a then trigger;
				{
					ignitionCmd : Objects::objects;
					ref :>> Transfers::receiver;
				}
				first trigger then b;
				action b :> Actions::subactions {
					action driveVehicleToDestination :> Actions::subactions;
					action providePower :> Actions::subactions;
				}
				first b then c;
				action c :> Actions::subactions {
					action driverGetOutOfVehicle [1] :> getOutOfVehicle_a;
					action passenger1GetOutOfVehicle [1] :> getOutOfVehicle_a;
				}
				first c then done {
					end ref :>> Occurrences::laterOccurrence;
				}
			}
			use case transportPassenger_1 : UseCases::useCases {
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
					ignitionCmd : Objects::objects;
					ref :>> Transfers::receiver;
				}
				public first UseCases::start;
				first start then fork1 {
					end ref :>> Occurrences::earlierOccurrence;
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
					end ref :>> Occurrences::laterOccurrence;
				}
			}
		}
		part missionContext : Parts::parts {
			#ParametersOfInterestMetadata::MeasureOfEffectiveness attribute transportTime :> duration;
			perform Parts::performedActions;
			part road : Items::subparts = Parts::performedActions.road;
			part driver : Items::subparts = Parts::performedActions.driver {
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
			}
			part passenger1 : Items::subparts = Parts::performedActions.passenger {
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
				perform Parts::performedActions;
			}
			part vehicle_b_1 :> vehicle_b = Parts::performedActions.vehicle {
				attribute :>> position3dVector = (0,0,0)[spatialCF];
				perform providePower;
				perform Parts::performedActions;
			}
			:> Connections::binaryConnections connect driver.handPort to vehicle_b_1.ignitionCmdPort;
			:> Connections::binaryConnections connect road to vehicle_b_1.vehicleToRoadPort;
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
			abstract part vehicleFamily :> Parts::parts {
				variation part engine : Items::subparts {
					part engine4Cyl : engine;
					part engine6Cyl : engine {
						part cylinder [6] : Items::subparts {
							variation attribute diameter : Base::dataValues {
								attribute smallDiameter : diameter;
								attribute largeDiagmeter : diameter;
							}
						}
					}
				}
				part transmissionChoices : Items::subparts;
				part sunroof [0..1] : Items::subparts;
				assert constraint selectionConstraint :> Constraints::assertedConstraintChecks {
					engine == engine4Cyl and transmissionChoices == transmissionManual xor engine == engine6Cyl and transmissionChoices == transmissionAutomatic;
				}
				part driveshaft :> Items::subparts;
				part frontAxleAssembly :> Items::subparts;
				part rearAxleAssembly :> Items::subparts;
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
			public filter @Safety or @Security;
		}
		package MandatorySafetyGroup {
			comment about \* Parts that contribute to safety AND are mandatory. *\
			public import vehicle_b::**;
			public filter @Safety and isMandatory;
		}
	}
	package Views_Viewpoints {
		package ViewpointDefinitions {
			viewpoint def BehaviorViewpoint {
				subject :>> Views::subj;
			}
			viewpoint def SafetyViewpoint {
				subject :>> Views::subj;
				concern vs : Requirements::concerns {
					subject :>> Requirements::null;
				}
			}
			part def SafetyEngineer;
			concern def VehicleSafety {
				subject :>> Requirements::null;
				doc \* identify system safety features *\
				part se : Requirements::stakeholders;
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
			view vehiclePartsTree_Safety : Views::views {
				satisfy requirement sv : Requirements::satisfiedRequirementChecks {
					subject :>> Views::subj;
				}
				protected expose PartsTree::**;
				public filter @Safety;
			}
		}
	}
}

