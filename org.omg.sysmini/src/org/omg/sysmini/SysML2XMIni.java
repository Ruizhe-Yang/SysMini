package org.omg.sysmini;

import org.w3c.dom.*;
import javax.xml.parsers.*;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EStructuralFeature;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;
import org.omg.sysml.xtext.util.SysML2XMI;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;



public class SysML2XMIni {
	
	//Directory path of 'types.ecore', 'kerml.ecore' and 'SysML.ecore'.
	public static String ecoreDirectoryPath = "E:\\GitYang\\SysMini\\org.omg.sysmini\\metamodel\\sysmlv2";
	//Directory path of the 'sysml.library'.
	public static String libraryDirectoryPath = "E:\\GitYang\\SysMini\\org.omg.sysmini.runtime\\sysml.library";
	//File path of the target file 'xxx.sysml'.
	public static String targetFilePath = "E:\\GitYang\\SysMini\\org.omg.sysmini.runtime\\model\\vehicle example\\VehicleDefinitions.sysml";
	//Generate file 'xxx_.sysmlx'.
	public static String fileName = null;
	
    public static void main(String[] args) throws IOException {
    	run();
    }
    
    public static void run() throws IOException {
        String[] result = findFiles(libraryDirectoryPath);
        String[] config = {"-g", targetFilePath};
        String[] arg = mergeArrays(config, result);
		SysML2XMI.main(arg);
    	File libraryDirectory = new File(libraryDirectoryPath);
    	File targetFile = new File(targetFilePath+"x");
		List<List<String>> ElementIDList = getAllElementHref(targetFile);
		modifyXMI(libraryDirectory, ElementIDList);
		deleteFiles(libraryDirectoryPath);
    	System.out.println("SysML2XMIni.java runtime ends.");
    }
    
    public static String[] mergeArrays(String[] array1, String[] array2) {
        String[] mergedArray = new String[array1.length + array2.length];
        System.arraycopy(array1, 0, mergedArray, 0, array1.length);
        System.arraycopy(array2, 0, mergedArray, array1.length, array2.length);
        return mergedArray;
    }
    
//    Return all paths of the library.
    public static String[] findFiles(String folderPath) {
        File folder = new File(folderPath);
        if (!folder.exists() || !folder.isDirectory()) {
            return new String[0];
        }
        StringBuilder resultBuilder = new StringBuilder();
        findFilesRecursive(folder, resultBuilder);
        String resultString = resultBuilder.toString();
        return resultString.isEmpty() ? new String[0] : resultString.split(", ");
    }

    private static void findFilesRecursive(File folder, StringBuilder result) {
        File[] files = folder.listFiles();
        if (files == null) return;
        for (File file : files) {
            if (file.isDirectory()) {
                findFilesRecursive(file, result);
            } else {
                String fileName = file.getName();
                if (fileName.endsWith(".sysml") || fileName.endsWith(".kerml")) {
                    if (result.length() > 0) {
                        result.append(", ");
                    }
                    result.append(file.getAbsolutePath());
                }
            }
        }
    }
    
    public static void deleteFiles(String folderPath) {
        File folder = new File(folderPath);
        if (!folder.exists() || !folder.isDirectory()) {
            System.out.println("Invalid folder path.");
            return;
        }
        deleteFilesRecursive(folder);
    }

