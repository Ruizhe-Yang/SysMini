package VehicleDefinitions {
	doc /* Example vehicle definitions model.
*/
	private import ScalarValues.ScalarValues::*;
	private import Quantities.Quantities::*;
	private import MeasurementReferences.MeasurementReferences::*;
	private import ISQ.ISQ::*;
	private import SI.SI::*;
	/* PART DEFINITIONS */
	part def Vehicle {
		attribute mass :> ISQBase.mass;
	}
	part def Transmission;
	part def AxleAssembly;
	part def Axle {
		port leftMountingPoint : Ports.ports;
		port rightMountingPoint : Ports.ports;
	}
	part def Wheel {
		port hub : Ports.ports;
	}
	part def Lugbolt {
		attribute tighteningTorque :> ISQMechanics.torque;
	}
	/* PORT DEFINITIONS */
	port def DriveIF {
		driveTorque :> ISQMechanics.torque;
	}
	port def AxleMountIF {
		transferredTorque :> ISQMechanics.torque;
	}
	port def WheelHubIF {
		appliedTorque :> ISQMechanics.torque;
	}
	/* INTERFACE DEFINITIONS */
	interface def Mounting {
		doc /* The definition of the interface for mounting a Wheel to an Axle. */
		end port axleMount : Interfaces.source;
		end port hub : Interfaces.target;
		flow :> Connections.flowConnections axleMount.transferredTorque to hub.appliedTorque;
	}
}

