<?xml version="1.0" encoding="UTF-8"?>
<sch:schema 
    xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:ns uri="www.ehu.eus/erasmus" prefix="era"/>
    <sch:pattern>        
        <sch:rule id ="nan" context="era:fakultatea">            
            <sch:assert id="nanA" test="era:ikaslea[@era:nan]='^[0-9]{8}[A-Za-z]{1}$'">
                NAN-aren formatua: 8 digitu + hizki bat
                NAN-aren adibidea: 12345678F
            </sch:assert>
        </sch:rule>        
    </sch:pattern>
    <sch:pattern>        
        <sch:rule id ="izena" context="era:ikaslea">            
            <sch:assert id="izenaA" test="era:izena/text()='^([A-Z][a-z]+)(\s([A-Z])([a-z]+)?)?$'">
                Izenak soilik hizkiz osatuta egon behar d(ir)a. Izena(k) letra larriz hasi.
                Tilde gabe. Izenaren adibideak: Peio, Jone, Jose Luis, Maria
            </sch:assert>
        </sch:rule>        
    </sch:pattern>
    <sch:pattern>        
        <sch:rule id ="abizenak" context="era:ikaslea">            
            <sch:assert id="abiizenakA" test="era:abizenak/text()='^([A-Z][a-z]+)(\s([A-Z])([a-z]+))*$'">
                Abizenak soilik hizkiz osatuta egon behar d(ir)a. Abizena(k) letra larriz hasi.
                Tilde gabe. Abizenen adibideak: García, Mendilibar, De Cervantes 
            </sch:assert>
        </sch:rule>        
    </sch:pattern>
    <sch:pattern>        
        <sch:rule id ="eposta" context="era:ikaslea">            
            <sch:assert id="epostaA" test="era:eposta='^([A-Za-z0-9_\-])+(@)([a-z])+\.([a-z])+$'">
                Formatua: erabiltzailea@zerbitzaria.domeinua
                Eposta adibideak: adibidea@pipopipo.eus, info@ehu.eus
            </sch:assert>
        </sch:rule>        
    </sch:pattern>
    <sch:pattern>        
        <sch:rule id ="ingelesa" context="era:ikaslea/hizkuntzak">            
            <sch:assert id="ingelesaA" test="era:hizkuntza/text()='^(([I|i]ng(e)?lesa)|([E|e]nglish))$'">
                Hizkuntzen artean ingelesa egon beharko lirateke
            </sch:assert>
        </sch:rule>        
    </sch:pattern>
    <sch:pattern>        
        <sch:rule id ="gaindituak" context="era:ikaslea/notak">            
            <sch:assert id="gaindituakA" test="era:nota&gt;=5">
                Irakasgai guztiak gaindituak egon beharko lirateke.
            </sch:assert>
            <sch:assert id="notakA" test="era:nota&lt;=10 and era:nota&gt;=0">
                Notak 10-en gainean puntuatzen dira; balioa 0 eta 10-en artean egon beharko lirateke
            </sch:assert>
        </sch:rule>        
    </sch:pattern>
    <sch:pattern>        
        <sch:rule id ="jaioteguna" context="era:ikaslea">            
            <sch:assert id="jaiotegunaA" test="era:jaioteguna/text()='^((19|20)[0-9][0-9])\-((0[1-9])|1[0-2])\-([0-2][0-9]|3[0-1])$'">
                Formatua: UUUU-HH-EE
                Data adibideak: 1931-04-14, 2014-08-16
            </sch:assert>
        </sch:rule>        
    </sch:pattern>
</sch:schema>