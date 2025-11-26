<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
<xsl:template match="/">
	<html>
		<head>
			<xsl:call-template name="generalStyle" />
		</head>
		<body>
			<xsl:call-template name="head" /> <!-- header.xsl -->
			<!-- <xsl:call-template name="senderReceiver" /> SenderReceiver.xsl -->
			<br/>
			<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
			<div class="messageArea">
				<div class="messageBody">
					<table cellspacing="0" cellpadding="5" border="0">
		              <tr>
		              	<td>
							@@bodyTextBeforeLink@@
														<a>
		                        <xsl:attribute name="href">
		                          <xsl:value-of select="notification_data/reset_pw_url" />
		                        </xsl:attribute>
								@@linkLabel@@</a>
							@@bodyTextAfterLink@@<br/>
		                </td>
		              </tr>
		            </table>					
		          </div>
				</div>
			<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
            <xsl:call-template name="myAccount" />
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>