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
		attribute mass :> ISQBase::mass;
	}
	part def Transmission;
	part def AxleAssembly;
	part def Axle {
		port leftMountingPoint : AxleMountIF;
		port rightMountingPoint : AxleMountIF;
	}
	part def Wheel {
		port hub : WheelHubIF;
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
		doc
		/*
		 * The definition of the interface for mounting a Wheel to an Axle. 
		 */
		end axleMount : AxleMountIF;
		end hub : WheelHubIF;
		flow axleMount.transferredTorque to hub.appliedTorque;
	}
}

