package Packets {
	private import ScalarValues::*;
	private import Time::*;
	attribute 'packet header' :> Base::dataValues;
	attribute 'packet data field' :> Base::dataValues {
		attribute 'packet secondary header' :>> packet header;
		attribute 'user data field' :> Base::dataValues;
	}
	part def 'Data Packet' {
		attribute 'packet primary header' :>> packet header {
			attribute 'packet version number' : Integer;
			attribute 'packet identification' : String;
			attribute 'packet data length' : Integer;
		}
		attribute :>> packet data field;
	}
	part def 'Thermal Data Packet' :> 'Data Packet'{
		attribute 'packet data field' :>> packet data field {
			attribute 'packet secondary header' :>> packet header {
				attribute 'packet timestamp' : Time::DateTime;
				attribute 'telemetry packet type' : String;
			}
			attribute 'user data field' :>> user data field {
				attribute timestamp : Time::DateTime;
				attribute temperature : Real;
			}
		}
	}
}

