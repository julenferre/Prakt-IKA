<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="www.ehu.eus/erasmus" prefix="era"/>
    <pattern>        
        <rule id ="nan" context="era:fakultatea">            
            <assert id="nanA" test="era:ikaslea[@era:nan]='^[0-9]{8}[A-Za-z]{1}$'">
                NAN-aren formatua: 8 digitu + hizki bat
                NAN-aren adibidea: 12345678F
            </assert>
        </rule>        
    </pattern>
    <pattern>        
        <rule id ="ikaslea" context="era:ikaslea">            
            <assert id="izenaA" test="matches(era:izena,'^([A-Z][a-z]+)(\s([A-Z])([a-z]+)?)?$')">
                Izenak soilik hizkiz osatuta egon behar d(ir)a. Izena(k) letra larriz hasi.
                Tilde gabe. Izenaren adibideak: Peio, Jone, Jose Luis, Maria
            </assert>
            <assert id="abizenakA" test="matches(era:abizenak,'^([A-Z][a-z]+)(\s([A-Z])([a-z]+))*$')">
                Abizenak soilik hizkiz osatuta egon behar d(ir)a. Abizena(k) letra larriz hasi.
                Tilde gabe. Abizenen adibideak: García, Mendilibar, De Cervantes 
            </assert>
            <assert id="epostaA" test="matches(era:eposta,'^([A-Za-z0-9_\-])+(@)([a-z])+\.([a-z])+$')">
                Formatua: erabiltzailea@zerbitzaria.domeinua
                Eposta adibideak: adibidea@pipopipo.eus, info@ehu.eus
            </assert>
            <assert id="jaiotegunaA" test="matches(era:jaioteguna,'^((19|20)[0-9][0-9])\-((0[1-9])|1[0-2])\-([0-2][0-9]|3[0-1])$')">
                Formatua: UUUU-HH-EE
                Data adibideak: 1931-04-14, 2014-08-16
            </assert>
        </rule>        
    </pattern>
    <pattern>        
        <rule id ="ingelesa" context="era:ikaslea/hizkuntzak">            
            <assert id="ingelesaA" test="era:hizkuntza/text()='^(([I|i]ng(e)?lesa)|([E|e]nglish))$'">
                Hizkuntzen artean ingelesa egon beharko lirateke
            </assert>
        </rule>        
    </pattern>
    <pattern>        
        <rule id ="gaindituak" context="era:ikaslea/notak">            
            <assert id="gaindituakA" test="era:nota&gt;=5">
                Irakasgai guztiak gaindituak egon beharko lirateke.
            </assert>
            <assert id="notakA" test="era:nota&lt;=10 and era:nota&gt;=0">
                Notak 10-en gainean puntuatzen dira; balioa 0 eta 10-en artean egon beharko lirateke
            </assert>
        </rule>        
    </pattern>
</schema>