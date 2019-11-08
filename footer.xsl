<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="salutation">
</xsl:template>
<xsl:template name="lastFooter">
  <table>
    <xsl:attribute name="style">
      <xsl:call-template name="lhdFooterTableStyleCss" /> <!-- style.xsl -->
    </xsl:attribute>
    <tr>
			<td>
				<p>If you have questions and need assistance, please contact us:</p>
				<table>
					<xsl:attribute name="style">
						<xsl:call-template name="lhdFooterTableStyleCss" /> <!-- style.xsl -->
					</xsl:attribute>
					<tbody>
						<tr>
							<td><strong>Paterson</strong></htd>
							<td>(807) 343-8225</td>
					  	<td><a href="mailto:researchhelp@lakeheadu.ca">researchhelp@lakeheadu.ca</a></td>
				  	</tr>
				  <tr>
					  <td><strong>Education</strong></td>
					  <td>(807) 343-8718</td>
					  <td><a href="mailto:edlib@lakeheadu.ca">edlib@lakeheadu.ca</a></td>
				  </tr>
				  <tr>
					  <td><strong>Law</strong></td>
					  <td>(807) 346-7830</td>
					  <td><a href="mailto:law.library@lakeheadu.ca">law.library@lakeheadu.ca</a></td>
				  </tr>
				  <tr>
					  <td><strong>Orillia</strong></td>
					  <td>(705) 330-4008 ext. 2250</td>
					  <td><a href="mailto:orlibrary@lakeheadu.ca">orlibrary@lakeheadu.ca</a></td>
				  </tr>
			  </tbody>
		  </table>
		</td>
	</tr>
    <tr>
	  <td>For more information please visit your <a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT">Library Account</a>.</td>
	</tr>
  </table>
</xsl:template>
<xsl:template name="contactUs">
	<table align="left">
		<tr>
			<td align="left">
				<a>
					<xsl:attribute name="href">
						@@email_contact_us@@
					</xsl:attribute>
					@@contact_us@@
				</a>
			</td>
		</tr>
	</table>
</xsl:template>
<xsl:template name="myAccount">
	<table align="left">
		<tr>
			<td align="left">
				<a>
					<xsl:attribute name="href">
						@@email_my_account@@
					</xsl:attribute>
					@@my_account@@
				</a>
			</td>
		</tr>
	</table>
</xsl:template>
</xsl:stylesheet>