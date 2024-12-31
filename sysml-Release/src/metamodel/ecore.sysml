package ecore{
	private import ScalarValues::*;
	private import Base::*;
	private import Time::*;
	
	attribute def EString :> String;
	part def EObject :> Anything;
	attribute def EBoolean :> Boolean;
	attribute def EInt :> Integer;
	attribute def EFloat :> Real;
	attribute def BaseElement :> Anything;
	attribute def EDate :> DateTime;
}
