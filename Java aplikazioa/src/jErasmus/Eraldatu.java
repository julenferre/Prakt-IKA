package jErasmus;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import javax.xml.xquery.*;
import javax.xml.namespace.QName;

import com.saxonica.xqj.*;

public class Eraldatu {

	public static void main(String[] args) throws XQException
	{
		String a_doc = "input/estonia.xml";

		String fileName = "output/estonia2letonia.xml";

		System.out.println("The input file: "+a_doc);
		System.out.println("");

		// create the data source and expression to process

		XQDataSource xqs = new SaxonXQDataSource(); 
		XQConnection conn = xqs.getConnection();
		XQExpression xqe = conn.createExpression();

		// Bind variable to expression

		xqe.bindString(new QName("adoc"), a_doc, null);

		String xqueryString = 
				"declare variable $adoc external; \n"+
				"let $ikasleak := doc($adoc)/*/node() \n"+    		
				"\n"+
				"return " + 
				"<era:erasmus xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'"+
				"    xmlns:era='www.ehu.eus/erasmus'"+
				"    xmlns='www.ehu.eus/estonia'"+
				"    xsi:schemaLocation='www.ehu.eus/erasmus estonia.xsd'>"+
				"    "+
				"    {for $i in $ikasleak\n"+
				"		return "+
				"    	<letoniaIkaslea kodea='{$i/@kodea}' nan='{$i/@nan}'> "+
				"       	{$i/era:izena}"+
				"        	{$i/era:abizenak}"+
				"        	{$i/era:jaioteguna}"+
				"        	{$i/era:helbidea}"+
				"        	{$i/era:eposta}"+
				"        	{$i/era:telefonoa}"+
				"        	{$i/era:notak}"+
				"        	{$i/era:praktikak}"+
				"        	{$i/era:hizkuntzak}"+
				"    	</letoniaIkaslea>"+
				"	}"+
				"</era:erasmus>"+
				"";

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
