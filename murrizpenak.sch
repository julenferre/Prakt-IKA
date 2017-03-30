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
            <sch:assert id="izenaA" test="era:izena='^([A-Z][a-z]+)(\s([A-Z])([a-z]+)?)?$'">
                Izenak soilik hizkiz osatuta egon behar d(ir)a. Izena(k) letra larriz hasi.
                Tilde gabe. Izenaren adibideak: Peio, Jone, Jose Luis, Maria
            </sch:assert>
        </sch:rule>        
    </sch:pattern>
    <sch:pattern>        
        <sch:rule id ="abizenak" context="era:ikaslea">            
            <sch:assert id="abiizenakA" test="era:abizenak='^([A-Z][a-z]+)(\s([A-Z])([a-z]+))*$'">
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
</sch:schema>