    private static void deleteFilesRecursive(File folder) {
        File[] files = folder.listFiles();
        if (files == null) return;

        for (File file : files) {
            if (file.isDirectory()) {
                deleteFilesRecursive(file);
            } else {
                String fileName = file.getName();
                if (fileName.endsWith(".sysmlx") || fileName.endsWith(".kermlx")) {
                    boolean deleted = file.delete();
                    if (deleted) {
                        System.out.println("Deleted: " + file.getAbsolutePath());
                    } else {
                        System.out.println("Failed to delete: " + file.getAbsolutePath());
                    }
                }
            }
        }
    }
    //Delete the href index and add the model name of the index to the declaredName attribute.
    public static void modifyXMI(File directory, List<List<String>> lists) throws IOException {
    	registerEcoreModels();
    	File inputFile = new File(fileName);
        ResourceSetImpl resourceSet = new ResourceSetImpl();
        resourceSet.getResourceFactoryRegistry().getExtensionToFactoryMap().put("sysmlx", new XMIResourceFactoryImpl());
        Resource resource = resourceSet.getResource(URI.createFileURI(inputFile.getAbsolutePath()), true);
    	for (List<String> id : lists) {
    		EObject sourceXMI = getEObject(directory, id.get(1));
    		EObject targetXMI = null;
            for (EObject rootElement : resource.getContents()) {
                boolean found = searchForElementId(rootElement, id.get(0));
                if (found) {
                	targetXMI = getElement(rootElement, id.get(0));
//                    System.out.println("Found element \"" + targetXMI + "\" in file: " + inputFile.getAbsolutePath());
                }
            }
            
            EStructuralFeature declaredShortNameFeature = sourceXMI.eClass().getEStructuralFeature("declaredShortName");
            String newDeclaredShortName = extractBetweenBackslashAndHash(sourceXMI.eResource().getURI().toFileString())+sourceXMI.eGet(declaredShortNameFeature);
            EAttribute declaredShortNameAttribute = getDeclaredNameAttribute(targetXMI);
            if (declaredShortNameAttribute != null) {
            	targetXMI.eSet(declaredShortNameAttribute, newDeclaredShortName);
//            	System.out.println("targetXMI: "+targetXMI);
            }
            
            EStructuralFeature declaredNameFeature = sourceXMI.eClass().getEStructuralFeature("declaredName");
            String newDeclaredName = extractBetweenBackslashAndHash(sourceXMI.eResource().getURI().toFileString())+sourceXMI.eGet(declaredNameFeature);
            EAttribute declaredNameAttribute = getDeclaredNameAttribute(targetXMI);
            if (declaredNameAttribute != null) {
            	targetXMI.eSet(declaredNameAttribute, newDeclaredName);
//            	System.out.println("targetXMI: "+targetXMI);
            }
            
            System.out.println("Delete id:'"+id.get(0)+"' and add '"+newDeclaredName+"'.");
    	}
    	saveXMIFile(resource);

    }
    
    private static EAttribute getDeclaredNameAttribute(EObject eObject) {
        EClass eClass = eObject.eClass();
        return (EAttribute) eClass.getEStructuralFeature("declaredName");
    }
    
    private static String extractBetweenBackslashAndHash(String input) {
        int backslashIndex = input.lastIndexOf('\\');
        if (backslashIndex != -1 ) {
        	return input.substring(backslashIndex + 1, input.length() - 7)+"::";
        }
        return "";
    }

    private static void saveXMIFile(Resource resource) throws IOException {
        resource.save(null);
    }
    
    //Return the ElementID values of all href indexes and their parent nodes in the corresponding file.
    public static List<List<String>> getAllElementHref(File file) {
    	try {
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        factory.setNamespaceAware(true);
	        List<List<String>> strss = new ArrayList<>();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        Document document = builder.parse(file);
	        NodeList nodeList = document.getElementsByTagName("*");
	        for (int i = 0; i < nodeList.getLength(); i++) {
	            Node node = nodeList.item(i);
	            if (node.getNodeType() == Node.ELEMENT_NODE) {
	                Element element = (Element) node;
	                String hrefValue = element.getAttribute("href");
	                if (hrefValue != null && !hrefValue.isEmpty()) {
	                	List<String> strs = new ArrayList<>();
	                	Element parentElement = (Element) element.getParentNode();
	                	String str = getIDString(hrefValue);
	                	if (parentElement != null && parentElement.hasAttribute("elementId")) {
                            String parentElementId = parentElement.getAttribute("elementId");
    	                    strs.add(parentElementId);
    	                    strs.add(str);
    	                    strss.add(strs);
	                	}
	                	parentElement.removeChild(element);
	                }
	            }
	        }
	        fileName = addUnderscoreToExtension(file);
	        saveDocumentToFile(document, fileName);
	        return strss;
	    }catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
    }
    
