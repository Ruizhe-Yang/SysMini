package DI {
	private import Ecore::*;
	private import DC::*;
	part def DiagramElement {
		ref owningDiagram [1] : Diagram;
		ref owningElement [1] : DiagramElement;
		ref ownedElement [*] : DiagramElement;
		ref modelElement [1] : EObject;
		ref style [1] : Style;
	}
	part def Diagram {
		attribute name [1] : EString;
		attribute documentation [1] : EString;
		attribute resolution [1] : EFloat;
		ref ownedStyle [*] : Style;
		ref rootElement [1] : DiagramElement;
	}
	part def Style;
	part def Node :> DiagramElement;
	part def Edge :> DiagramElement{
		ref source [1] : DiagramElement;
		ref target [1] : DiagramElement;
		part waypoint [2..*] : Point;
	}
	part def Shape :> Node{
		part bounds [1] : Bounds;
	}
	part def LabeledEdge :> Edge{
		ref ownedLabel [*] : Label;
	}
	part def Label :> Node{
		part bounds [1] : Bounds;
	}
	part def LabeledShape :> Shape{
		ref ownedLabel [*] : Label;
	}
	part def Plane :> Node{
		part planeElement [*] : DiagramElement;
	}
}

