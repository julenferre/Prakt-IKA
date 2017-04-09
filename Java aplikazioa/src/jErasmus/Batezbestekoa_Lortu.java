package jErasmus;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import javax.xml.xquery.*;
import javax.xml.namespace.QName;

import com.saxonica.xqj.*;

public class Batezbestekoa_Lortu {

	public static void main(String[] args) throws XQException
	{
		String a_doc = "input/letonia.xml";
		
	    if (args.length == 1) {
	    	a_doc = args[0];
	    } 
	    
	    System.out.println("The input file: "+a_doc);
	    System.out.println("");
	    
	    // create the data source and expression to process
		
	    XQDataSource xqs = new SaxonXQDataSource(); 
	    XQConnection conn = xqs.getConnection();
	    XQExpression xqe = conn.createExpression();
	    
	    xqe.bindString(new QName("doc"), a_doc, null);
	    
	    String xqueryString = "declare namespace era = 'www.ehu.eus/erasmus';"
	    + "declare variable $doc external;"
	    + "let $books := (doc($doc)//era:nota)"
	    + "for $b in $books return xs:float($b/text())";
	    	    
	    XQResultSequence rs = xqe.executeQuery(xqueryString);
	    
	    float i = 0;
	    int kont = 0;
	    
	    while (rs.next()){
	    	i = i + rs.getFloat();
	    	kont++;
	    }

	    float batazb = i/kont;
	    System.out.println("noten batazbestekoa: "+String.valueOf(batazb));
	    conn.close();
	}
	
}//Eraldatu