    private static String addUnderscoreToExtension(File file) {
        String absolutePath = file.getAbsolutePath();
        int dotIndex = absolutePath.lastIndexOf(".");
        if (dotIndex > 0) {
            String filePathWithoutExtension = absolutePath.substring(0, dotIndex);
            String extension = absolutePath.substring(dotIndex);
            return filePathWithoutExtension + "_" + extension;
        } else {
            return absolutePath;
        }
    }
    private static void saveDocumentToFile(Document document, String filePath) {
        try {
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
            StreamResult result = new StreamResult(new File(filePath));
            transformer.transform(new DOMSource(document), result);
            System.out.println("New file: " + filePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private static String getIDString(String href) {
    	String result = null;
    	int lastHashIndex = href.lastIndexOf("#");
    	if (lastHashIndex != -1) {
	    	result = href.substring(lastHashIndex + 1);
    	}
		return result;
    }
    
    private static EObject getEObject(File directory, String elementId) {
    	List<File> files = findModelFiles(directory);  	
		for (File file : files) {
			EObject result = processModelFile(file, elementId);
			if (result != null) {
				return result;
			}
		}
		System.out.println("Not founded "+elementId);
		return null;
    }
    
    private static void registerEcoreModels() {
        try {
        	registerEcoreModel(ecoreDirectoryPath+"\\types.ecore");
        	registerEcoreModel(ecoreDirectoryPath+"\\kerml.ecore");
        	registerEcoreModel(ecoreDirectoryPath+"\\SysML.ecore");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private static void registerEcoreModel(String ecoreFilePath) {
        try {
            ResourceSetImpl resourceSet = new ResourceSetImpl();
            resourceSet.getResourceFactoryRegistry().getExtensionToFactoryMap()
                    .put("ecore", new XMIResourceFactoryImpl());
            Resource resource = resourceSet.getResource(URI.createFileURI(ecoreFilePath), true);
            EPackage ePackage = (EPackage) resource.getContents().get(0);
            EPackage.Registry.INSTANCE.put(ePackage.getNsURI(), ePackage);
            System.out.println("Registered Ecore model: " + ePackage.getName() +
                    " with namespace URI: " + ePackage.getNsURI());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static List<File> findModelFiles(File directory) {
        List<File> modelFiles = new ArrayList<>();

        if (directory != null && directory.isDirectory()) {
            File[] files = directory.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isDirectory()) {
                        modelFiles.addAll(findModelFiles(file));
                    } else if (file.getName().endsWith(".sysmlx") || file.getName().endsWith(".kermlx")) {
                        modelFiles.add(file);
                    }
                }
            }
        }
        return modelFiles;
    }


    private static EObject processModelFile(File file, String targetElementId) {
        try {
            ResourceSetImpl resourceSet = new ResourceSetImpl();
            resourceSet.getResourceFactoryRegistry().getExtensionToFactoryMap()
                    .put("sysmlx", new XMIResourceFactoryImpl());
            resourceSet.getResourceFactoryRegistry().getExtensionToFactoryMap()
                    .put("kermlx", new XMIResourceFactoryImpl());
            Resource resource = resourceSet.getResource(URI.createFileURI(file.getAbsolutePath()), true);
            for (EObject rootElement : resource.getContents()) {
                boolean found = searchForElementId(rootElement, targetElementId);
                if (found) {
                	EObject element = getElement(rootElement, targetElementId);
                    System.out.println("Found element in file: " + file.getAbsolutePath());
//                    System.out.println("rootElement: "+rootElement.eClass());
                    return element;
                }
            }
        } catch (Exception e) {
            System.err.println("Error processing file: " + file.getAbsolutePath());
            e.printStackTrace();
        }
//        System.out.println("Not founded.");
        return null;
        
    }
    
    
    private static boolean searchForElementId(EObject eObject, String targetElementId) {
        EStructuralFeature elementIdFeature = eObject.eClass().getEStructuralFeature("elementId");
        Object elementId = eObject.eGet(elementIdFeature);
        if (elementId != null && elementId.equals(targetElementId)) {
            return true;
        }
        for (EObject child : eObject.eContents()) {
            if (searchForElementId(child, targetElementId)) {
                return true;
            }
        }
        return false;
    }
    
    private static EObject getElement(EObject eObject, String targetElementId) {
        EStructuralFeature elementIdFeature = eObject.eClass().getEStructuralFeature("elementId");
        Object elementId = eObject.eGet(elementIdFeature);
        if (elementId != null && elementId.equals(targetElementId)) {
            return eObject;
        }
        for (EObject child : eObject.eContents()) {
            if (searchForElementId(child, targetElementId)) {
                return getElement(child, targetElementId);
            }
        }
        return null;
    }
    
}
