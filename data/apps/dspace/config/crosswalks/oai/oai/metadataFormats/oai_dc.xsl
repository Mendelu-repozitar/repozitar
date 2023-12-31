<?xml version="1.0" encoding="UTF-8"?>
<!-- 


    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/
	Developed by DSpace @ Lyncode <dspace@lyncode.com>
	
	> http://www.openarchives.org/OAI/2.0/oai_dc.xsd

 -->
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:doc="http://www.lyncode.com/xoai"
	version="1.0">
	<xsl:output omit-xml-declaration="yes" method="xml" indent="yes"/>

    	<xsl:template name="transform-OA">
			<xsl:for-each select ="/doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:field/text()">
			<xsl:choose>
			<xsl:when test="contains(., 'OA')">
				<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'openAccess')">
				<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'restrictedAccess')">
				<xsl:text>info:eu-repo/semantics/restrictedAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'embargoedAccess')">
				<xsl:text>info:eu-repo/semantics/embargoedAccess</xsl:text>
			</xsl:when>
			</xsl:choose>
			</xsl:for-each>
    	</xsl:template>

	
	<xsl:template match="/">
		<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
			xmlns:dc="http://purl.org/dc/elements/1.1/" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
			<!-- dc.title -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
			<!-- dc.title.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
			<!-- dc.creator -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='creator']/doc:element/doc:field[@name='value']">
				<dc:creator><xsl:value-of select="." /></dc:creator>
			</xsl:for-each>
			<!-- dc.contributor.author -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='author']/doc:element/doc:field[@name='value']">
				<dc:creator><xsl:value-of select="." /></dc:creator>
			</xsl:for-each>
			<!-- dc.contributor.* (!author) -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name!='author']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dc.contributor -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element/doc:field[@name='value']">
				<dc:contributor><xsl:value-of select="." /></dc:contributor>
			</xsl:for-each>
			<!-- dc.subject -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element/doc:field[@name='value']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each>
			<!-- dc.subject.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element/doc:element/doc:field[@name='value']">
				<dc:subject><xsl:value-of select="." /></dc:subject>
			</xsl:for-each>
			<!-- dc.description.version -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='version']/doc:element/doc:field[@name='value']">
				<dc:rights>
				<xsl:choose>
			<xsl:when test="contains(., 'OA')">
				<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'openAccess')">
				<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'restrictedAccess')">
				<xsl:text>info:eu-repo/semantics/restrictedAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'embargoedAccess')">
				<xsl:text>info:eu-repo/semantics/embargoedAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'Published Version')">
				<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>info:eu-repo/semantics/restrictedAccess</xsl:text>
			</xsl:otherwise>
			</xsl:choose>			
				</dc:rights>
			</xsl:for-each>
			<!-- dc.description -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!-- dc.description.* (not provenance)-->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name!='provenance']/doc:element/doc:field[@name='value']">
				<dc:description><xsl:value-of select="." /></dc:description>
			</xsl:for-each>
			<!-- dc.date -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>
			<!-- dc.date.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element/doc:element/doc:field[@name='value']">
				<dc:date><xsl:value-of select="." /></dc:date>
			</xsl:for-each>
			<!-- dc.type -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field[@name='value']">
				<dc:type>
				<xsl:choose>
			<xsl:when test="contains(., 'J_ČLÁNEK')">
				<xsl:text>info:eu-repo/semantics/article</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'B_KNIHA - CELEK')">
				<xsl:text>info:eu-repo/semantics/book</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'D_Stať ve sborníku')">
				<xsl:text>info:eu-repo/semantics/conferenceObject</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'C_KNIHA - KAPITOLA')">
				<xsl:text>info:eu-repo/semantics/bookPart</xsl:text>
			</xsl:when>
			<!-- <xsl:when test="contains(., 'C_KNIHA_KAPITOLA')">
				<xsl:text>info:eu-repo/semantics/bookPart</xsl:text>
			</xsl:when> -->
			<xsl:when test="contains(., 'N_CERTIFIKOVANÁ METODIKA')">
				<xsl:text>info:eu-repo/semantics/workingPaper</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'Nmets-Metodiky schválené příslušným orgánem')">
				<xsl:text>info:eu-repo/semantics/workingPaper</xsl:text>
			</xsl:when>	
			<xsl:otherwise>
			<xsl:text>info:eu-repo/semantics/other</xsl:text>
			</xsl:otherwise>

		</xsl:choose>							
				</dc:type>
			</xsl:for-each>
			<!-- dc.type.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:element/doc:field[@name='value']">
				<dc:type><xsl:value-of select="." /></dc:type>
			</xsl:for-each>
			<!-- dc.identifier -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			<!-- dc.identifier.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:element/doc:field[@name='value']">
				<dc:identifier><xsl:value-of select="." /></dc:identifier>
			</xsl:for-each>
			<!-- dc.language -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:field[@name='value']">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>
			<!-- dc.language.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:element/doc:field[@name='value']">
				<dc:language><xsl:value-of select="." /></dc:language>
			</xsl:for-each>
			<!-- dc.relation -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:field[@name='value']">
				<dc:relation>info:eu-repo/grantAgreement/<xsl:value-of select="." /></dc:relation>
			</xsl:for-each>
			<!-- dc.relation.uri -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element[@name='uri']/doc:element/doc:field[@name='value']">
				<dc:identifier.doi><xsl:value-of select="." /></dc:identifier.doi>
			</xsl:for-each>
			<!-- dc.relation.ispartof -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element[@name='ispartof']/doc:element/doc:field[@name='value']">
				<dc:identifier.ispartof><xsl:value-of select="." /></dc:identifier.ispartof>
			</xsl:for-each>
			<!-- local.identifier.doi
			<xsl:for-each select="doc:metadata/doc:element[@name='local']/doc:element[@name='identifier']/doc:element[@name='e-issn']/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="." /></dc:relation>
			</xsl:for-each>-->
			<!-- dc.relation.* 
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:element/doc:field[@name='value']">
				<dc:relation><xsl:value-of select="." /></dc:relation>
			</xsl:for-each>-->
			<!-- dc.rights -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each>
			<!-- dc.rights.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:element/doc:field[@name='value']">
				<dc:rights><xsl:value-of select="." /></dc:rights>
			</xsl:for-each>
			<!-- dc.format -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- dc.format.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element/doc:element/doc:field[@name='value']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- ? -->
			<xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle']/doc:field[@name='name'][text()='ORIGINAL']/../doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='format']">
				<dc:format><xsl:value-of select="." /></dc:format>
			</xsl:for-each>
			<!-- dc.coverage -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:field[@name='value']">
				<dc:coverage><xsl:value-of select="." /></dc:coverage>
			</xsl:for-each>
			<!-- dc.coverage.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:element/doc:field[@name='value']">
				<dc:coverage><xsl:value-of select="." /></dc:coverage>
			</xsl:for-each>
			<!-- dc.publisher -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:field[@name='value']">
				<dc:publisher><xsl:value-of select="." /></dc:publisher>
			</xsl:for-each>
			<!-- dc.publisher.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:element/doc:field[@name='value']">
				<dc:publisher><xsl:value-of select="." /></dc:publisher>
			</xsl:for-each>
			<!-- dc.source -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='source']/doc:element/doc:field[@name='value']">
				<dc:source><xsl:value-of select="." /></dc:source>
			</xsl:for-each>
			<!-- dc.source.* -->
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='source']/doc:element/doc:element/doc:field[@name='value']">
				<dc:source><xsl:value-of select="." /></dc:source>
			</xsl:for-each>
		</oai_dc:dc>
	</xsl:template>
</xsl:stylesheet>

