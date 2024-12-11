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
				;
				;
				{
					;
					{
						;
						;
						;
						{
							;
							;
							;
							{
								;
							}
						}
						{
							;
							{
								;
								;
							}
							;
						}
						{
							;
							;
							{
								;
								;
							}
							{
								;
								;
								;
							}
							{
								;
								;
							}
							;
						}
						{
							;
							;
							{
								;
								;
							}
							{
								;
								;
							}
							;
						}
						{
							;
							;
							{
								;
								;
							}
							{
								;
								;
								;
							}
							{
								;
								;
							}
							;
						}
					}
					{
						;
						{
							;
						}
						;
						;
						;
						{
							;
							{
								;
								;
							}
							;
						}
						{
							;
							;
							{
								;
								;
							}
							{
								;
								;
							}
							;
						}
						{
							;
							;
							{
								;
								;
							}
							{
								;
								;
								;
							}
							{
								;
								;
							}
							;
						}
						{
							;
							;
							{
								;
								;
							}
							{
								;
								;
							}
							;
						}
						{
							;
							;
							{
								;
								;
							}
							{
								;
								;
							}
							;
						}
					}
				}
			}
			part def Engine {
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
					;
					;
					{
						;
					}
				}
			}
			part def StarterMotor {
				;
			}
			part def Cylinder;
			part def Transmission {
				;
				;
				;
			}
			part def Driveshaft;
			part def AxleAssembly;
			part def Axle {
				;
			}
			part def FrontAxle {
				;
			}
			part def HalfAxle {
				;
			}
			part def Differential;
			part def Wheel {
				;
				;
			}
			part def Hub {
				;
			}
			abstract part def Software;
			part def VehicleSoftware;
			part def VehicleController {
				;
				{
					{
						;
						;
						;
						{
							;
							{
								;
								;
							}
							;
						}
						{
							;
							;
							{
								;
								;
							}
							{
								;
								;
							}
							;
						}
						{
							;
							;
							{
								;
								;
							}
							{
								;
								;
							}
							;
						}
					}
				}
			}
			part def CruiseController {
				;
				;
				;
				;
			}
			part def SpeedSensor {
				;
			}
			part def FuelTank {
				;
				{
					;
				}
				;
				;
				{
					;
				}
				;
				;
			}
			part def BodyAssy;
			part def Body {
				;
			}
			part def Thermostat;
			part def WaterHose;
			part def Road {
				;
				;
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
				;
				;
			}
			port def StatusPort {
				;
			}
			port def GearPort {
				;
			}
			port def PwrCmdPort {
				;
				;
			}
			port def FuelCmdPort {
				;
				;
			}
			port def FuelPort {
				;
				;
			}
			port def DrivePwrPort {
				;
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
				;
				;
			}
			port def ShankCompositePort {
				;
				;
			}
			port def LugNutPort {
				;
				;
				;
			}
			port def ShankPort {
				;
				;
				;
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
				;
				;
			}
			port def HandPort {
				;
				;
				;
			}
		}
		package ItemDefinitions {
			item def PwrCmd {
				;
			}
			item def FuelCmd;
			item def Fuel {
				;
			}
			item def SensedSpeed {
				;
			}
		}
		package SignalDefinitions {
			item def Cmd;
			item def DriverCmd;
			item def IgnitionCmd {
				;
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
				;
				;
				;
			}
			interface def FuelInterface {
				;
				;
				;
			}
			interface def WheelFastenerInterface {
				;
				;
				;
				{
					;
				}
			}
			interface def WheelHubInterface {
				;
				;
				{
					;
					;
				}
			}
		}
		package AllocationDefinitions {
			allocation def LogicalToPhysical;
		}
		package ActionDefinitions {
			action def ProvidePower {
				;
				;
			}
			action def GenerateTorque {
				;
				;
			}
			action def AmplifyTorque {
				;
				;
			}
			action def TransferTorque {
				;
				;
			}
			action def DistributeTorque {
				;
				;
			}
			action def PerformSelfTest;
			action def ApplyParkingBrake;
			action def SenseTemperature {
				;
			}
		}
		package StateDefinitions {
			state def VehicleStates;
			state def ControllerStates;
			state def CruiseControllerStates;
		}
		package RequirementDefinitions {
			requirement def MassRequirement {
				;
				doc \* The actual mass shall be less than the required mass*\
				;
				;
				{
					;
				}
				;
			}
			requirement def ReliabilityRequirement {
				;
				doc \* The actual reliability shall be greater than the required reliability*\
				;
				;
				{
					;
				}
				;
			}
			requirement def TorqueGenerationRequirement {
				doc \* The engine shall generate torque as a function of RPM as shown in Table 1. *\
				;
				;
			}
			requirement def DrivePowerOutputRequirement {
				;
				doc \* The engine shall provide a connection point to transfer torque to the transmission.*\
				;
			}
			requirement def FuelEconomyRequirement {
				;
				doc \* The vehicle shall maintain an average fuel economomy of at least x miles per gallon for the nominal 
driving scenario *\
				;
				;
				{
					;
				}
				;
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
				;
				;
				;
			}
			enum def {
				;
				;
				;
			}
			;
			enum def {
				;
				;
			}
			enum def {
				;
				;
			}
			;
			;
			;
			;
			;
			;
			;
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
				;
			}
			metadata def Security;
		}
		package KeyWord_MetadataDefinitions {
			public import Metaobjects::null;
			;
			metadata def <fm> failureMode {
				;
			}
			;
			metadata def <l> logical {
				;
			}
			;
			metadata def <p> physical {
				;
			}
		}
		package GenericContext {
			part def Context {
				;
				{
					;
				}
				;
				;
			}
		}
	}
	package VehicleLogicalConfiguration {
		package PartsTree {
			{
				;
				{
					;
				}
				{
					;
				}
				;
				;
			}
		}
	}
	package VehicleLogicalToPhysicalAllocation {
		public import PartsTree;
		public import PartsTree;
		{
			;
			;
			{
				;
				;
				{
					;
					;
				}
			}
			{
				;
				;
				{
					;
					;
				}
			}
		}
	}
	package VehicleConfigurations {
		package VehicleConfiguration_a {
			package PartsTree {
				{
					;
					;
					;
					;
					{
						;
						{
							;
						}
					}
					{
						;
						;
						;
					}
					{
						;
						;
						;
						{
							;
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
				{
					{
						;
					}
					;
					;
					;
					;
					{
						;
					}
					;
					{
						;
						;
					}
					;
					;
					;
					;
					;
					{
						;
						;
						;
					}
					{
						;
						{
							;
						}
						;
					}
					{
						;
						;
						;
						;
					}
					{
						;
						;
						;
						;
						{
							;
							;
							{
								;
							}
						}
						{
							;
							;
							{
								;
							}
						}
						{
							;
							;
							;
						}
						{
							{
								;
								{
									;
								}
							}
							{
								;
								{
									;
								}
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
						{
							;
							;
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
					;
					{
						;
						;
						{
							;
						}
						{
							;
							{
								;
								;
							}
							{
								;
								;
								;
							}
							;
						}
					}
					{
						;
						;
						;
					}
					{
						;
						;
						;
						;
					}
					{
						{
							;
							;
						}
					}
					;
					{
						{
							;
						}
						{
							{
								;
							}
						}
						{
							;
						}
					}
					{
						{
							;
						}
						{
							{
								;
							}
						}
						;
						{
							{
								;
							}
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
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						;
					}
					{
						;
						{
							;
							;
							;
							;
						}
						;
					}
				}
			}
			package ActionTree {
				{
					;
					;
					{
						;
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
						;
						;
					}
					{
						{
							{
								;
								;
								;
								;
							}
							{
								;
								;
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
								;
								;
							}
							{
								;
								;
							}
						}
						{
							;
							;
							;
						}
						{
							;
							;
							;
						}
						{
							;
							;
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
				{
					{
						{
							;
						}
						{
							{
								;
							}
						}
						{
							{
								{
									{
										;
									}
									{
										;
									}
									{
										;
									}
								}
							}
						}
						{
							{
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
				{
					{
						{
							;
						}
						{
							{
								;
							}
						}
						{
							{
								{
									{
										;
									}
									{
										;
										{
											;
											;
										}
										;
									}
									{
										;
									}
								}
							}
						}
						{
							{
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
				;
				{
					;
					{
						;
						doc \* The total mass of the vehicle shall be less than or equal to the required mass.
Assume total mass includes a full tank of gas of 60 kg*\
						;
						;
						;
						;
						{
							;
						}
						;
					}
					{
						;
						;
					}
					{
						;
						doc \* fuel economy requirements group *\
						;
						{
							;
							;
							{
								;
							}
							;
						}
						{
							;
							;
							{
								;
							}
							{
								;
								;
								;
							}
							;
						}
						;
					}
					;
				}
				{
					;
					{
						;
						doc \* The total mass of the engine shall be less than or equal to the required mass.*\
						;
						;
						;
					}
					{
						;
						;
					}
					{
						;
						{
							;
						}
						;
					}
					;
				}
				{
					;
				}
			}
		}
		package Engine4Cyl_Variant {
			public import ModelingMetadata::*;
			{
				;
			}
			{
				;
				;
				;
				;
				;
			}
		}
		package WheelHubAssemblies {
			{
				{
					{
						;
					}
				}
				{
					{
						;
					}
				}
				{
					;
					;
				}
			}
			{
				{
					{
						;
					}
				}
				{
					{
						;
					}
				}
				{
					;
					;
					{
						;
						;
					}
				}
			}
			{
				{
					{
						{
							;
							;
						}
						;
						;
						;
					}
				}
				{
					{
						{
							;
							;
							;
						}
						;
						;
						;
					}
				}
				{
					;
					;
					{
						;
						;
						;
					}
					{
						;
						;
						;
					}
					{
						;
						;
						;
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
				{
					;
					;
				}
			}
			calc def FuelConsumption {
				;
				;
				;
				;
				;
			}
			calc def AverageTravelTimePerDistance {
				;
				;
			}
			calc def TraveledDistance {
				;
				;
			}
			calc def IdlingFuelConsumptionPerTime {
				;
				;
				;
			}
			;
			calc def BestFuelConsumptionPerDistance {
				;
				;
				;
				;
				;
				{
					;
				}
				;
			}
			calc def ComputeBSFC {
				;
				;
			}
			{
				;
				{
					;
					doc \* estimate the vehicle fuel economy*\
					{
						;
					}
					;
				}
				;
				;
				;
				;
				;
				;
				;
			}
		}
		package ElectricalPowerAnalysis;
		package ReliabilityAnalyis;
		package VehicleTradeOffAnalysis {
			comment about \* The following example provides the rationale for selecting the engine4cyl. 
The rationale and risk are contained in a metadata library. *\
			{
				;
				;
			}
			{
				;
				;
				;
				;
			}
			{
				{
					;
					;
				}
			}
			public import TradeStudies::*;
			calc def EngineEvaluation {
				;
				;
				;
				;
				;
			}
			calc def EngineEvaluation_4cyl {
				;
				;
				;
				;
				;
			}
			calc def EngineEvaluation_6cyl {
				;
				;
				;
				;
				;
			}
			{
				;
				{
					{
						;
						;
						;
						;
						;
					}
				}
				{
					{
						;
						;
						;
						;
						;
					}
				}
				{
					;
					;
				}
				comment about \* Select vehicle alternative with the engine whose evaluation function returns the max value*\
				{
					;
					;
				}
				{
					;
					;
				}
				;
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
				;
				{
					;
					;
				}
				;
			}
			verification def AccelerationTest {
				;
				{
					;
					;
				}
				;
			}
			verification def ReliabilityTest {
				;
				{
					;
					;
				}
				;
			}
		}
		package VerificationCases1 {
			{
				;
				;
				{
					;
					{
						;
						;
						;
					}
					;
				}
				{
					;
				}
				{
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				;
				;
			}
		}
		package VerificationSystem {
			{
				;
				;
				{
					{
						;
					}
					{
						;
					}
				}
			}
		}
	}
	package VehicleIndividuals {
		{
			{
				{
					;
					{
						;
						;
					}
					{
						;
						;
						;
						{
							;
							;
						}
					}
				}
				{
					;
					{
						;
						;
					}
					{
						;
						;
						;
						{
							;
							;
						}
					}
				}
				{
					;
					{
						;
						;
					}
					{
						;
						;
						;
						{
							;
							;
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
				;
				{
					;
					;
					{
						;
						{
							;
							;
						}
						;
					}
					{
						;
						{
							;
							;
							;
						}
						{
							;
							;
						}
						;
					}
					{
						;
						{
							;
							;
							;
						}
						{
							;
							;
						}
						;
					}
				}
			}
			part def Passenger;
			{
				;
				;
			}
			use case def TransportPassenger {
				{
					;
					doc \* deliver passenger to destination safely, comfortably, and within acceptable time*\
					{
						;
					}
					;
				}
				;
				;
				;
				;
				;
				{
					;
					{
						;
						;
					}
					;
				}
				{
					;
					{
						;
						;
					}
					;
				}
				;
			}
			{
				;
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
				;
			}
			use case def GetInVehicle {
				;
				;
				;
				{
					;
				}
				{
					;
					;
				}
				;
			}
			{
				;
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
				;
			}
			use case def GetOutOfVehicle {
				;
				;
				;
				{
					;
				}
				{
					;
					;
				}
				;
			}
		}
		package TransportPassengerScenario {
			public import TransportPassenger;
			{
				;
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				;
			}
			{
				;
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
					;
					;
				}
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
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
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
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
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
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				{
					;
					;
				}
				;
			}
		}
		{
			{
				;
			}
			;
			;
			{
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
			{
				;
				;
				;
				;
				;
				;
				;
				;
			}
			{
				;
				;
				;
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
	package VehicleSuperSetModel {
		comment about \* all of vehicleFamily is included in the superset model to enable subsetting a specific vehicle configuration*\
		package VariationPointDefinitions {
			variation part def TransmissionChoices {
				;
				;
			}
		}
		package VehiclePartsTree {
			public import VariationPointDefinitions;
			{
				{
					;
					{
						{
							{
								;
								;
							}
						}
					}
				}
				;
				;
				{
					;
				}
				;
				;
				;
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
				;
				;
			}
			viewpoint def SafetyViewpoint {
				;
				{
					;
					;
				}
				;
			}
			part def SafetyEngineer;
			concern def VehicleSafety {
				;
				doc \* identify system safety features *\
				;
				;
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
			view def PartsTreeView;
			view def PartsInterconnection;
		}
		package VehicleViews {
			public import ViewpointDefinitions;
			public import ViewDefinitions;
			public import VehicleConfiguration_b;
			{
				{
					;
					;
				}
				protected PartsTree;
			}
		}
	}
}

