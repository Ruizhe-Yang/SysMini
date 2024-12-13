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
			part def Vehicle;
			part def Engine;
			part def StarterMotor;
			part def Cylinder;
			part def Transmission;
			part def Driveshaft;
			part def AxleAssembly;
			part def Axle;
			part def FrontAxle;
			part def HalfAxle;
			part def Differential;
			part def Wheel;
			part def Hub;
			abstract part def Software;
			part def VehicleSoftware;
			part def VehicleController;
			part def CruiseController;
			part def SpeedSensor;
			part def FuelTank;
			part def BodyAssy;
			part def Body;
			part def Thermostat;
			part def WaterHose;
			part def Road;
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
			port def IgnitionCmdPort;
			port def StatusPort;
			port def GearPort;
			port def PwrCmdPort;
			port def FuelCmdPort;
			port def FuelPort;
			port def DrivePwrPort;
			port def ShaftPort_a;
			port def ShaftPort_b;
			port def ShaftPort_c;
			port def ShaftPort_d;
			port def DiffPort;
			port def AxlePort;
			port def AxleToWheelPort;
			port def WheelToAxlePort;
			port def WheelToRoadPort;
			port def LugNutCompositePort;
			port def ShankCompositePort;
			port def LugNutPort;
			port def ShankPort;
			port def VehicleToRoadPort;
			port def ControlPort;
			port def CruiseControlPort;
			port def SpeedSensorPort;
			port def SetSpeedPort;
			port def DriverCmdPort;
			port def HandPort;
		}
		package ItemDefinitions {
			item def PwrCmd;
			item def FuelCmd;
			item def Fuel;
			item def SensedSpeed;
		}
		package SignalDefinitions {
			item def Cmd;
			item def DriverCmd;
			item def IgnitionCmd;
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
			interface def EngineToTransmissionInterface;
			interface def FuelInterface;
			interface def WheelFastenerInterface;
			interface def WheelHubInterface;
		}
		package AllocationDefinitions {
			allocation def LogicalToPhysical;
		}
		package ActionDefinitions {
			action def ProvidePower;
			action def GenerateTorque;
			action def AmplifyTorque;
			action def TransferTorque;
			action def DistributeTorque;
			action def PerformSelfTest;
			action def ApplyParkingBrake;
			action def SenseTemperature;
		}
		package StateDefinitions {
			state def VehicleStates;
			state def ControllerStates;
			state def CruiseControllerStates;
		}
		package RequirementDefinitions {
			requirement def MassRequirement;
			requirement def ReliabilityRequirement;
			requirement def TorqueGenerationRequirement;
			requirement def DrivePowerOutputRequirement;
			requirement def FuelEconomyRequirement;
		}
		package AttributeDefinitions {
			public import ScalarValues::*;
			public import Quantities::*;
			public import MeasurementReferences::null;
			public import SIPrefixes::null;
			public import NumericalFunctions::*;
			public import SI::*;
			public import USCustomaryUnits::*;
			enum def;
			enum def;
			attribute cylinderDiameter :  [;
			enum def;
			enum def;
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
			metadata def Safety;
			metadata def Security;
		}
		package KeyWord_MetadataDefinitions {
			public import Metaobjects::null;
			;
			metadata def <fm> failureMode;
			occurrence logicalOccurrences [*];
			metadata def <l> logical;
			occurrence physicalOccurrences [*];
			metadata def <p> physical;
		}
		package GenericContext {
			part def Context;
		}
	}
	package VehicleLogicalConfiguration {
		package PartsTree {
			part vehicleLogical;
		}
	}
	package VehicleLogicalToPhysicalAllocation {
		public import PartsTree;
		public import PartsTree;
		;
	}
	package VehicleConfigurations {
		package VehicleConfiguration_a {
			package PartsTree {
				part vehicle_a : ;
			}
			package ActionTree;
			package Requirements;
		}
		package VehicleConfiguration_b {
			public import ShapeItems::null;
			public import ParametersOfInterestMetadata::null;
			public import ModelingMetadata::*;
			package PartsTree {
				part vehicle_b : ;
			}
			package ActionTree {
				;
				;
				;
				;
			}
			package DiscreteInteractions {
				package Sequence {
					part def Driver;
					part part0;
				}
				occurrence CruiseControl1;
				occurrence CruiseControl2;
			}
			package Requirements {
				public import RequirementDerivation::*;
				public import ModelingMetadata::*;
				item marketSurvey :> Items::items;
				;
				;
				;
				;
			}
		}
		package Engine4Cyl_Variant {
			public import ModelingMetadata::*;
			part engine : ;
			part engine4Cyl :> ;
			;
		}
		package WheelHubAssemblies {
			part wheelHubAssy1;
			part wheelHubAssy2;
			part wheelHubAssy3;
		}
	}
	package VehicleAnalysis {
		public import RiskMetadata::*;
		public import RiskMetadata::RiskLevelEnum;
		public import VehicleConfiguration_b;
		package FuelEconomyAnalysisModel {
			public import SampledFunctions::null;
			attribute def Scenario;
			calc def FuelConsumption;
			calc def AverageTravelTimePerDistance;
			calc def TraveledDistance;
			calc def IdlingFuelConsumptionPerTime;
			attribute specificGravityOfGasoline : ScalarValues::Real;
			calc def BestFuelConsumptionPerDistance;
			calc def ComputeBSFC;
			;
		}
		package ElectricalPowerAnalysis;
		package ReliabilityAnalyis;
		package VehicleTradeOffAnalysis {
			public import TradeStudies::*;
			calc def EngineEvaluation;
			calc def EngineEvaluation_4cyl;
			calc def EngineEvaluation_6cyl;
			;
		}
	}
	package VehicleVerification {
		public import VehicleConfiguration_b;
		public import VerificationCaseDefinitions;
		public import VerificationCases1;
		public import VerificationCases::*;
		public import VerificationSystem;
		package VerificationCaseDefinitions {
			verification def MassTest;
			verification def AccelerationTest;
			verification def ReliabilityTest;
		}
		package VerificationCases1 {
			;
		}
		package VerificationSystem {
			part verificationContext;
		}
	}
	package VehicleIndividuals {
		individual occurrence a : ;
	}
	package MissionContext {
		public import VehicleConfiguration_b;
		public import ParametersOfInterestMetadata::null;
		public import TransportPassengerScenario;
		package ContextDefinitions {
			part def MissionContext;
			part def Road;
			part def Driver;
			part def Passenger;
			;
			use case def TransportPassenger;
			;
			use case def GetInVehicle;
			;
			use case def GetOutOfVehicle;
		}
		package TransportPassengerScenario {
			public import TransportPassenger;
			;
			;
		}
		part missionContext : ;
	}
	package VehicleSuperSetModel {
		package VariationPointDefinitions {
			variation part def TransmissionChoices;
		}
		package VehiclePartsTree {
			public import VariationPointDefinitions;
			abstract part vehicleFamily;
		}
	}
	package SafetyandSecurityGroups {
		public import PartsTree;
		package SafetyGroup {
			public import vehicle_b;
		}
		package SecurityGroup {
			public import vehicle_b;
		}
		package SafetyandSecurityGroup {
			public import vehicle_b;
		}
		package MandatorySafetyGroup {
			public import vehicle_b;
		}
	}
	package Views_Viewpoints {
		package ViewpointDefinitions {
			viewpoint def BehaviorViewpoint;
			viewpoint def SafetyViewpoint;
			part def SafetyEngineer;
			concern def VehicleSafety;
		}
		package ViewDefinitions {
			public import Views::*;
			view def TreeView;
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
			view vehiclePartsTree_Safety : ;
		}
	}
}

