<?xml version="1.0"?>

<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
	xmlns:dri="http://di.tamu.edu/DRI/1.0/"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:urlenc="java.net.URLEncoder"
	exclude-result-prefixes="i18n xsl dim dri urlenc">

    
    <!-- display URIs as links in item detail view -->
    <xsl:template match="dim:field" mode="itemDetailView-DIM">
            <xsl:variable name='value'>
              <xsl:choose>

                <xsl:when test="substring(./node(), 1, 7) = 'http://'">
                  <a target="blank">
                    <xsl:attribute name="href">
                      <xsl:copy-of select="./node()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>

				<xsl:when test="./@qualifier = 'author'">
                  <xsl:element name="a">
                      <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
					  <xsl:attribute name="href">https://repozitar.mendelu.cz/xmlui/browse?type=author&amp;value=<xsl:copy-of select="./node()"/> 
					  </xsl:attribute>
					  <xsl:copy-of select="./node()"/> 
				  </xsl:element>
                </xsl:when>


		<xsl:when test="./@qualifier = 'orcid'">
                  <a target="blank">
                    <xsl:attribute name="href">https://orcid.org/orcid-search/search?searchQuery=<xsl:copy-of select="./node()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>


		<xsl:when test="./@qualifier = 'wos'">
                  <a target="blank">
                    <xsl:attribute name="href">https://www.webofscience.com/wos/woscc/full-record/WOS:<xsl:copy-of select="./node()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>



				<xsl:when test="./@element = 'subject'">
                  <xsl:element name="a">
                      <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
					  <xsl:attribute name="href">https://repozitar.mendelu.cz/xmlui/browse?type=subject&amp;value=<xsl:copy-of select="node()"/> 
					  </xsl:attribute>
					  <xsl:copy-of select="./node()"/> 
				  </xsl:element>
                </xsl:when>


				<xsl:when test="./@qualifier = 'uri'">
                  <a target="blank">
                      <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
					  <xsl:attribute name="href"><xsl:copy-of select="./node()"/> 
					  </xsl:attribute>
					  <xsl:copy-of select="./node()"/> 
				  </a>
                </xsl:when>

                <xsl:when test="./@qualifier = 'issn'">
                  <xsl:copy-of select="./node()"/><xsl:text> </xsl:text>
				  <a target="blank">      
					<xsl:attribute name="href">https://www.sherpa.ac.uk/romeo/search.php?issn=<xsl:copy-of select="./node()"/>
                    </xsl:attribute>Sherpa/RoMEO</a>,
                  <a target="blank">
                    <xsl:attribute name="href">http://gateway.isiknowledge.com/gateway/Gateway.cgi?GWVersion=2&amp;SrcAuth=JCR&amp;SrcApp=JCR&amp;DestApp=JCR&amp;PointOfEntry=Impact&amp;KeyRecord=<xsl:copy-of select="./node()"/>
                    </xsl:attribute>JCR</a>			
                </xsl:when>	
				
				<xsl:when test="./@qualifier = 'doi'">
                  <a target="blank">
                    <xsl:attribute name="href">https://dx.doi.org/<xsl:copy-of select="./node()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>
				
				<xsl:when test="./@qualifier = 'scopus'">
                  <a target="blank">
                    <xsl:attribute name="href">https://www.scopus.com/record/display.url?origin=resultslist&amp;eid=<xsl:copy-of select="./node()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>

                <xsl:when test="./@element = 'citation' and not(./@qualifier)">
                </xsl:when>              

                <xsl:when test="./@qualifier = 'rivid'">
                  <a>
                    <xsl:attribute name="href">
                      https://www.rvvi.cz/riv?s=rozsirene-vyhledavani&amp;ss=detail&amp;n=0&amp;h=<xsl:value-of select="urlenc:encode(./node())"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>
                         
                <xsl:when test="./@qualifier = 'scopus'">
                  <a>
                    <xsl:attribute name="href">
                      http://www.scopus.com/record/display.url?origin=resultslist&amp;eid=<xsl:copy-of select="./node()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>
				
                <xsl:when test="./@qualifier = 'wok'">
                  <a>
                    <xsl:attribute name="href">
                      http://apps.webofknowledge.com/InboundService.do?SID=Q2LF9haBaGcldmLAeip&amp;product=WOS&amp;SrcApp=CR&amp;DestFail=http%3A%2F%2Fwww.webofknowledge.com&amp;Init=Yes&amp;action=retrieve&amp;Func=Frame&amp;customersID=Name&amp;SrcAuth=Name&amp;IsProductCode=Yes&amp;mode=FullRecord&amp;UT=<xsl:copy-of select="./node()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>
                
                <xsl:when test="./@qualifier = 'pubmed'">
                  <a>
                    <xsl:attribute name="href">
                      http://www.ncbi.nlm.nih.gov/pubmed?term=<xsl:copy-of select="./node()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>          

                <xsl:when test="./@qualifier = 'nkp'">
                  <a>
                    <xsl:attribute name="href">
                      http://aleph.nkp.cz/F/?func=direct&amp;local_base=SKC&amp;doc_number=<xsl:copy-of select="./node()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="./node()"/>
                  </a>
                </xsl:when>

                <xsl:otherwise>
                  <xsl:copy-of select="./node()"/>
                </xsl:otherwise>

              </xsl:choose>
            </xsl:variable>

          <xsl:if test="not(./@element = 'citation' and not(./@qualifier))">
            <tr>
                <xsl:attribute name="class">
                    <xsl:text>ds-table-row </xsl:text>
                    <xsl:if test="(position() div 2 mod 2 = 0)">even </xsl:if>
                    <xsl:if test="(position() div 2 mod 2 = 1)">odd </xsl:if>
                </xsl:attribute>
                <td class="label-cell">
                    <xsl:value-of select="./@mdschema"/>
                    <xsl:text>.</xsl:text>
                    <xsl:value-of select="./@element"/>
                    <xsl:if test="./@qualifier">
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="./@qualifier"/>
                    </xsl:if>
                </td>
            <td>
              <xsl:copy-of select="$value"/>
              <xsl:if test="./@authority and ./@confidence">
                <xsl:call-template name="authorityConfidenceIcon">
                  <xsl:with-param name="confidence" select="./@confidence"/>
                </xsl:call-template>
              </xsl:if>
            </td>
                <td><xsl:value-of select="./@language"/></td>
            </tr>
          </xsl:if>
    </xsl:template>

</xsl:stylesheet>
