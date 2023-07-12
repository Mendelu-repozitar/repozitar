<?xml version="1.0"?>
<!-- 

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

	Developed by DSpace @ Lyncode <dspace@lyncode.com> 
	Following OpenAIRE Guidelines 1.1:
		- http://www.openaire.eu/component/content/article/207

 -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="http://www.lyncode.com/xoai">
	<xsl:output indent="yes" method="xml" omit-xml-declaration="yes" />

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
 
 	<!-- Formatting dc.date.issued -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field/text()">
		<xsl:call-template name="formatdate">
			<xsl:with-param name="datestr" select="." />
		</xsl:call-template>
	</xsl:template>
	
		
	<!-- Removing other dc.date.* -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name!='issued']" />
	
	<!-- Prefixing dc.type -->
	<!--<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field/text()">
		<xsl:call-template name="addPrefix">
			<xsl:with-param name="value" select="." />
			<xsl:with-param name="prefix" select="'info:eu-repo/semantics/'"></xsl:with-param>
		</xsl:call-template>
	</xsl:template> -->
	
	<!-- Prefixing dc.relation -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:field/text()">
		<xsl:call-template name="relation">
			<xsl:with-param name="value" select="." />
			<xsl:with-param name="prefix" select="'info:eu-repo/grantAgreement/'"></xsl:with-param>
		</xsl:call-template>
	</xsl:template> 
	
	<!-- Prefixing and Modifying dc.type -->
	<!-- Removing unwanted -->
	<!--<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:element" /> -->
	<!-- Replacing 
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field/text()">
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
			<xsl:when test="contains(., 'C_KNIHA_KAPITOLA')">
				<xsl:text>info:eu-repo/semantics/bookPart</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'N_CERTIFIKOVANÁ METODIKA')">
				<xsl:text>info:eu-repo/semantics/technical documentation</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:template>-->
	
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='version']/doc:element/doc:field/text()">
			<xsl:choose>
			<xsl:when test="contains(., 'OA')">
				<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'openAccess')">
				<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'restrictedAccess')">
				<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
			</xsl:when>
			<xsl:when test="contains(., 'embargoedAccess')">
				<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
			</xsl:when>
			</xsl:choose>
	</xsl:template>

			
	<!-- Prefixing and Modifying dc.rights -->
	<!-- Removing unwanted 
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:element" />-->
	<!-- Replacing  -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element[@name='access']/doc:element/doc:field/text()">
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
			
			<!-- <xsl:otherwise>
				<xsl:text>info:eu-repo/semantics/restrictedAccess</xsl:text>
			</xsl:otherwise> -->
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:field/text()">
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
			
			<!-- <xsl:otherwise>
				<xsl:text>info:eu-repo/semantics/restrictedAccess</xsl:text>
			</xsl:otherwise> -->
		</xsl:choose>
	</xsl:template>
	<!-- Prefixing and Modifying dc.relation -->
	<!-- Removing unwanted -->
	<!-- Removing other dc.relation.* -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element[@name!='uri']" />
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element[@name!='ispartof']" /> 
	
	
	
	<!-- Removing other dc.rights.* other type example: dc.date.uri-->
	<!-- <xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element[@name!='uri']" /> -->

	<!-- AUXILIARY TEMPLATES -->
	
	<!-- dc.type prefixing -->
	<xsl:template name="relation">
		<xsl:param name="value" />
		<xsl:param name="prefix" />
		<xsl:choose>
			<xsl:when test="starts-with($value, $prefix)">
				<xsl:value-of select="$value" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($prefix, $value)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template> 
	
	<!-- dc.relation
	<xsl:template name="addPrefix">
		<xsl:param name="value" />
		<xsl:param name="prefix" />
		<xsl:choose>
			<xsl:when test="starts-with($value, $prefix)">
				<xsl:value-of select="$value" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($prefix, $value)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template> -->
	
	
	<!-- Date format -->
	<xsl:template name="formatdate">
		<xsl:param name="datestr" />
		<xsl:variable name="sub">
			<xsl:value-of select="substring($datestr,1,10)" />
		</xsl:variable>
		<xsl:value-of select="$sub" />
	</xsl:template>
</xsl:stylesheet>
