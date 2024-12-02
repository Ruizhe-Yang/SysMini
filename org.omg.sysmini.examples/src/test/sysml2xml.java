package test;

import org.omg.sysml.xtext.util.SysML2XMI;

public class sysml2xml {
	
	public static void main(String[] args) {
		String path ="D:\\EclipseInstallTest\\Sysml-v2-Pilot-Implementation-20241119\\runtime-SysML\\yang.sysml.test2\\model\\vehicle example\\VehicleDefinitions.sysml";
		String path1 = "D:\\EclipseInstallTest\\Sysml-v2-Pilot-Implementation-20241119\\git\\SysML-v2-Pilot-Implementation\\sysml.library\\Kernel Libraries\\Kernel Data Type Library\\ScalarValues.kerml";
		String path2 = "D:\\EclipseInstallTest\\Sysml-v2-Pilot-Implementation-20241119\\git\\SysML-v2-Pilot-Implementation\\sysml.library\\Domain Libraries\\Quantities and Units\\Quantities.sysml";
		String path3 = "D:\\EclipseInstallTest\\Sysml-v2-Pilot-Implementation-20241119\\git\\SysML-v2-Pilot-Implementation\\sysml.library\\Domain Libraries\\Quantities and Units\\MeasurementReferences.sysml";
		String path4 = "D:\\EclipseInstallTest\\Sysml-v2-Pilot-Implementation-20241119\\git\\SysML-v2-Pilot-Implementation\\sysml.library\\Domain Libraries\\Quantities and Units\\ISQ.sysml";
		String path5 = "D:\\EclipseInstallTest\\Sysml-v2-Pilot-Implementation-20241119\\git\\SysML-v2-Pilot-Implementation\\sysml.library\\Domain Libraries\\Quantities and Units\\SI.sysml";
		String arg1[] = {"-g", path, path1, path2, path3, path4, path5};
		SysML2XMI.main(arg1);
		System.out.println("----------------------------------------------------------");
//		String path6 ="D:\\EclipseInstallTest\\Sysml-v2-Pilot-Implementation-20241119\\runtime-SysML\\yang.sysml.test2\\model\\vehicle example\\SysML v2 Spec Annex A SimpleVehicleModel.sysml";
//		String arg2[] = {path6};
//		SysML2XMI.main(arg2);
	}
}
