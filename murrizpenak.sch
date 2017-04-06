<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="www.ehu.eus/erasmus" prefix="era"/>
    <ns uri="www.ehu.eus/estonia" prefix="est"/>
    <ns uri="www.ehu.eus/letonia" prefix="let"/>
    <ns uri="www.ehu.eus/lituania" prefix="lit"/>
    <pattern>
        <rule id="eposta" context="era:eposta">
            <assert id="epostaA" test="matches(text(),'^([A-Za-z0-9_\-])+(@)([a-z])+\.([a-z])+$')">
                Formatua: erabiltzailea@zerbitzaria.domeinua
                Eposta adibideak: adibidea@pipopipo.eus, info@ehu.eus
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule id="izena" context="era:izena">
            <assert id="izenaA" test="matches(text(),'^([A-Z][a-z]+)(\s([A-Z])([a-z]+)?)?$')">
                Izenak soilik hizkiz osatuta egon behar d(ir)a. Izena(k) letra larriz hasi.
                Tilde gabe. Izenaren adibideak: Peio, Jone, Jose Luis, Maria
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule id="abizenak" context="era:abizenak">
            <assert id="abizenakA" test="matches(text(),'^([A-Z][a-z]+)(\s([A-Z])([a-z]+))*$')">
                Abizenak soilik hizkiz osatuta egon behar d(ir)a. Abizena(k) letra larriz hasi.
                Tilde gabe. Abizenen adibideak: García, Mendilibar, De Cervantes 
            </assert>
        </rule>
    </pattern>
    <pattern>        
        <rule id ="gaindituak" context="era:notak/era:nota">
            <assert id="gaindituakA" test=".&gt;=5">
                Irakasgai guztiak gaindituak egon beharko lirateke.
            </assert>
            <assert id="notakA" test=".&lt;=10 and .&gt;=0">
                Notak 10-en gainean puntuatzen dira; balioa 0 eta 10-en artean egon beharko lirateke
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule id ="batazb" context="era:notak">
            <assert id="batazbA" test="avg(era:nota)&gt;=6">
                Ikaslearen noten batazbestekoa gutxienez 6-koa izan behar da.
            </assert>
        </rule>        
    </pattern>
    <pattern>
        <rule id="ingelesaEstonia" context="est:estoniaIkaslea[year-from-date(era:jaioteguna)&gt;=1995]">
            <assert id="ingelesaEstoniaA" test="era:hizkuntzak/era:hizkuntza/@izena = 'ingelesa'">
                Adin txikikoak ingelesa jakin behar dute
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule id="ingelesaLetonia" context="let:letoniaIkaslea[year-from-date(era:jaioteguna)&gt;=1995]">
            <assert id="ingelesaLetoniaA" test="era:hizkuntzak/era:hizkuntza/@izena = 'ingelesa'">
                Adin txikikoak ingelesa jakin behar dute
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule id="ingelesaLituania" context="lit:lituaniaIkaslea[year-from-date(era:jaioteguna)&gt;=1995]">
            <assert id="ingelesaLituaniaA" test="era:hizkuntzak/era:hizkuntza/@izena = 'ingelesa'">
                Adin txikikoak ingelesa jakin behar dute
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule id="plazaKop" context="era:erasmus">
            <assert id="plazaKopA" test="count(est:estoniaIkaslea)&lt;=@plazaKop">
                Ikasle gehiegi daude (ikusi plaza kopurua)
            </assert>
        </rule>
    </pattern>
</schema>