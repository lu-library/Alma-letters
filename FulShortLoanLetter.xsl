<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/> <!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/> <!-- header.xsl -->
				<br/>
				<xsl:call-template name="senderReceiver"/> <!-- SenderReceiver.xsl -->
				<br/>
				<div class="messageArea">
					<div class="messageBody">
						<table border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td>@@title@@  
									<xsl:value-of select="notification_data/item_loan/title"/>
									@@due_back@@  
									<xsl:value-of select="notification_data/due_date"/>
									<xsl:if test="notification_data/has_fine_value='TRUE'">
										@@fine_policy@@  
										<xsl:value-of select="notification_data/amount"/>
										<xsl:value-of select="notification_data/currency_symbol"/>
										@@per@@  
										<xsl:value-of select="notification_data/uom"/>
										.</xsl:if>
									<br/>
									<br/>
								</td>
							</tr>
						</table>
						<br/>
						<table>
							<tr>
								<td>If the item(s) is/are not returned before the due date and time, overdue charges will be added to your Library Account.</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter"/> <!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
