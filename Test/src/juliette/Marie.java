package juliette;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Marie {
		public static void main(String[] args) throws Throwable{
			Document doc;
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder db=factory.newDocumentBuilder();
			doc=db.parse("Cuisine.xml");
			NodeList N=doc.getElementsByTagName("Recette");
			createRecettes(N);
			parcours(N);
			createweb();
		}
		
		static void parcours(NodeList N){
			for(int i=0;i<N.getLength();i++){
				Node n=N.item(i);				
				NodeList children=n.getChildNodes();
				for(int j=0;j<children.getLength();j++){
					Node c=children.item(j);
					if(c.getNodeName().equals("Titre"))
						System.out.println(c.getTextContent());
				}
			}
		}
		
		static void createRecettes(NodeList N) throws Throwable{
			Document doc= DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
			Element root = doc.createElement("Recettes");			
			
			for(int i=0;i<N.getLength();i++){
				Node n=N.item(i);				
				NodeList children=n.getChildNodes();
				for(int j=0;j<children.getLength();j++){
					Node c=children.item(j);
					if(c.getNodeName().equals("Titre")){
						Element T = doc.createElement("Titre");
						T.appendChild(doc.createTextNode(c.getTextContent()));
						root.appendChild(T);												
					}
				}
			}					
			doc.appendChild(root);
			TransformerFactory fac = TransformerFactory.newInstance();
			Transformer transformer = fac.newTransformer();
			transformer.setOutputProperty(OutputKeys.ENCODING, "iso-8859-1");
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.transform(new DOMSource(doc), new StreamResult(System.out));
		}
		
		static void createweb() throws Throwable{
			DocumentBuilderFactory fac=DocumentBuilderFactory.newInstance();
			DocumentBuilder db=fac.newDocumentBuilder();
			Document doc = db.parse("Cuisine.xml");
			//TransformerFactory facto = TransformerFactory.newInstance();
			TransformerFactory facto = new net.sf.saxon.TransformerFactoryImpl();
			Transformer t=facto.newTransformer(new StreamSource("Cuisine.xsl"));
			t.transform(new DOMSource(doc), new StreamResult("C:/Users/h12026079/Desktop/Cuisine.html"));
		}
}
