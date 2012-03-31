<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:dir="http://directory.gov.au"
xmlns:foaf="http://"
>
<xsl:output indent="yes" />
<xsl:template match="/">
 <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:foaf="http://xmlns.com/foaf/0.1/"
        xmlns:fc="http://xmlns.com/foaf/corp#"
        xmlns:dc="http://purl.org/dc/elements/1.1/">


    <xsl:for-each select="//dir:organization">
        <xsl:variable name="UUID" select="@UUID"/>
        <foaf:Organization rdf:about="http://www.directory.gov.au/directory?ea0_lfz99_120.&amp;&amp;{$UUID}">
            <foaf:name><xsl:value-of select="dir:name" /></foaf:name>

            <xsl:if test="dir:description">
                <dc:description><xsl:value-of select="dir:description" /></dc:description>
            </xsl:if>

            <xsl:if test="dir:website">
                <foaf:homepage><xsl:value-of select="dir:website" /></foaf:homepage>
            </xsl:if>


        <xsl:for-each select="dir:organizationalUnit">
            <xsl:variable name="group_UUID" select="@UUID"/>
            <foaf:member rdf:resource="http://www.directory.gov.au/directory?ea0_lfz99_120.&amp;&amp;{$group_UUID}" />
        </xsl:for-each>

        <xsl:for-each select="dir:person">
            <xsl:variable name="person_UUID" select="@UUID"/>
            <foaf:member rdf:resource="http://www.directory.gov.au/directory?ea0_lfz99_120.&amp;&amp;{$person_UUID}" />
        </xsl:for-each>

        </foaf:Organization>
    </xsl:for-each>


    <xsl:for-each select="//dir:organizationalUnit">
        <xsl:variable name="group_UUID" select="@UUID"/>

        <!-- Organisation unit -->
        <foaf:Group rdf:about="http://www.directory.gov.au/directory?ea0_lfz99_120.&amp;&amp;{$group_UUID}">
            <foaf:name><xsl:value-of select="dir:name" /></foaf:name>

            <xsl:if test="dir:description">
                <dc:description><xsl:value-of select="dir:description" /></dc:description>
            </xsl:if>

            <xsl:if test="dir:website">
                <foaf:homepage><xsl:value-of select="dir:website" /></foaf:homepage>
            </xsl:if>

            <xsl:for-each select="dir:person">
                <xsl:variable name="person_UUID" select="@UUID"/>
                <foaf:member rdf:resource="http://www.directory.gov.au/directory?ea0_lfz99_120.&amp;&amp;{$person_UUID}" />
            </xsl:for-each>
        </foaf:Group>
    </xsl:for-each>

    <xsl:for-each select="//dir:person">
        <xsl:variable name="person_UUID" select="@UUID"/>

        <!-- Organisation unit -->
        <foaf:Person rdf:about="http://www.directory.gov.au/directory?ea0_lfz99_120.&amp;&amp;{$person_UUID}">
            <foaf:name><xsl:value-of select="dir:fullName" /></foaf:name>
            <foaf:givenName><xsl:value-of select="dir:firstName" /></foaf:givenName>
            <foaf:familyName><xsl:value-of select="dir:familyName" /></foaf:familyName>
            <foaf:honorificPrefix><xsl:value-of select="dir:personalTitle" /></foaf:honorificPrefix>

            <foaf:phone><xsl:value-of select="dir:phone" /></foaf:phone>
            <!-- Needs better modelling -->
            <!--
            <foaf:based_near><xsl:value-of select="dir:location" /></foaf:based_near>
            -->

            <xsl:if test="dir:description">
                <dc:description><xsl:value-of select="dir:description" /></dc:description>
            </xsl:if>

            <xsl:if test="dir:website">
                <foaf:homepage><xsl:value-of select="dir:website" /></foaf:homepage>
            </xsl:if>
        </foaf:Person>
    </xsl:for-each>

  </rdf:RDF>
</xsl:template>

</xsl:stylesheet>
