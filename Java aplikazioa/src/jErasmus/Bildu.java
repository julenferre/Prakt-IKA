package jErasmus;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import javax.xml.xquery.*;
import javax.xml.namespace.QName;

import com.saxonica.xqj.*;

public class Bildu {

	public static void main(String[] args) throws XQException
	{
		String[] a_doc;

		String fileName = "output/bilketa.xml";

		if (args.length > 0) {
			a_doc = new String[args.length];
			for(int i = 0; i < args.length; i++){
				a_doc[i] = args[i];
			}
		}
		else {
			a_doc = new String[3];
			a_doc[0] = "input/estonia.xml";
			a_doc[1] = "input/letonia.xml";
			a_doc[2] = "input/lituania.xml";
		}

		System.out.println("The input files: ");
		for(int i = 0; i < a_doc.length; i++){
			System.out.println(i+". file: "+a_doc[i]);
		}
		System.out.println("");

		// create the data source and expression to process

		XQDataSource xqs = new SaxonXQDataSource(); 
		XQConnection conn = xqs.getConnection();
		XQExpression xqe = conn.createExpression();

		//XQuery-aren String-a
		String xqueryString = "";
		
		//Aldagaien deklarazioa
		for(int i = 0; i < a_doc.length; i++){
			xqe.bindString(new QName("adoc"+i), a_doc[i], null);
			xqueryString += "declare variable $adoc"+i+" external;\n";
		}
		
		//XQueryko aldagaiei datuen esleipena
		for(int i = 0; i < a_doc.length; i++){
			xqueryString += "let $ikasleak"+i+" := doc($adoc"+i+")/*/node()\n";
		}
		
		//return-aren burua
		xqueryString += 
				"return " + 
				"<era:erasmus xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'"+
				"    xmlns:era='www.ehu.eus/erasmus'"+
				"    xmlns='www.ehu.eus/erasmus'>";
		
		//ikasle bakoitzerako kodea
		for(int i = 0; i < a_doc.length; i++){
			xqueryString += "{for $i in $ikasleak"+i+" \n"+
					"		return <ikaslea kodea='{$i/@kodea}' nan='{$i/@nan}' herrialdea='{substring-before(substring-after($adoc"+i+",'/'),'.')}'>\n"+
					"        	{$i/era:izena}\n"+
					"        	{$i/era:abizenak}\n"+
					"        	{$i/era:jaioteguna}\n"+
					"        	{$i/era:helbidea}\n"+
					"        	{$i/era:eposta}\n"+
					"        	{$i/era:telefonoa}\n"+
					"        	{$i/era:notak}\n"+
					"        	{$i/era:praktikak}\n"+
					"       	{$i/era:hizkuntzak}\n"+
					"   	 </ikaslea>\n"+
					"	 }\n";
		}
		
		//returnaren amaiera
		xqueryString += "</era:erasmus>";

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
