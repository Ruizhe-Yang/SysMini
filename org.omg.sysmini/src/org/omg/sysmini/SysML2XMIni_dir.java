package org.omg.sysmini;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.omg.sysml.xtext.util.SysML2XMI;


public class SysML2XMIni_dir extends SysML2XMIni {
	//Directory path of 'types.ecore', 'kerml.ecore' and 'SysML.ecore'.
	public static String ecoreDirectoryPath = "E:\\GitYang\\SysMini\\org.omg.sysmini\\metamodel\\sysmlv2";
	//Directory path of the 'sysml.library'.
	public static String libraryDirectoryPath = "E:\\GitYang\\SysMini\\org.omg.sysmini.runtime\\sysml.library";
	//File path of the target file 'xxx.sysml'.
	public static String targetFileDirectory = "E:\\GitYang\\SysMini\\org.omg.sysmini.runtime\\sysml\\src\\examples\\Metadata Examples";
	public static String fileName = null;
	
    public static void main(String[] args) throws IOException {
    	run();
    }
    
    public static void run() throws IOException {
        String[] result = findFiles(libraryDirectoryPath);
        String[] sysmlFilePaths = findFiles(targetFileDirectory);
        
        for (String FilePath : sysmlFilePaths) {
        	targetFilePath = FilePath;
        	System.out.println(targetFilePath+" is transforming...");
        	String[] config = {"-g", targetFilePath};
            String[] arg = mergeArrays(config, result);
            SysML2XMI.main(arg);
        	File libraryDirectory = new File(libraryDirectoryPath);
        	File targetFile = new File(targetFilePath+"x");
    		List<List<String>> ElementIDList = getAllElementHref(targetFile);
    		modifyXMI(libraryDirectory, ElementIDList);
    		deleteFiles(libraryDirectoryPath);
        }
    	System.out.println("SysML2XMIni.java runtime ends.");
    }
}
