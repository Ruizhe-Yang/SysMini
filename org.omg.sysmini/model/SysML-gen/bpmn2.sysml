package bpmn2 {
	part Definitions_1 : Definitions {
		attribute :>> id = "_VgLhQajBEeK_xvwrSf5u4w";
		attribute :>> expressionLanguage = "http://www.w3.org/1999/XPath";
		attribute :>> typeLanguage = "http://www.w3.org/2001/XMLSchema";
		part Process_1 : Process {
			attribute :>> id = "_VgLhQKjBEeK_xvwrSf5u4w";
			attribute :>> name = "TravelAgency";
			attribute :>> processType = EEnumLiteral [name=None, value=0, instance=None, literal=None, ];
			part Task_1 : Task {
				attribute :>> id = "_yJjVcKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Chose alternative";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SendTask_1 : SendTask {
				attribute :>> id = "_yp_JAKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Send credit card information";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part StartEvent_1 : StartEvent {
				attribute :>> id = "_5F1LEKjBEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part MessageEventDefinition_1 : MessageEventDefinition {
					attribute :>> id = "_5lGhAKjBEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_1 : SequenceFlow {
				attribute :>> id = "_6Y-N8KjBEeK_xvwrSf5u4w";
			}
			part ParallelGateway_1 : ParallelGateway {
				attribute :>> id = "_9dquAKjBEeK_xvwrSf5u4w";
				attribute :>> gatewayDirection = EEnumLiteral [name=Unspecified, value=0, instance=Unspecified, literal=Unspecified, ];
			}
			part SequenceFlow_2 : SequenceFlow {
				attribute :>> id = "_9drVEKjBEeK_xvwrSf5u4w";
			}
			part ManualTask_1 : ManualTask {
				attribute :>> id = "__M0-gKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Search hotel room";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_3 : SequenceFlow {
				attribute :>> id = "__M1lkKjBEeK_xvwrSf5u4w";
			}
			part ManualTask_2 : ManualTask {
				attribute :>> id = "__vFXAKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Search Flight";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_4 : SequenceFlow {
				attribute :>> id = "__vF-EKjBEeK_xvwrSf5u4w";
			}
			part ManualTask_3 : ManualTask {
				attribute :>> id = "_GvXi4KjCEeK_xvwrSf5u4w";
				attribute :>> name = "Evaluate Flight within customer critaria";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_5 : SequenceFlow {
				attribute :>> id = "_GvYJ8KjCEeK_xvwrSf5u4w";
			}
			part ParallelGateway_2 : ParallelGateway {
				attribute :>> id = "_H5i3AKjCEeK_xvwrSf5u4w";
				attribute :>> gatewayDirection = EEnumLiteral [name=Unspecified, value=0, instance=Unspecified, literal=Unspecified, ];
			}
			part SequenceFlow_6 : SequenceFlow {
				attribute :>> id = "_H5jeEKjCEeK_xvwrSf5u4w";
			}
			part ManualTask_4 : ManualTask {
				attribute :>> id = "_JAQncKjCEeK_xvwrSf5u4w";
				attribute :>> name = "Evaluate hotels within customer critaria";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_7 : SequenceFlow {
				attribute :>> id = "_JAR1kKjCEeK_xvwrSf5u4w";
			}
			part SequenceFlow_8 : SequenceFlow {
				attribute :>> id = "_Lmr3IKjCEeK_xvwrSf5u4w";
			}
			part ManualTask_5 : ManualTask {
				attribute :>> id = "_QD63cKjCEeK_xvwrSf5u4w";
				attribute :>> name = "Package flights and hotels for customer review";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_9 : SequenceFlow {
				attribute :>> id = "_QD8FkKjCEeK_xvwrSf5u4w";
			}
			part ManualTask_6 : ManualTask {
				attribute :>> id = "_REim8KjCEeK_xvwrSf5u4w";
				attribute :>> name = "Present flights and hotels to customer";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_10 : SequenceFlow {
				attribute :>> id = "_REj1EKjCEeK_xvwrSf5u4w";
			}
			part SequenceFlow_11 : SequenceFlow {
				attribute :>> id = "_VNq_gajCEeK_xvwrSf5u4w";
			}
			part StartEvent_2 : StartEvent {
				attribute :>> id = "_fl4wgKjCEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part MessageEventDefinition_2 : MessageEventDefinition {
					attribute :>> id = "_1pBQgKjCEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_12 : SequenceFlow {
				attribute :>> id = "_fl5XkKjCEeK_xvwrSf5u4w";
			}
			part StartEvent_3 : StartEvent {
				attribute :>> id = "_gLpI8KjCEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part MessageEventDefinition_3 : MessageEventDefinition {
					attribute :>> id = "_2nV58KjCEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_13 : SequenceFlow {
				attribute :>> id = "_gLpwAKjCEeK_xvwrSf5u4w";
			}
			part StartEvent_4 : StartEvent {
				attribute :>> id = "_gsrZcKjCEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part TimerEventDefinition_1 : TimerEventDefinition {
					attribute :>> id = "_2KgM8KjCEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_14 : SequenceFlow {
				attribute :>> id = "_gssAgKjCEeK_xvwrSf5u4w";
			}
			part EventBasedGateway_1 : EventBasedGateway {
				attribute :>> id = "_mKHSgKjCEeK_xvwrSf5u4w";
				attribute :>> gatewayDirection = EEnumLiteral [name=Unspecified, value=0, instance=Unspecified, literal=Unspecified, ];
				attribute :>> eventGatewayType = EEnumLiteral [name=Parallel, value=0, instance=Parallel, literal=Parallel, ];
			}
			part SequenceFlow_15 : SequenceFlow {
				attribute :>> id = "_nVHtEKjCEeK_xvwrSf5u4w";
			}
			part SequenceFlow_16 : SequenceFlow {
				attribute :>> id = "_n03kIKjCEeK_xvwrSf5u4w";
			}
			part SequenceFlow_17 : SequenceFlow {
				attribute :>> id = "_oNSrMKjCEeK_xvwrSf5u4w";
			}
			part SequenceFlow_18 : SequenceFlow {
				attribute :>> id = "_onOOIKjCEeK_xvwrSf5u4w";
			}
			part ManualTask_7 : ManualTask {
				attribute :>> id = "_wHPC8KjCEeK_xvwrSf5u4w";
				attribute :>> name = "Request credit card information";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_19 : SequenceFlow {
				attribute :>> id = "_wHPqAKjCEeK_xvwrSf5u4w";
			}
			part ServiceTask_1 : ServiceTask {
				attribute :>> id = "_xgIIgKjCEeK_xvwrSf5u4w";
				attribute :>> name = "Notify customer to start again";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_20 : SequenceFlow {
				attribute :>> id = "_xgIvkKjCEeK_xvwrSf5u4w";
			}
			part ScriptTask_1 : ScriptTask {
				attribute :>> id = "_zJLxAKjCEeK_xvwrSf5u4w";
				attribute :>> name = "Update  record customer";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_21 : SequenceFlow {
				attribute :>> id = "_zJMYEKjCEeK_xvwrSf5u4w";
			}
			part EndEvent_1 : EndEvent {
				attribute :>> id = "_4iFvYKjCEeK_xvwrSf5u4w";
			}
			part SequenceFlow_22 : SequenceFlow {
				attribute :>> id = "_4iGWcKjCEeK_xvwrSf5u4w";
			}
			part StartEvent_5 : StartEvent {
				attribute :>> id = "_6bfhAKjCEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part LinkEventDefinition_1 : LinkEventDefinition {
					attribute :>> id = "_7pEucKjCEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_23 : SequenceFlow {
				attribute :>> id = "_6bgIEKjCEeK_xvwrSf5u4w";
			}
			part EndEvent_2 : EndEvent {
				attribute :>> id = "__GfQgKjCEeK_xvwrSf5u4w";
			}
			part BoundaryEvent_1 : BoundaryEvent {
				attribute :>> id = "_G5c2gKjDEeK_xvwrSf5u4w";
				attribute :>> cancelActivity = true;
				part TimerEventDefinition_2 : TimerEventDefinition {
					attribute :>> id = "_KEJ38KjDEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_24 : SequenceFlow {
				attribute :>> id = "_NNqmkKjDEeK_xvwrSf5u4w";
			}
			part BoundaryEvent_2 : BoundaryEvent {
				attribute :>> id = "_e_FH0KjFEeKByZYE3SKnNQ";
				attribute :>> cancelActivity = true;
				part MessageEventDefinition_4 : MessageEventDefinition {
					attribute :>> id = "_f9mlkKjFEeKByZYE3SKnNQ";
				}
			}
			part BoundaryEvent_3 : BoundaryEvent {
				attribute :>> id = "_mePoEKjFEeKByZYE3SKnNQ";
				attribute :>> cancelActivity = true;
				part MessageEventDefinition_5 : MessageEventDefinition {
					attribute :>> id = "_oUjXgKjHEeKfxP_htjREQQ";
				}
			}
			part BoundaryEvent_4 : BoundaryEvent {
				attribute :>> id = "_vjRoAKjHEeKfxP_htjREQQ";
				attribute :>> cancelActivity = true;
				part MessageEventDefinition_6 : MessageEventDefinition {
					attribute :>> id = "_wZXigKjHEeKfxP_htjREQQ";
				}
			}
			part BoundaryEvent_5 : BoundaryEvent {
				attribute :>> id = "_7e0soKjKEeKSNoCYL5SGfQ";
				attribute :>> cancelActivity = true;
				part MessageEventDefinition_7 : MessageEventDefinition {
					attribute :>> id = "_8Yp3oKjKEeKSNoCYL5SGfQ";
				}
			}
			part BoundaryEvent_6 : BoundaryEvent {
				attribute :>> id = "_9F0foKjKEeKSNoCYL5SGfQ";
				attribute :>> cancelActivity = true;
				part MessageEventDefinition_8 : MessageEventDefinition {
					attribute :>> id = "_91khkKjKEeKSNoCYL5SGfQ";
				}
			}
			part StartEvent_6 : StartEvent {
				attribute :>> id = "_5Jf-kKjLEeKSNoCYL5SGfQ";
				attribute :>> isInterrupting = true;
			}
			part Task_2 : Task {
				attribute :>> id = "_52XEkKjLEeKSNoCYL5SGfQ";
				attribute :>> name = "Request a trip";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
			}
			part SequenceFlow_25 : SequenceFlow {
				attribute :>> id = "_52aH4KjLEeKSNoCYL5SGfQ";
			}
			part BoundaryEvent_7 : BoundaryEvent {
				attribute :>> id = "_9_kVoKjLEeKSNoCYL5SGfQ";
				attribute :>> cancelActivity = true;
				part MessageEventDefinition_9 : MessageEventDefinition {
					attribute :>> id = "_-ZlYIKjLEeKSNoCYL5SGfQ";
				}
			}
			part SequenceFlow_26 : SequenceFlow {
				attribute :>> id = "_LKKcwKjOEeKSNoCYL5SGfQ";
			}
			part LaneSet_1 : LaneSet {
				attribute :>> id = "_bnUeoKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Customer";
				part Lane_1 : Lane {
					attribute :>> id = "_bnYJAKjBEeK_xvwrSf5u4w";
					attribute :>> name = "Travel booking";
				}
			}
			part LaneSet_2 : LaneSet {
				attribute :>> id = "_gxuG8KjBEeK_xvwrSf5u4w";
				attribute :>> name = "Travel Agency";
				part Lane_2 : Lane {
					attribute :>> id = "_gxuuAKjBEeK_xvwrSf5u4w";
					attribute :>> name = "Travel";
				}
			}
		}
		part Collaboration_1 : Collaboration {
			attribute :>> id = "_mzUyIKjDEeK_xvwrSf5u4w";
			part MessageFlow_1 : MessageFlow {
				attribute :>> id = "_7LA_0KjKEeKSNoCYL5SGfQ";
			}
			part MessageFlow_2 : MessageFlow {
				attribute :>> id = "_CF0OwKjLEeKSNoCYL5SGfQ";
			}
			part MessageFlow_3 : MessageFlow {
				attribute :>> id = "_Ns60wKjLEeKSNoCYL5SGfQ";
			}
			part MessageFlow_4 : MessageFlow {
				attribute :>> id = "_Oci64KjLEeKSNoCYL5SGfQ";
			}
			part MessageFlow_5 : MessageFlow {
				attribute :>> id = "_YXW-MKjLEeKSNoCYL5SGfQ";
			}
			part MessageFlow_6 : MessageFlow {
				attribute :>> id = "__TvTQKjLEeKSNoCYL5SGfQ";
			}
		}
	}
}

