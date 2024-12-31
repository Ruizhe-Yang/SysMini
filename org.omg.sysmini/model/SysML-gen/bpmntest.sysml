package bpmn2 {
	import bpmn2::*;
	part Definitions_1 : Definitions {
		attribute :>> id = "_VgLhQajBEeK_xvwrSf5u4w";
		attribute :>> expressionLanguage = "http://www.w3.org/1999/XPath";
		attribute :>> typeLanguage = "http://www.w3.org/2001/XMLSchema";
		part :> rootElements = (Process_1, Collaboration_1);
		part Process_1 : Process :> rootElements {
			attribute :>> id = "_VgLhQKjBEeK_xvwrSf5u4w";
			attribute :>> name = "TravelAgency";
			attribute :>> processType = EEnumLiteral [name=None, value=0, instance=None, literal=None, ];
			part :> flowElements = (Task_1, SendTask_1, StartEvent_1, SequenceFlow_1, ParallelGateway_1, SequenceFlow_2, ManualTask_1, SequenceFlow_3, ManualTask_2, SequenceFlow_4, ManualTask_3, SequenceFlow_5, ParallelGateway_2, SequenceFlow_6, ManualTask_4, SequenceFlow_7, SequenceFlow_8, ManualTask_5, SequenceFlow_9, ManualTask_6, SequenceFlow_10, SequenceFlow_11, StartEvent_2, SequenceFlow_12, StartEvent_3, SequenceFlow_13, StartEvent_4, SequenceFlow_14, EventBasedGateway_1, SequenceFlow_15, SequenceFlow_16, SequenceFlow_17, SequenceFlow_18, ManualTask_7, SequenceFlow_19, ServiceTask_1, SequenceFlow_20, ScriptTask_1, SequenceFlow_21, EndEvent_1, SequenceFlow_22, StartEvent_5, SequenceFlow_23, EndEvent_2, BoundaryEvent_1, SequenceFlow_24, BoundaryEvent_2, BoundaryEvent_3, BoundaryEvent_4, BoundaryEvent_5, BoundaryEvent_6, StartEvent_6, Task_2, SequenceFlow_25, BoundaryEvent_7, SequenceFlow_26);
			part :> laneSets = (LaneSet_1, LaneSet_2);
			part Task_1 : Task :> flowElements {
				attribute :>> id = "_yJjVcKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Chose alternative";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> lanes = Lane_1;
				part :> boundaryEventRefs = BoundaryEvent_5;
			}
			part SendTask_1 : SendTask :> flowElements {
				attribute :>> id = "_yp_JAKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Send credit card information";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> lanes = Lane_1;
				part :> boundaryEventRefs = BoundaryEvent_3;
			}
			part StartEvent_1 : StartEvent :> flowElements {
				attribute :>> id = "_5F1LEKjBEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part :> outgoing = (SequenceFlow_1, SequenceFlow_2);
				part :> lanes = Lane_2;
				part :> eventDefinitions = MessageEventDefinition_1;
				part MessageEventDefinition_1 : MessageEventDefinition :> eventDefinitions {
					attribute :>> id = "_5lGhAKjBEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_1 : SequenceFlow :> flowElements {
				attribute :>> id = "_6Y-N8KjBEeK_xvwrSf5u4w";
				part :> sourceRef = StartEvent_1;
			}
			part ParallelGateway_1 : ParallelGateway :> flowElements {
				attribute :>> id = "_9dquAKjBEeK_xvwrSf5u4w";
				attribute :>> gatewayDirection = EEnumLiteral [name=Unspecified, value=0, instance=Unspecified, literal=Unspecified, ];
				part :> outgoing = (SequenceFlow_3, SequenceFlow_4);
				part :> incoming = SequenceFlow_2;
				part :> lanes = Lane_2;
			}
			part SequenceFlow_2 : SequenceFlow :> flowElements {
				attribute :>> id = "_9drVEKjBEeK_xvwrSf5u4w";
				part :> targetRef = ParallelGateway_1;
				part :> sourceRef = StartEvent_1;
			}
			part ManualTask_1 : ManualTask :> flowElements {
				attribute :>> id = "__M0-gKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Search hotel room";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> outgoing = SequenceFlow_7;
				part :> incoming = SequenceFlow_3;
				part :> lanes = Lane_2;
			}
			part SequenceFlow_3 : SequenceFlow :> flowElements {
				attribute :>> id = "__M1lkKjBEeK_xvwrSf5u4w";
				part :> targetRef = ManualTask_1;
				part :> sourceRef = ParallelGateway_1;
			}
			part ManualTask_2 : ManualTask :> flowElements {
				attribute :>> id = "__vFXAKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Search Flight";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> outgoing = SequenceFlow_5;
				part :> incoming = SequenceFlow_4;
				part :> lanes = Lane_2;
			}
			part SequenceFlow_4 : SequenceFlow :> flowElements {
				attribute :>> id = "__vF-EKjBEeK_xvwrSf5u4w";
				part :> targetRef = ManualTask_2;
				part :> sourceRef = ParallelGateway_1;
			}
			part ManualTask_3 : ManualTask :> flowElements {
				attribute :>> id = "_GvXi4KjCEeK_xvwrSf5u4w";
				attribute :>> name = "Evaluate Flight within customer critaria";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> outgoing = SequenceFlow_6;
				part :> incoming = SequenceFlow_5;
				part :> lanes = Lane_2;
				part :> boundaryEventRefs = BoundaryEvent_6;
			}
			part SequenceFlow_5 : SequenceFlow :> flowElements {
				attribute :>> id = "_GvYJ8KjCEeK_xvwrSf5u4w";
				part :> targetRef = ManualTask_3;
				part :> sourceRef = ManualTask_2;
			}
			part ParallelGateway_2 : ParallelGateway :> flowElements {
				attribute :>> id = "_H5i3AKjCEeK_xvwrSf5u4w";
				attribute :>> gatewayDirection = EEnumLiteral [name=Unspecified, value=0, instance=Unspecified, literal=Unspecified, ];
				part :> outgoing = SequenceFlow_9;
				part :> incoming = (SequenceFlow_6, SequenceFlow_8);
				part :> lanes = Lane_2;
			}
			part SequenceFlow_6 : SequenceFlow :> flowElements {
				attribute :>> id = "_H5jeEKjCEeK_xvwrSf5u4w";
				part :> targetRef = ParallelGateway_2;
				part :> sourceRef = ManualTask_3;
			}
			part ManualTask_4 : ManualTask :> flowElements {
				attribute :>> id = "_JAQncKjCEeK_xvwrSf5u4w";
				attribute :>> name = "Evaluate hotels within customer critaria";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> outgoing = SequenceFlow_8;
				part :> incoming = SequenceFlow_7;
				part :> lanes = Lane_2;
			}
			part SequenceFlow_7 : SequenceFlow :> flowElements {
				attribute :>> id = "_JAR1kKjCEeK_xvwrSf5u4w";
				part :> targetRef = ManualTask_4;
				part :> sourceRef = ManualTask_1;
			}
			part SequenceFlow_8 : SequenceFlow :> flowElements {
				attribute :>> id = "_Lmr3IKjCEeK_xvwrSf5u4w";
				part :> targetRef = ParallelGateway_2;
				part :> sourceRef = ManualTask_4;
			}
			part ManualTask_5 : ManualTask :> flowElements {
				attribute :>> id = "_QD63cKjCEeK_xvwrSf5u4w";
				attribute :>> name = "Package flights and hotels for customer review";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> outgoing = SequenceFlow_10;
				part :> incoming = SequenceFlow_9;
				part :> lanes = Lane_2;
			}
			part SequenceFlow_9 : SequenceFlow :> flowElements {
				attribute :>> id = "_QD8FkKjCEeK_xvwrSf5u4w";
				part :> targetRef = ManualTask_5;
				part :> sourceRef = ParallelGateway_2;
			}
			part ManualTask_6 : ManualTask :> flowElements {
				attribute :>> id = "_REim8KjCEeK_xvwrSf5u4w";
				attribute :>> name = "Present flights and hotels to customer";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> outgoing = (SequenceFlow_11, SequenceFlow_15);
				part :> incoming = SequenceFlow_10;
				part :> lanes = Lane_2;
			}
			part SequenceFlow_10 : SequenceFlow :> flowElements {
				attribute :>> id = "_REj1EKjCEeK_xvwrSf5u4w";
				part :> targetRef = ManualTask_6;
				part :> sourceRef = ManualTask_5;
			}
			part SequenceFlow_11 : SequenceFlow :> flowElements {
				attribute :>> id = "_VNq_gajCEeK_xvwrSf5u4w";
				part :> sourceRef = ManualTask_6;
			}
			part StartEvent_2 : StartEvent :> flowElements {
				attribute :>> id = "_fl4wgKjCEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part :> outgoing = SequenceFlow_19;
				part :> incoming = (SequenceFlow_12, SequenceFlow_16);
				part :> lanes = Lane_2;
				part :> eventDefinitions = MessageEventDefinition_2;
				part MessageEventDefinition_2 : MessageEventDefinition :> eventDefinitions {
					attribute :>> id = "_1pBQgKjCEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_12 : SequenceFlow :> flowElements {
				attribute :>> id = "_fl5XkKjCEeK_xvwrSf5u4w";
				part :> targetRef = StartEvent_2;
			}
			part StartEvent_3 : StartEvent :> flowElements {
				attribute :>> id = "_gLpI8KjCEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part :> outgoing = SequenceFlow_21;
				part :> incoming = (SequenceFlow_13, SequenceFlow_18);
				part :> lanes = Lane_2;
				part :> eventDefinitions = MessageEventDefinition_3;
				part MessageEventDefinition_3 : MessageEventDefinition :> eventDefinitions {
					attribute :>> id = "_2nV58KjCEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_13 : SequenceFlow :> flowElements {
				attribute :>> id = "_gLpwAKjCEeK_xvwrSf5u4w";
				part :> targetRef = StartEvent_3;
			}
			part StartEvent_4 : StartEvent :> flowElements {
				attribute :>> id = "_gsrZcKjCEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part :> outgoing = SequenceFlow_20;
				part :> incoming = (SequenceFlow_14, SequenceFlow_17);
				part :> lanes = Lane_2;
				part :> eventDefinitions = TimerEventDefinition_1;
				part TimerEventDefinition_1 : TimerEventDefinition :> eventDefinitions {
					attribute :>> id = "_2KgM8KjCEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_14 : SequenceFlow :> flowElements {
				attribute :>> id = "_gssAgKjCEeK_xvwrSf5u4w";
				part :> targetRef = StartEvent_4;
			}
			part EventBasedGateway_1 : EventBasedGateway :> flowElements {
				attribute :>> id = "_mKHSgKjCEeK_xvwrSf5u4w";
				attribute :>> gatewayDirection = EEnumLiteral [name=Unspecified, value=0, instance=Unspecified, literal=Unspecified, ];
				attribute :>> eventGatewayType = EEnumLiteral [name=Parallel, value=0, instance=Parallel, literal=Parallel, ];
				part :> outgoing = (SequenceFlow_16, SequenceFlow_17, SequenceFlow_18);
				part :> incoming = SequenceFlow_15;
				part :> lanes = Lane_2;
			}
			part SequenceFlow_15 : SequenceFlow :> flowElements {
				attribute :>> id = "_nVHtEKjCEeK_xvwrSf5u4w";
				part :> targetRef = EventBasedGateway_1;
				part :> sourceRef = ManualTask_6;
			}
			part SequenceFlow_16 : SequenceFlow :> flowElements {
				attribute :>> id = "_n03kIKjCEeK_xvwrSf5u4w";
				part :> targetRef = StartEvent_2;
				part :> sourceRef = EventBasedGateway_1;
			}
			part SequenceFlow_17 : SequenceFlow :> flowElements {
				attribute :>> id = "_oNSrMKjCEeK_xvwrSf5u4w";
				part :> targetRef = StartEvent_4;
				part :> sourceRef = EventBasedGateway_1;
			}
			part SequenceFlow_18 : SequenceFlow :> flowElements {
				attribute :>> id = "_onOOIKjCEeK_xvwrSf5u4w";
				part :> targetRef = StartEvent_3;
				part :> sourceRef = EventBasedGateway_1;
			}
			part ManualTask_7 : ManualTask :> flowElements {
				attribute :>> id = "_wHPC8KjCEeK_xvwrSf5u4w";
				attribute :>> name = "Request credit card information";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> outgoing = SequenceFlow_23;
				part :> incoming = SequenceFlow_19;
				part :> lanes = Lane_2;
				part :> boundaryEventRefs = (BoundaryEvent_1, BoundaryEvent_4);
			}
			part SequenceFlow_19 : SequenceFlow :> flowElements {
				attribute :>> id = "_wHPqAKjCEeK_xvwrSf5u4w";
				part :> targetRef = ManualTask_7;
				part :> sourceRef = StartEvent_2;
			}
			part ServiceTask_1 : ServiceTask :> flowElements {
				attribute :>> id = "_xgIIgKjCEeK_xvwrSf5u4w";
				attribute :>> name = "Notify customer to start again";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> outgoing = SequenceFlow_26;
				part :> incoming = (SequenceFlow_20, SequenceFlow_24);
				part :> lanes = Lane_2;
				part :> boundaryEventRefs = BoundaryEvent_2;
			}
			part SequenceFlow_20 : SequenceFlow :> flowElements {
				attribute :>> id = "_xgIvkKjCEeK_xvwrSf5u4w";
				part :> targetRef = ServiceTask_1;
				part :> sourceRef = StartEvent_4;
			}
			part ScriptTask_1 : ScriptTask :> flowElements {
				attribute :>> id = "_zJLxAKjCEeK_xvwrSf5u4w";
				attribute :>> name = "Update  record customer";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> outgoing = SequenceFlow_22;
				part :> incoming = (SequenceFlow_21, SequenceFlow_26);
				part :> lanes = Lane_2;
			}
			part SequenceFlow_21 : SequenceFlow :> flowElements {
				attribute :>> id = "_zJMYEKjCEeK_xvwrSf5u4w";
				part :> targetRef = ScriptTask_1;
				part :> sourceRef = StartEvent_3;
			}
			part EndEvent_1 : EndEvent :> flowElements {
				attribute :>> id = "_4iFvYKjCEeK_xvwrSf5u4w";
				part :> incoming = SequenceFlow_22;
				part :> lanes = Lane_2;
			}
			part SequenceFlow_22 : SequenceFlow :> flowElements {
				attribute :>> id = "_4iGWcKjCEeK_xvwrSf5u4w";
				part :> targetRef = EndEvent_1;
				part :> sourceRef = ScriptTask_1;
			}
			part StartEvent_5 : StartEvent :> flowElements {
				attribute :>> id = "_6bfhAKjCEeK_xvwrSf5u4w";
				attribute :>> isInterrupting = true;
				part :> incoming = SequenceFlow_23;
				part :> lanes = Lane_2;
				part :> eventDefinitions = LinkEventDefinition_1;
				part LinkEventDefinition_1 : LinkEventDefinition :> eventDefinitions {
					attribute :>> id = "_7pEucKjCEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_23 : SequenceFlow :> flowElements {
				attribute :>> id = "_6bgIEKjCEeK_xvwrSf5u4w";
				part :> targetRef = StartEvent_5;
				part :> sourceRef = ManualTask_7;
			}
			part EndEvent_2 : EndEvent :> flowElements {
				attribute :>> id = "__GfQgKjCEeK_xvwrSf5u4w";
				part :> lanes = Lane_1;
			}
			part BoundaryEvent_1 : BoundaryEvent :> flowElements {
				attribute :>> id = "_G5c2gKjDEeK_xvwrSf5u4w";
				attribute :>> cancelActivity = true;
				part :> outgoing = SequenceFlow_24;
				part :> eventDefinitions = TimerEventDefinition_2;
				part :> attachedToRef = ManualTask_7;
				part TimerEventDefinition_2 : TimerEventDefinition :> eventDefinitions {
					attribute :>> id = "_KEJ38KjDEeK_xvwrSf5u4w";
				}
			}
			part SequenceFlow_24 : SequenceFlow :> flowElements {
				attribute :>> id = "_NNqmkKjDEeK_xvwrSf5u4w";
				part :> targetRef = ServiceTask_1;
				part :> sourceRef = BoundaryEvent_1;
			}
			part BoundaryEvent_2 : BoundaryEvent :> flowElements {
				attribute :>> id = "_e_FH0KjFEeKByZYE3SKnNQ";
				attribute :>> cancelActivity = true;
				part :> eventDefinitions = MessageEventDefinition_4;
				part :> attachedToRef = ServiceTask_1;
				part MessageEventDefinition_4 : MessageEventDefinition :> eventDefinitions {
					attribute :>> id = "_f9mlkKjFEeKByZYE3SKnNQ";
				}
			}
			part BoundaryEvent_3 : BoundaryEvent :> flowElements {
				attribute :>> id = "_mePoEKjFEeKByZYE3SKnNQ";
				attribute :>> cancelActivity = true;
				part :> eventDefinitions = MessageEventDefinition_5;
				part :> attachedToRef = SendTask_1;
				part MessageEventDefinition_5 : MessageEventDefinition :> eventDefinitions {
					attribute :>> id = "_oUjXgKjHEeKfxP_htjREQQ";
				}
			}
			part BoundaryEvent_4 : BoundaryEvent :> flowElements {
				attribute :>> id = "_vjRoAKjHEeKfxP_htjREQQ";
				attribute :>> cancelActivity = true;
				part :> eventDefinitions = MessageEventDefinition_6;
				part :> attachedToRef = ManualTask_7;
				part MessageEventDefinition_6 : MessageEventDefinition :> eventDefinitions {
					attribute :>> id = "_wZXigKjHEeKfxP_htjREQQ";
				}
			}
			part BoundaryEvent_5 : BoundaryEvent :> flowElements {
				attribute :>> id = "_7e0soKjKEeKSNoCYL5SGfQ";
				attribute :>> cancelActivity = true;
				part :> eventDefinitions = MessageEventDefinition_7;
				part :> attachedToRef = Task_1;
				part MessageEventDefinition_7 : MessageEventDefinition :> eventDefinitions {
					attribute :>> id = "_8Yp3oKjKEeKSNoCYL5SGfQ";
				}
			}
			part BoundaryEvent_6 : BoundaryEvent :> flowElements {
				attribute :>> id = "_9F0foKjKEeKSNoCYL5SGfQ";
				attribute :>> cancelActivity = true;
				part :> eventDefinitions = MessageEventDefinition_8;
				part :> attachedToRef = ManualTask_3;
				part MessageEventDefinition_8 : MessageEventDefinition :> eventDefinitions {
					attribute :>> id = "_91khkKjKEeKSNoCYL5SGfQ";
				}
			}
			part StartEvent_6 : StartEvent :> flowElements {
				attribute :>> id = "_5Jf-kKjLEeKSNoCYL5SGfQ";
				attribute :>> isInterrupting = true;
				part :> outgoing = SequenceFlow_25;
				part :> lanes = Lane_1;
			}
			part Task_2 : Task :> flowElements {
				attribute :>> id = "_52XEkKjLEeKSNoCYL5SGfQ";
				attribute :>> name = "Request a trip";
				attribute :>> startQuantity = 1;
				attribute :>> completionQuantity = 1;
				part :> incoming = SequenceFlow_25;
				part :> lanes = Lane_1;
				part :> boundaryEventRefs = BoundaryEvent_7;
			}
			part SequenceFlow_25 : SequenceFlow :> flowElements {
				attribute :>> id = "_52aH4KjLEeKSNoCYL5SGfQ";
				part :> targetRef = Task_2;
				part :> sourceRef = StartEvent_6;
			}
			part BoundaryEvent_7 : BoundaryEvent :> flowElements {
				attribute :>> id = "_9_kVoKjLEeKSNoCYL5SGfQ";
				attribute :>> cancelActivity = true;
				part :> eventDefinitions = MessageEventDefinition_9;
				part :> attachedToRef = Task_2;
				part MessageEventDefinition_9 : MessageEventDefinition :> eventDefinitions {
					attribute :>> id = "_-ZlYIKjLEeKSNoCYL5SGfQ";
				}
			}
			part SequenceFlow_26 : SequenceFlow :> flowElements {
				attribute :>> id = "_LKKcwKjOEeKSNoCYL5SGfQ";
				part :> targetRef = ScriptTask_1;
				part :> sourceRef = ServiceTask_1;
			}
			part LaneSet_1 : LaneSet :> laneSets {
				attribute :>> id = "_bnUeoKjBEeK_xvwrSf5u4w";
				attribute :>> name = "Customer";
				part :> lanes = Lane_1;
				part Lane_1 : Lane :> lanes {
					attribute :>> id = "_bnYJAKjBEeK_xvwrSf5u4w";
					attribute :>> name = "Travel booking";
					part :> flowNodeRefs = (Task_1, SendTask_1, EndEvent_2, StartEvent_6, Task_2);
				}
			}
			part LaneSet_2 : LaneSet :> laneSets {
				attribute :>> id = "_gxuG8KjBEeK_xvwrSf5u4w";
				attribute :>> name = "Travel Agency";
				part :> lanes = Lane_2;
				part Lane_2 : Lane :> lanes {
					attribute :>> id = "_gxuuAKjBEeK_xvwrSf5u4w";
					attribute :>> name = "Travel";
					part :> flowNodeRefs = (StartEvent_1, ParallelGateway_1, ManualTask_1, ManualTask_2, ManualTask_3, ParallelGateway_2, ManualTask_4, ManualTask_5, ManualTask_6, StartEvent_2, StartEvent_3, StartEvent_4, EventBasedGateway_1, ManualTask_7, ServiceTask_1, ScriptTask_1, EndEvent_1, StartEvent_5);
				}
			}
		}
		part Collaboration_1 : Collaboration :> rootElements {
			attribute :>> id = "_mzUyIKjDEeK_xvwrSf5u4w";
			part :> messageFlows = (MessageFlow_1, MessageFlow_2, MessageFlow_3, MessageFlow_4, MessageFlow_5, MessageFlow_6);
			part MessageFlow_1 : MessageFlow :> messageFlows {
				attribute :>> id = "_7LA_0KjKEeKSNoCYL5SGfQ";
				part :> sourceRef = BoundaryEvent_6;
				part :> targetRef = Task_1;
			}
			part MessageFlow_2 : MessageFlow :> messageFlows {
				attribute :>> id = "_CF0OwKjLEeKSNoCYL5SGfQ";
				part :> sourceRef = BoundaryEvent_5;
				part :> targetRef = ManualTask_3;
			}
			part MessageFlow_3 : MessageFlow :> messageFlows {
				attribute :>> id = "_Ns60wKjLEeKSNoCYL5SGfQ";
				part :> sourceRef = BoundaryEvent_4;
				part :> targetRef = SendTask_1;
			}
			part MessageFlow_4 : MessageFlow :> messageFlows {
				attribute :>> id = "_Oci64KjLEeKSNoCYL5SGfQ";
				part :> sourceRef = BoundaryEvent_3;
				part :> targetRef = ManualTask_7;
			}
			part MessageFlow_5 : MessageFlow :> messageFlows {
				attribute :>> id = "_YXW-MKjLEeKSNoCYL5SGfQ";
				part :> sourceRef = BoundaryEvent_2;
				part :> targetRef = EndEvent_2;
			}
			part MessageFlow_6 : MessageFlow :> messageFlows {
				attribute :>> id = "__TvTQKjLEeKSNoCYL5SGfQ";
				part :> sourceRef = BoundaryEvent_7;
				part :> targetRef = StartEvent_1;
			}
		}
	}
}

