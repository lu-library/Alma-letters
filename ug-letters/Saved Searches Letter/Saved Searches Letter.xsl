<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
    <xsl:include href="header.xsl" />
    <xsl:include href="footer.xsl" />
    <xsl:include href="style.xsl" />

	<xsl:output method="html"/>
	<xsl:template match="/">
	
	<html>
		<head>
			<xsl:call-template name="generalStyle" />
		</head>
      	<body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
    
    <br/>
	To see all of the results for your saved search click on the following link:
<br/><br/>
	<xsl:element name="a">
		<xsl:attribute name="href">
			<xsl:value-of select="/notification_data/link/node()" disable-output-escaping="yes"/>
		</xsl:attribute>
		<xsl:value-of select="/notification_data/link/node()" disable-output-escaping="yes"/>
	</xsl:element>

		<br/><br/>
The following list contains a maximum of 25 newly added items. Click on a link below to access the item:
		
<br/>
		<ul>		
		<xsl:for-each select="/notification_data/items/saved_searches_letter_item">
			<li>
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="url" disable-output-escaping="yes"/>
				</xsl:attribute>
				<xsl:value-of select="title" disable-output-escaping="yes"/>
			</xsl:element>
			</li>
			<br/>
		</xsl:for-each>
		</ul>

         <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />		
		</body>
    </html>

	</xsl:template>
</xsl:stylesheet>