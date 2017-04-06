package jErasmus;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import javax.xml.xquery.*;
import javax.xml.namespace.QName;

import com.saxonica.xqj.*;

public class DatuBasera {

	public static void main(String[] args) throws XQException
	{
		String a_doc = "input/biblio.xml";

		String fileName = "output/listofbooks.html";

		if (args.length == 1) {
			a_doc = args[0];
		} 

		System.out.println("The input file: "+a_doc);
		System.out.println("");

		// create the data source and expression to process

		XQDataSource xqs = new SaxonXQDataSource(); 
		XQConnection conn = xqs.getConnection();
		XQExpression xqe = conn.createExpression();

		// Bind variable to expression

		xqe.bindString(new QName("adoc"), a_doc, null);

		fileName = "output/listofbooks-"+a_doc.replace(".", "-").replace("/", "-")+".html";


		String xqueryString = 
				"declare variable $adoc external;\n"+
				"let $books := doc($adoc)//book\n"+    		
				"\n"+
				"return <html><h1>List of Books from {$adoc}</h1>\n"+
				"	<ul>\n"+
				"		{for $b in $books\n"+
				"			return <li>{$b/title/text()}</li>} "+
				"	</ul>\n"+
				"</html>\n";

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
