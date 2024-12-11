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
				attribute mass :> ISQBase::mass;
				attribute dryMass :> ISQBase::mass;
				attribute cargoMass :> ISQBase::mass;
				attribute position :> ISQBase::length;
				attribute velocity :> ISQSpaceTime::speed;
				attribute acceleration :> ISQSpaceTime::acceleration;
				attribute electricalPower :> ISQMechanics::power;
				attribute Tmax :> ISQBase::thermodynamicTemperature;
				attribute maintenanceTime : Time::DateTime;
				attribute brakePedalDepressed : ScalarValues::Boolean;
				port ignitionCmdPort : ;
				port pwrCmdPort : ;
				port vehicleToRoadPort : ;
				port statusPort : ;
				;
				;
				;
				;
				;
				;
				{
					ref controller : ;
					{
						;
						;
						;
						{
							;
							;
							;
							{
								out ref :>> Constraints::null;
							}
						}
						{
							ref :>> States::transitionLinkSource;
							;
							ref :>> TransitionPerformances::transitionLink;
						}
						{
							ref :>> States::transitionLinkSource;
							ref ignitionCmd :> ;
							{
								ref ignitionCmd : ;
								ref;
							}
							{
								ref;
								ref :>> Transfers::sender;
								ref;
							}
							;
							ref :>> TransitionPerformances::transitionLink;
						}
						{
							ref :>> States::transitionLinkSource;
							ref :> ;
							{
								ref : ;
								ref :>> Transfers::receiver;
							}
							;
							ref :>> TransitionPerformances::transitionLink;
						}
						{
							ref :>> States::transitionLinkSource;
							ref :> ;
							{
								ref : ;
								ref :>> Transfers::receiver;
							}
							{
								ref;
								ref :>> Transfers::sender;
								ref;
							}
							;
							ref :>> TransitionPerformances::transitionLink;
						}
					}
					{
						;
						{
							out ref temp :> Base::things;
						}
						;
						;
						;
						{
							ref :>> States::transitionLinkSource;
							;
							ref :>> TransitionPerformances::transitionLink;
						}
						{
							ref :>> States::transitionLinkSource;
							ref :> ;
							{
								ref;
								ref :>> Transfers::receiver;
							}
							;
							ref :>> TransitionPerformances::transitionLink;
						}
						{
							ref :>> States::transitionLinkSource;
							ref :> ;
							{
								ref;
								ref :>> Transfers::receiver;
							}
							{
								ref;
								ref :>> Transfers::sender;
								ref;
							}
							;
							ref :>> TransitionPerformances::transitionLink;
						}
						{
							ref :>> States::transitionLinkSource;
							ref :> ;
							{
								ref : ;
								ref :>> Transfers::receiver;
							}
							;
							ref :>> TransitionPerformances::transitionLink;
						}
						{
							ref :>> States::transitionLinkSource;
							ref :> ;
							{
								ref : ;
								ref :>> Transfers::receiver;
							}
							;
							ref :>> TransitionPerformances::transitionLink;
						}
					}
				}
			}
			part def Engine {
				attribute mass :> ISQBase::mass;
				attribute peakHorsePower :> ISQMechanics::power;
				attribute fuelEfficiency : ScalarValues::Real;
				attribute cost : ScalarValues::Real;
				attribute displacement :> ISQSpaceTime::volume;
				port engineControlPort;
				port fuelInPort;
				port fuelCmdPort : ;
				port drivePwrPort : ;
				port ignitionCmdPort : ;
				port flyWheelPort;
				;
				{
					;
					;
					{
						;
					}
				}
			}
			part def StarterMotor {
				port gearPort : ;
			}
			part def Cylinder;
			part def Transmission {
				attribute gearRatio : ScalarValues::Real;
				port clutchPort;
				;
			}
			part def Driveshaft;
			part def AxleAssembly;
			part def Axle {
				attribute mass :> ISQBase::mass;
			}
			part def FrontAxle {
				attribute steeringAngle :> ISQSpaceTime::angularMeasure;
			}
			part def HalfAxle {
				port shankCompositePort : ;
			}
			part def Differential;
			part def Wheel {
				attribute diameter : ISQBase::LengthValue;
				port lugNutCompositePort : ;
			}
			part def Hub {
				port shankCompositePort : ;
			}
			abstract part def Software;
			part def VehicleSoftware;
			part def VehicleController {
				port controlPort : ;
				{
					{
						;
						;
						;
						{
							ref :>> States::transitionLinkSource;
							;
							ref :>> TransitionPerformances::transitionLink;
						}
						{
							ref :>> States::transitionLinkSource;
							ref :> ;
							{
								ref : ;
								ref :>> Transfers::receiver;
							}
							;
							ref :>> TransitionPerformances::transitionLink;
						}
						{
							ref :>> States::transitionLinkSource;
							ref :> ;
							{
								ref : ;
								ref :>> Transfers::receiver;
							}
							;
							ref :>> TransitionPerformances::transitionLink;
						}
					}
				}
			}
			part def CruiseController {
				port setSpeedPort;
				port speedSensorPort;
				port cruiseControlPort : ;
				;
			}
			part def SpeedSensor {
				port speedSensorPort : ;
			}
			part def FuelTank {
				attribute mass :> ISQBase::mass;
				item fuel :  {
					attribute :>> ;
				}
				attribute fuelKind : ;
				attribute fuelMassMax :> ISQBase::mass;
				{
					out ref :>> Constraints::null;
				}
				port fuelOutPort : ;
				port fuelInPort;
			}
			part def BodyAssy;
			part def Body {
				attribute color : ;
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
				item ignitionCmd : ;
				;
			}
			port def StatusPort {
				;
			}
			port def GearPort {
				;
			}
			port def PwrCmdPort {
				item pwrCmd : ;
				;
			}
			port def FuelCmdPort {
				item fuelCmd : ;
				;
			}
			port def FuelPort {
				out item fuel : ;
				;
			}
			port def DrivePwrPort {
				out ref torque : ISQMechanics::TorqueValue;
				;
			}
			port def ShaftPort_a {
				;
			}
			port def ShaftPort_b {
				;
			}
			port def ShaftPort_c {
				;
			}
			port def ShaftPort_d {
				;
			}
			port def DiffPort {
				;
			}
			port def AxlePort {
				;
			}
			port def AxleToWheelPort {
				;
			}
			port def WheelToAxlePort {
				;
			}
			port def WheelToRoadPort {
				;
			}
			port def LugNutCompositePort {
				port lugNutPort [*] : ;
				;
			}
			port def ShankCompositePort {
				port shankPort [*] : ;
				;
			}
			port def LugNutPort {
				attribute threadDia;
				attribute threadPitch;
				;
			}
			port def ShankPort {
				attribute threadDia;
				attribute threadPitch;
				attribute shaftLength;
				;
			}
			port def VehicleToRoadPort {
				;
			}
			port def ControlPort {
				;
			}
			port def CruiseControlPort {
				;
			}
			port def SpeedSensorPort {
				;
			}
			port def SetSpeedPort {
				;
			}
			port def DriverCmdPort {
				out item driverCmd [*];
				;
			}
			port def HandPort {
				out item ignitionCmd : ;
				out item pwrCmd : ;
				;
			}
		}
		package ItemDefinitions {
			item def PwrCmd {
				attribute throttleLevel : ScalarValues::Real;
			}
			item def FuelCmd;
			item def Fuel {
				attribute fuelMass :> ISQBase::mass;
			}
			item def SensedSpeed {
				attribute speed :> ISQSpaceTime::speed;
			}
		}
		package SignalDefinitions {
			item def Cmd;
			item def DriverCmd;
			item def IgnitionCmd {
				attribute ignitionOnOff : ;
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
				end port p1 : ;
				end port p2;
				;
			}
			interface def FuelInterface {
				end port fuelOutPort : ;
				end port fuelInPort;
				;
			}
			interface def WheelFastenerInterface {
				end port lugNutPort : ;
				end port shankPort : ;
				attribute maxTorque : ISQMechanics::TorqueValue;
				{
					out ref :>> Items::null;
				}
			}
			interface def WheelHubInterface {
				end port lugNutCompositePort : ;
				end port shankCompositePort : ;
				interface;
			}
		}
		package AllocationDefinitions {
			allocation def LogicalToPhysical;
		}
		package ActionDefinitions {
			action def ProvidePower {
				item pwrCmd : ;
				out ref wheelToRoadTorque [2] : ISQMechanics::TorqueValue;
			}
			action def GenerateTorque {
				item fuelCmd : ;
				out ref engineTorque : ISQMechanics::TorqueValue;
			}
			action def AmplifyTorque {
				ref engineTorque : ISQMechanics::TorqueValue;
				out ref transmissionTorque : ISQMechanics::TorqueValue;
			}
			action def TransferTorque {
				ref transmissionTorque : ISQMechanics::TorqueValue;
				out ref driveshaftTorque : ISQMechanics::TorqueValue;
			}
			action def DistributeTorque {
				ref driveshaftTorque : ISQMechanics::TorqueValue;
				out ref wheelToRoadTorque [2] : ISQMechanics::TorqueValue;
			}
			action def PerformSelfTest;
			action def ApplyParkingBrake;
			action def SenseTemperature {
				out ref temp : ISQBase::ThermodynamicTemperatureValue;
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
				attribute massRequired :> ISQBase::mass;
				attribute massActual :> ISQBase::mass;
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
				ref generateTorque : ;
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
				attribute actualFuelEconomy :> ;
				attribute requiredFuelEconomy :> ;
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
				enum black : ;
				enum grey : ;
				enum red : ;
			}
			enum def {
				enum [;
				enum [;
				enum [;
			}
			attribute cylinderDiameter :  [;
			enum def {
				enum on : ;
				enum off : ;
			}
			enum def {
				enum gas : ;
				enum diesel : ;
			}
			ref distancePerVolume :> Quantities::scalarQuantities /;
			ref timePerDistance :> Quantities::scalarQuantities /;
			ref volumePerDistance :> Quantities::scalarQuantities /;
			ref volumePerTime :> Quantities::scalarQuantities /;
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
				attribute time : ISQBase::DurationValue;
				attribute spatialCF [1] : ISQSpaceTime::CartesianSpatial3dCoordinateFrame {
					ref :>> ISQSpaceTime::null ,;
				}
				attribute velocityCF [1] : ISQSpaceTime::CartesianVelocity3dCoordinateFrame /;
				attribute accelarationCF [1] : ISQSpaceTime::CartesianAcceleration3dCoordinateFrame /;
			}
		}
	}
	package VehicleLogicalConfiguration {
		package PartsTree {
			part vehicleLogical {
				;
				part torqueGenerator :  {
					;
				}
				part electricalGenerator :  {
					;
				}
				part steeringSystem : ;
				part brakingSubsystem : ;
			}
		}
	}
	package VehicleLogicalToPhysicalAllocation {
		public import PartsTree;
		public import PartsTree;
		{
			{
				;
			}
			{
				;
			}
		}
	}
	package VehicleConfigurations {
		package VehicleConfiguration_a {
			package PartsTree {
				part vehicle_a :  {
					attribute mass :>>  +;
					attribute dryMass :>> ;
					attribute :>>  [;
					attribute partMasses [*];
					part fuelTank :  {
						attribute :>>  [;
						item :>>  {
							attribute :>>  [;
						}
					}
					part frontAxleAssembly :  {
						attribute mass :> ISQBase::mass [;
						part frontAxle : ;
						part frontWheels [2] : ;
					}
					part rearAxleAssembly :  {
						attribute mass :> ISQBase::mass [;
						attribute driveTrainEfficiency : ScalarValues::Real;
						part rearAxle : ;
						part rearWheels [2] :  {
							attribute :>> ;
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
				part vehicle_b :  {
					attribute mass + {
						;
					}
					attribute dryMass :>> ;
					attribute :>>  [;
					attribute partMasses ,;
					attribute avgFuelEconomy :> ;
					port fuelCmdPort :  {
						item fuelCmd :>> ;
					}
					port setSpeedPort;
					port vehicleToRoadPort :>>  {
						port wheelToRoadPort1 : ;
						port wheelToRoadPort2 : ;
					}
					;
					;
					;
					;
					;
					item [1] :> Items::envelopingShapes {
						ref length1 :>> ShapeItems::null [;
						ref width1 :>> ShapeItems::null [;
						ref height1 :>> ShapeItems::null [;
					}
					part fuelTank :  {
						attribute :>>  [;
						item :>>  {
							attribute :>>  [;
						}
						attribute :>>  [;
					}
					part frontAxleAssembly :  {
						attribute mass :> ISQBase::mass [;
						port shaftPort_d : ;
						part frontAxle : ;
						part frontWheels [2] : ;
					}
					part rearAxleAssembly :  {
						attribute mass :> ISQBase::mass [;
						attribute driveTrainEfficiency : ScalarValues::Real;
						port shaftPort_d : ;
						;
						part rearWheel1 :  {
							attribute :>> ;
							port wheelToRoadPort : ;
							port lugNutCompositePort :>>  {
								port lugNutPort [5] :>> ;
							}
						}
						part rearWheel2 :  {
							attribute :>> ;
							port wheelToRoadPort : ;
							port lugNutCompositePort :>>  {
								port lugNutPort [5] :>> ;
							}
						}
						part differential :  {
							port shaftPort_d : ;
							port leftDiffPort : ;
							port rightDiffPort : ;
						}
						part rearAxle {
							part leftHalfAxle :  {
								port leftAxleToDiffPort : ;
								port shankCompositePort :>>  {
									port shankPort [5] :>> ;
								}
							}
							part rightHalfAxle :  {
								port rightAxleToDiffPort : ;
								port shankCompositePort :>>  {
									port shankPort [5] :>> ;
								}
							}
						}
						;
						;
						;
						interface;
						interface;
					}
					part starterMotor : ;
					part engine :  {
						;
						part cylinders [4] : ;
						part alternator {
							;
						}
						{
							ref;
							{
								ref generateTorque :>> ;
								out ref :>> ;
							}
							{
								ref :>> ;
								port torqueOutPort :>> ;
								out ref :>> ;
							}
							out ref :>> ;
						}
					}
					part transmission :  {
						attribute mass :> ISQBase::mass [;
						port shaftPort_a : ;
						;
					}
					part driveshaft :  {
						attribute mass :> ISQBase::mass [;
						port shaftPort_b : ;
						port shaftPort_c : ;
						;
					}
					part vehicleSoftware :  {
						part vehicleController :  {
							;
							part cruiseController : ;
						}
					}
					part speedSensor : ;
					part bodyAssy :  {
						part body :  {
							attribute :>> ;
						}
						part bumper {
							{
								ref :>> ;
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
								ref :>> ;
							}
						}
						part frontSeat [2];
						part driverAirBag {
							{
								ref :>> ;
							}
						}
					}
					;
					interface;
					interface;
					;
					;
					;
					;
					;
					;
					;
					;
					;
					;
					;
					{
						ref;
						{
							ref :>> ;
							attribute :>> ;
							attribute :>> ;
							out ref :>> ;
						}
						out ref :>> ;
					}
				}
			}
			package ActionTree {
				{
					item fuelCmd : ;
					out ref wheelToRoadTorque [2] :>> ;
					{
						item;
					}
					;
					;
					;
					;
					;
					;
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
						{
							{
								ref;
								ref;
								ref :>> Transfers::receiver;
								ref ignitionCmd : ;
							}
							{
								ref ignitionCmd : ;
								ref;
							}
							;
							{
								item ignitionCmd : ;
								out item es : ;
							}
							;
							{
								ref;
								ref;
								ref :>> Transfers::receiver;
								ref es : ;
							}
							{
								ref es : ;
								ref;
							}
						}
						part driver :  {
							;
							;
							;
						}
						part vehicle :  {
							;
							;
							;
						}
						;
						{
							;
							;
						}
						{
							;
							;
						}
					}
				}
				occurrence CruiseControl1 {
					part vehicle_b :>  {
						port :>>  {
							;
						}
						part :>>  {
							port :>>  {
								;
							}
						}
						part :>>  {
							part :>>  {
								part :>>  {
									port :>>  {
										;
									}
									port :>>  {
										;
									}
									port :>>  {
										;
									}
								}
							}
						}
						part :>>  {
							port :>>  {
								;
							}
						}
						{
							;
							;
						}
						{
							;
							;
						}
					}
				}
				occurrence CruiseControl2 {
					part vehicle_b :>  {
						port :>>  {
							;
						}
						part :>>  {
							port :>>  {
								;
							}
						}
						part :>>  {
							part :>>  {
								part :>>  {
									port :>>  {
										;
									}
									port :>>  {
										;
										{
											end ref;
										}
										;
									}
									port :>>  {
										;
									}
								}
							}
						}
						part :>>  {
							port :>>  {
								;
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
					ref vehicle : ;
					{
						ref :>> ;
						doc \* The total mass of the vehicle shall be less than or equal to the required mass.
Assume total mass includes a full tank of gas of 60 kg*\
						attribute :>>  [;
						attribute :>>  +;
						attribute fuelMassActual :> ISQBase::mass;
						attribute fuelMassMax :> ISQBase::mass [;
						{
							out ref :>> Requirements::null;
						}
						out ref :>> ;
					}
					;
					{
						ref :>> Requirements::null;
						doc \* fuel economy requirements group *\
						attribute assumedCargoMass :> ISQBase::mass;
						{
							ref :>> ;
							ref :>>  [;
							{
								out ref :>> Requirements::null;
							}
							out ref :>> ;
						}
						{
							ref :>> ;
							ref :>>  [;
							{
								out ref :>> Requirements::null;
							}
							{
								ref :>> ModelingMetadata::status;
								ref :>> ModelingMetadata::originator;
								ref :>> ModelingMetadata::owner;
							}
							out ref :>> ;
						}
						out ref :>> Requirements::null;
					}
					out ref :>> Requirements::null;
				}
				{
					ref engine1 : ;
					{
						ref :>> ;
						doc \* The total mass of the engine shall be less than or equal to the required mass.*\
						attribute :>>  [;
						attribute :>> ;
						out ref :>> ;
					}
					{
						ref generateTorque;
						out ref :>> ;
					}
					{
						ref :>> ;
						port torqueOutPort {
							out ref torque : ISQMechanics::TorqueValue;
						}
						out ref :>> ;
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
			part engine :  {
				part cylinders [4] : ;
			}
			part engine4Cyl :>  {
				part [4] :>> ;
				part cylinder1 [1] :> ;
				part cylinder2 [1] :> ;
				part cylinder3 [1] :> ;
				part cylinder4 [1] :> ;
			}
		}
		package WheelHubAssemblies {
			part wheelHubAssy1 {
				part wheel1 :  {
					port :>>  {
						port lugNutPort [5] :>> ;
					}
				}
				part hub1 :  {
					port :>>  {
						port shankPort [5] :>> ;
					}
				}
				interface;
			}
			part wheelHubAssy2 {
				part wheel1 :  {
					port :>>  {
						port lugNutPort [5] :>> ;
					}
				}
				part hub1 :  {
					port :>>  {
						port shankPort [5] :>> ;
					}
				}
				interface {
					interface;
				}
			}
			part wheelHubAssy3 {
				part wheel1 :  {
					port lugNutCompositePort :>>  {
						port lugNutPort [5] {
							attribute :>>  [;
							attribute :>>  [;
						}
						port lugNutPort1 [1];
						port lugNutPort2 [1];
						port lugNutPort3 [1];
					}
				}
				part hub1 :  {
					port shankCompositePort :>>  {
						port shankPort [5] {
							attribute :>>  [;
							attribute :>>  [;
							attribute :>>  [;
						}
						port shankPort1 [1];
						port shankPort2 [1];
						port shankPort3 [1];
					}
				}
				interface {
					interface {
						attribute :>>  *;
					}
					interface {
						attribute :>>  *;
					}
					interface {
						attribute :>>  *;
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
				ref tpd_avg :> ;
				attribute f +;
				out ref dpv :>  /;
			}
			calc def AverageTravelTimePerDistance {
				ref scenario : ;
				out ref tpd_avg :> ;
			}
			calc def TraveledDistance {
				ref scenario : ;
				out ref distance :> ISQBase::length;
			}
			calc def IdlingFuelConsumptionPerTime {
				ref engine : ;
				attribute idlingFuelConsumptionPerDisplacement : ScalarValues::Real;
				out ref f_a : ScalarValues::Real *;
			}
			attribute specificGravityOfGasoline : ScalarValues::Real;
			calc def BestFuelConsumptionPerDistance {
				ref mass : ISQBase::MassValue;
				ref bsfc : ScalarValues::Real;
				ref tpd_avg :> ;
				ref distance :> ISQBase::length;
				attribute required_power_avg :> ISQMechanics::power;
				{
					out ref :>> Constraints::null;
				}
				out ref f_b : ScalarValues::Real *;
			}
			calc def ComputeBSFC {
				ref engine : ;
				out ref : ScalarValues::Real;
			}
			{
				ref;
				{
					ref :>> AnalysisCases::null;
					doc \* estimate the vehicle fuel economy*\
					{
						out ref :>> ;
					}
					out ref :>> AnalysisCases::null;
				}
				attribute scenario : ;
				attribute distance;
				attribute tpd_avg;
				attribute bsfc;
				attribute f_a;
				attribute f_b;
				out attribute calculatedFuelEconomy :> ;
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
				ref :>> RiskMetadata::totalRisk;
				ref :>> RiskMetadata::technicalRisk;
				ref :>> RiskMetadata::scheduleRisk;
				ref :>> RiskMetadata::costRisk;
			}
			{
				ref :>> RiskMetadata::technicalRisk {
					ref :>> RiskMetadata::probability;
					ref :>> RiskMetadata::impact;
				}
			}
			public import TradeStudies::*;
			calc def EngineEvaluation {
				ref engineMass :> ISQBase::mass;
				ref enginePower :> ISQMechanics::power;
				ref engineFuelEfficiency : ScalarValues::Real;
				ref engineCost : ScalarValues::Real;
				out ref eval : ScalarValues::Real;
			}
			calc def EngineEvaluation_4cyl {
				ref engineMass :> ISQBase::mass;
				ref enginePower :> ISQMechanics::power;
				ref engineFuelEfficiency : ScalarValues::Real;
				ref engineCost : ScalarValues::Real;
				out ref eval : ScalarValues::Real;
			}
			calc def EngineEvaluation_6cyl {
				ref engineMass :> ISQBase::mass;
				ref enginePower :> ISQMechanics::power;
				ref engineFuelEfficiency : ScalarValues::Real;
				ref engineCost : ScalarValues::Real;
				out ref eval : ScalarValues::Real;
			}
			{
				ref vehicleAlternatives [2];
				part vehicle_b_engine4cyl :>  {
					part engine :>>  {
						part cylinders [4] :>> ;
						attribute mass :>>  [;
						attribute peakHorsePower :>>  [;
						attribute fuelEfficiency :>> ;
						attribute cost :>> ;
					}
				}
				part vehicle_b_engine6cyl :>  {
					part engine :>>  {
						part cylinders [6] :>> ;
						attribute mass :>>  [;
						attribute peakHorsePower :>>  [;
						attribute fuelEfficiency :>> ;
						attribute cost :>> ;
					}
				}
				{
					ref :>> TradeStudies::null;
					out ref :>> TradeStudies::null;
				}
				comment about \* Select vehicle alternative with the engine whose evaluation function returns the max value*\
				{
					part vehicle :> ;
					out attribute eval : ScalarValues::Real;
				}
				{
					part vehicle :> ;
					out attribute eval : ScalarValues::Real;
				}
				out part selectedVehicle :> ;
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
				ref :>> VerificationCases::subj;
				{
					ref :>> VerificationCases::subj;
					out ref :>> VerificationCases::null;
				}
				out ref :>> VerificationCases::verdict;
			}
			verification def AccelerationTest {
				ref :>> VerificationCases::subj;
				{
					ref :>> VerificationCases::subj;
					out ref :>> VerificationCases::null;
				}
				out ref :>> VerificationCases::verdict;
			}
			verification def ReliabilityTest {
				ref :>> VerificationCases::subj;
				{
					ref :>> VerificationCases::subj;
					out ref :>> VerificationCases::null;
				}
				out ref :>> VerificationCases::verdict;
			}
		}
		package VerificationCases1 {
			{
				ref vehicle_uut :> ;
				part vehicleVerificationSubSystem_1;
				{
					ref :>> ;
					{
						ref :>> ;
						ref :>> ;
						out ref :>> ;
					}
					out ref :>> ;
				}
				{
					ref :>> VerificationCases::kind ,;
				}
				{
					out ref massMeasured :> ISQBase::mass;
				}
				;
				{
					ref massMeasured :> ISQBase::mass;
					out ref verdict;
				}
				;
				out ref :>> ;
			}
		}
		package VerificationSystem {
			part verificationContext {
				;
				part vehicle_UnitUnderTest :> ;
				part massVerificationSystem {
					part scale {
						;
					}
					part operator {
						;
					}
				}
			}
		}
	}
	package VehicleIndividuals {
		individual occurrence a :  {
			occurrence t0_t2_a {
				snapshot occurrence t0_a {
					attribute t0 :>>  [;
					snapshot occurrence t0_r :  {
						ref :>> ;
						ref :>> ;
					}
					snapshot occurrence t0_v :  {
						ref :>>  [;
						ref :>>  [;
						ref :>>  [;
						snapshot occurrence t0_fa :  {
							snapshot occurrence t0_leftFront : ;
							snapshot occurrence t0_rightFront : ;
						}
					}
				}
				snapshot occurrence t1_a {
					attribute t1 :>>  [;
					snapshot occurrence t1_r :  {
						ref :>> ;
						ref :>> ;
					}
					snapshot occurrence t1_v :  {
						ref :>>  [;
						ref :>>  [;
						ref :>>  [;
						snapshot occurrence t1_fa :  {
							snapshot occurrence t1_leftFront : ;
							snapshot occurrence t1_rightFront : ;
						}
					}
				}
				snapshot occurrence t2_a {
					attribute t2 :>>  [;
					snapshot occurrence t2_r :  {
						ref :>> ;
						ref :>> ;
					}
					snapshot occurrence t2_v :  {
						ref :>>  [;
						ref :>>  [;
						ref :>>  [;
						snapshot occurrence t2_fa :  {
							snapshot occurrence t2_leftFront : ;
							snapshot occurrence t2_rightFront : ;
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
				port handPort : ;
				{
					;
					;
					{
						ref :>> States::transitionLinkSource;
						;
						ref :>> TransitionPerformances::transitionLink;
					}
					{
						ref :>> States::transitionLinkSource;
						{
							ref;
							ref;
							ref :>> Transfers::receiver;
						}
						;
						ref :>> TransitionPerformances::transitionLink;
					}
					{
						ref :>> States::transitionLinkSource;
						{
							ref;
							ref;
							ref :>> Transfers::receiver;
						}
						;
						ref :>> TransitionPerformances::transitionLink;
					}
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
						out ref :>> ;
					}
					out ref :>> UseCases::null;
				}
				ref vehicle : ;
				part environment;
				part road;
				part driver;
				part passenger [0];
				{
					ref :>> ;
					{
						ref :>> Requirements::null;
						out ref :>> ;
					}
					out ref :>> ;
				}
				{
					ref :>> ;
					{
						ref :>> Requirements::null;
						out ref :>> ;
					}
					out ref :>> ;
				}
				out ref :>> UseCases::null;
			}
			{
				ref :>> ;
				;
				;
				;
				;
				;
				;
				;
				{
					ref :>> ;
					out ref :>> ;
				}
				out ref :>> ;
			}
			use case def GetInVehicle {
				ref vehicle : ;
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
				ref :>> ;
				;
				;
				;
				;
				;
				;
				;
				{
					ref :>> ;
					out ref :>> ;
				}
				out ref :>> ;
			}
			use case def GetOutOfVehicle {
				ref vehicle : ;
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
				ref :>> ;
				{
					end ref;
				}
				{
					;
					;
				}
				;
				{
					ref ignitionCmd : ;
					ref :>> Transfers::receiver;
				}
				;
				{
					;
					;
				}
				;
				{
					;
					;
				}
				{
					end ref;
				}
				{
					ref :>> ;
					out ref :>> ;
				}
				out ref :>> ;
			}
			{
				ref :>> ;
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
					ref ignitionCmd : ;
					ref :>> Transfers::receiver;
				}
				{
					end ref;
				}
				;
				;
				;
				;
				;
				;
				;
				;
				;
				;
				;
				;
				;
				;
				;
				;
				;
				;
				{
					end ref;
				}
				{
					ref :>> ;
					out ref :>> ;
				}
				out ref :>> ;
			}
		}
		part missionContext :  {
			attribute transportTime {
				;
			}
			;
			part road : ;
			part driver :  {
				;
				;
				;
				;
				;
				;
				;
				;
				;
			}
			part passenger1 :  {
				;
				;
				;
				;
				;
				;
				;
				;
			}
			part vehicle_b_1 :>  {
				attribute :>> ISQSpaceTime::position3dVector [;
				;
				;
			}
			;
			;
		}
	}
	package VehicleSuperSetModel {
		comment about \* all of vehicleFamily is included in the superset model to enable subsetting a specific vehicle configuration*\
		package VariationPointDefinitions {
			variation part def TransmissionChoices {
				part transmissionAutomatic : ;
				part transmissionManual : ;
			}
		}
		package VehiclePartsTree {
			public import VariationPointDefinitions;
			abstract part vehicleFamily {
				variation part engine :  {
					part engine4Cyl : ;
					part engine6Cyl :  {
						part cylinder [6] :  {
							variation attribute diameter : ISQBase::LengthValue {
								attribute smallDiameter : ISQBase::LengthValue;
								attribute largeDiagmeter : ISQBase::LengthValue;
							}
						}
					}
				}
				part transmissionChoices : ;
				part sunroof [0] : ;
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
					out ref :>> ;
				}
				out ref :>> Views::null;
			}
			part def SafetyEngineer;
			concern def VehicleSafety {
				ref :>> Requirements::null;
				doc \* identify system safety features *\
				part se : ;
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
			view vehiclePartsTree_Safety :  {
				{
					ref :>> ;
					out ref :>> ;
				}
				protected PartsTree;
			}
		}
	}
}

