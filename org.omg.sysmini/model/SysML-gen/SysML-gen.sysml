package SysML-gen {
	part {
		attribute :>> expressionLanguage = "http://www.w3.org/1999/XPath";
		attribute :>> typeLanguage = "http://www.w3.org/2001/XMLSchema";
		part TravelAgency {
			attribute :>> processType = EEnumLiteral [name=None, value=0, instance=None, literal=None, ];
			attribute :>> isClosed = false;
			attribute :>> isExecutable = false;
			part 'Chose alternative';
			part 'Send credit card information';
			part {
				attribute :>> isInterrupting = true;
				part;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part;
			part {
				attribute :>> isImmediate = false;
			}
			part 'Search hotel room';
			part {
				attribute :>> isImmediate = false;
			}
			part 'Search Flight';
			part {
				attribute :>> isImmediate = false;
			}
			part 'Evaluate Flight within customer critaria';
			part {
				attribute :>> isImmediate = false;
			}
			part;
			part {
				attribute :>> isImmediate = false;
			}
			part 'Evaluate hotels within customer critaria';
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part 'Package flights and hotels for customer review';
			part {
				attribute :>> isImmediate = false;
			}
			part 'Present flights and hotels to customer';
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> isInterrupting = true;
				part;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> isInterrupting = true;
				part;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> isInterrupting = true;
				part;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> instantiate = false;
				attribute :>> eventGatewayType = EEnumLiteral [name=Parallel, value=0, instance=Parallel, literal=Parallel, ];
			}
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part 'Request credit card information';
			part {
				attribute :>> isImmediate = false;
			}
			part 'Notify customer to start again';
			part {
				attribute :>> isImmediate = false;
			}
			part 'Update  record customer';
			part {
				attribute :>> isImmediate = false;
			}
			part;
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> isInterrupting = true;
				part;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part;
			part {
				attribute :>> cancelActivity = true;
				part;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> cancelActivity = true;
				part;
			}
			part {
				attribute :>> cancelActivity = true;
				part;
			}
			part {
				attribute :>> cancelActivity = true;
				part;
			}
			part {
				attribute :>> cancelActivity = true;
				part;
			}
			part {
				attribute :>> cancelActivity = true;
				part;
			}
			part {
				attribute :>> isInterrupting = true;
			}
			part 'Request a trip';
			part {
				attribute :>> isImmediate = false;
			}
			part {
				attribute :>> cancelActivity = true;
				part;
			}
			part {
				attribute :>> isImmediate = false;
			}
			part Customer {
				attribute :>> name = "Customer";
				part 'Travel booking' {
					attribute :>> name = "Travel booking";
				}
			}
			part 'Travel Agency' {
				attribute :>> name = "Travel Agency";
				part Travel {
					attribute :>> name = "Travel";
				}
			}
		}
		part {
			attribute :>> isClosed = false;
			part;
			part;
			part;
			part;
			part;
			part;
		}
	}
}

