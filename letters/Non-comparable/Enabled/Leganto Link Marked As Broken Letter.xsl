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
								<td style="padding:0 0 5px 10px; font-size:14px;">

									@@subject@@


									<br />
									<br />
								</td>
							</tr>
							<tr>
								<td style="padding:0 0 5px 10px;">
									@@list@@
									&#160;
									<xsl:value-of select="notification_data/list_name" />

								</td>

							</tr>
							<tr>
								<td style="padding:0 0 5px 10px;">
									@@item@@
									&#160;
									<xsl:value-of select="notification_data/item_title" />

								</td>

							</tr>
							<tr>
								<td style="padding:0 0 5px 10px;">
									@@citation_id@@
									&#160;
									<xsl:value-of select="notification_data/assertion/entity_id" />

								</td>

							</tr>
							<xsl:if test="(notification_data/item_url  !='') and (notification_data/type  !='fileDownload')">
								<tr>
									<td style="padding:0 0 5px 10px;">
										@@reported_link@@
										<xsl:if test="notification_data/item_url  !=''">
											<span style="padding:0 0 5px 10px;">

												<xsl:element name="a">
													<xsl:attribute name="href">
														<xsl:value-of select="notification_data/item_url" />
													</xsl:attribute>

													<xsl:attribute name="style">
														<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
													</xsl:attribute>
													<xsl:value-of select="notification_data/item_url_name" />
												</xsl:element>
											</span>
										</xsl:if>

									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/type  ='fileDownload'">
								<tr>
									<td style="padding:0 0 5px 10px;">
										@@reported_file@@
										&#160;
										<xsl:value-of select="notification_data/name" />


									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/item_url  =''">
								<tr>
									<td style="padding:0 0 5px 10px;">
										@@no_availability@@
									</td>
								</tr>
							</xsl:if>

						</table>
						<xsl:if test="notification_data/leganto_url  !=''">
							<span style="padding:0 0 5px 10px;">

								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="notification_data/leganto_url" />
									</xsl:attribute>

									<xsl:attribute name="style">
										<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
									</xsl:attribute>
									@@view_in_leganto@@
								</xsl:element>
							</span>
						</xsl:if>
						<br />

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
