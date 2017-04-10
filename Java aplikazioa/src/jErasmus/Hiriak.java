package jErasmus;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import javax.xml.xquery.*;
import javax.xml.namespace.QName;

import com.saxonica.xqj.*;

public class Hiriak {

	/*  Datubasera: nahi izan den funtzionalitatea:
	 *  Hainbat xml dokumentu jaso ondoren, horien edukia 
	 *  sql orri batean laburbiltzen ditu. Kurrikulumek edozein eskema jarrai dezakete,
		ERASMUS nahiz estaturen batena.*/
	
	public static void main(String[] args) throws XQException
	{
		String a_doc;

		String fileName = "output/hiriak.xml";

		if (args.length == 1) {
			a_doc = args[0];
			fileName = "output/"+a_doc.substring(6, a_doc.length()-4)+"_hiriak.xml";			
		}
		else {
			a_doc = "input/estonia.xml";
			fileName = "output/estonia_hiriak.xml";
		}
		
		System.out.println("The input file: "+a_doc);
		System.out.println("");

		// create the data source and expression to process

		XQDataSource xqs = new SaxonXQDataSource(); 
		XQConnection conn = xqs.getConnection();
		XQExpression xqe = conn.createExpression();

		xqe.bindString(new QName("adoc"), a_doc, null);
		
		//XQuery-aren String-a
		String xqueryString = ""+
			"declare variable $adoc external;\n"+
			"let $ikasleak := doc($adoc)/*/node()[node()]\n"+
			"let $hiriak := doc($adoc)/*/node()[node()]/node()[name()='helbidea']/node()[name()='hiria']\n"+
			"return <hiriak>\n"+
			"{for $h in distinct-values($hiriak/text())\n"+
			"    return <hiria izena='{$h}'>\n"+
			"        {for $i in $ikasleak[node()[name()='helbidea']/node()[name()='hiria']/text()=$h]\n"+
			"            return <ikaslea nan='{$i/@nan}'>{$i/node()[name()='izena']/text()} {$i/node()[name()='abizenak']/text()}</ikaslea>\n"+
			"        }\n"+
			"    </hiria>\n"+
			"}\n"+
			"</hiriak>";

		// System.out.println(xqueryString);
		System.out.println("______________________________");
		
		// print the result of the query
		try {

			BufferedWriter bufferedWriter =	new BufferedWriter(new FileWriter(fileName));

			XQResultSequence rs = xqe.executeQuery(xqueryString);

			while(rs.next()){
				String read = rs.getItemAsString(null);
				System.out.println(read);
				bufferedWriter.write(read);
			}

			bufferedWriter.close();
		}
		catch(IOException ex) {
			System.out.println(
					"Error writing to file '"
							+ fileName + "'");
		}

		System.out.println("Finished!!");
		conn.close();
	}
	
}//Eraldatu
