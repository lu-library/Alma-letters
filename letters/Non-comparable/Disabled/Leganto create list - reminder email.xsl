<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
	<xsl:include href="recordTitle.xsl" />
	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

			<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

				<xsl:call-template name="generalStyle" />
			</head>
			<body>
				<xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

				<xsl:call-template name="head" /><!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

				<div class="messageArea">
					<div class="messageBody">

						<table role='presentation'  cellspacing="0" cellpadding="5" border="0"
							style="width:100%; background-color: #f3f7f8; padding: 0px 25px 25px 25px; border-bottom: 2px solid #dce8eb; font-family: 'Source Sans Pro' !important;padding: 25px 0 15px 0;">

							<tr>
								<td style="padding:0 0 5px 10px;">
										@@create_resource_list@@
										"<xsl:value-of select="notification_data/course/code" /> - <xsl:value-of select="notification_data/course/name" />".
								</td>
							</tr>
							
							<tr>
								<td style="padding:0 0 5px 10px;">
										@@latest_date_submission@@
										<xsl:value-of select="notification_data/due_date" />.
										<br/>
								</td>
							</tr>
							<br/>
							
							<tr>
								<td style="padding:0 0 5px 10px;">
										@@share_with_students@@
										@@ensure_access@@
								</td>
							</tr>
							<br/>
							<xsl:if test="notification_data/leganto_url  !=''">
							<tr>
								<td style="padding:0 0 5px 10px;">
									<xsl:element name="a">
										<xsl:attribute name="href">
											<xsl:value-of select="notification_data/leganto_url" />
										</xsl:attribute>
		
										<xsl:attribute name="style">
											<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
										</xsl:attribute>
										@@update_now@@
									</xsl:element>
								</td>
							</tr>
							</xsl:if>
						</table>

						<table>
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
							</xsl:attribute>
					
							 <tr><td>@@sincerely@@,</td></tr>
							<tr><td> @@department@@</td></tr>
		
						</table>
					</div>
				</div>

				<!-- footer.xsl -->
				<xsl:call-template name="lastFooter" />
				<xsl:call-template name="myAccount" />
				<xsl:call-template name="contactUs" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
