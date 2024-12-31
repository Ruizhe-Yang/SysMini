package dsl {
	private import bpmn2::*;
	private import bpmdi::*;
	private import dc::*;
	private import di::*;
	
	part definition : Definitions{
		
		attribute :>> name = "";
		attribute :>> id = "_VgLhQajBEeK_xvwrSf5u4w";
		attribute :>> targetNamespace = "123";
		
		part process_2 : Process :> rootElements{
			part flowElements_1  : FlowElement :> flowElements{
				part boundaryEvent_1 : BoundaryEvent;
				part task_1 : Task;
				part message_1 : Message;
			}
			part message_1 : Message;
			part message_2 : Message;
			part collaboration_1 :> definitionalCollaborationRef;
		}
		//part rootElements_1 :> rootElements{
		//	part process_1 : Process{
		//		part flowElements_1 :> flowElements{
		//			part boundaryEvent_1 : BoundaryEvent;
		//			part task_1 : Task;
		//			part :> message_1 : Message;
		//		}
		//		part message_1 : Message;
		//		part message_2 : Message;
		//		part collaboration_1 ::> definitionalCollaborationRef;
		//	}
			//part : Collaboration{
			//	part :> messageFlowAssociations{
			//		part messageFlow_1 : MessageFlow{
			//			attribute :>> id = "_7LA_0KjKEeKSNoCYL5SGfQ";
						//ref ::> boundaryEvent_1 :> sourceRef ;
						//ref part :> targetRef;
						
						
						//ref part messageRef_1 : Message;
			//			ref part :>> messageRef = (process_1.message_1, process_1.message_2, process_1.message_2);
						//part :>> messageRef = process_1.message_1;
						//ref messageRef_2 :>> messageRef ::> process_1.message_2;
			//		}
			//	}
			//}
			//part : GlobalBusinessRuleTask;
		//}
	}
	//part diagramElement_1 : DiagramElement{
	//	owingDiagram ::> diagram_1;
		
	//}
	//part diagram_1 : Diagram;
	//part diagram_2 : Diagram;
	//part message_1 : Message;
	//part message_2 : Message;
}

