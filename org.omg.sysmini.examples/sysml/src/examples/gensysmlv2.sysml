package VehicleDefinitions {
	doc
	/*
	 * Example vehicle definitions model.
	 */
	private import ScalarValues::*;
	private import Quantities::*;
	private import MeasurementReferences::*;
	private import ISQ::*;
	private import SI::*;
	/* PART DEFINITIONS  */
	part def Vehicle {
		attribute mass :> ISQ::mass;
	}
	part def Transmission;
	part def AxleAssembly;
	part def Axle {
		end leftMountingPoint : AxleMountIF;
		end rightMountingPoint : AxleMountIF;
	}
	part def Wheel {
		end hub : WheelHubIF;
	}
	part def Lugbolt {
		attribute tighteningTorque :> ISQMechanics::torque;
	}
	/* PORT DEFINITIONS  */
	port def DriveIF {
		in driveTorque :> ISQMechanics::torque;
	}
	port def AxleMountIF {
		out transferredTorque :> ISQMechanics::torque;
	}
	port def WheelHubIF {
		in appliedTorque :> ISQMechanics::torque;
	}
	/* INTERFACE DEFINITIONS  */
	interface def Mounting {
		end axleMount : AxleMountIF;
		end hub : WheelHubIF;
		flow axleMount.transferredTorque to hub.appliedTorque;
	}
}

