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
								<td style="font-size:18px;padding: 0px 0 5px 10px;">
									@@due_dates_approaching@@
									<br />
								</td>
							</tr>

							<xsl:for-each
								select="notification_data/courses_to_citations/course_citations_wrapper">
								<tr>								
									<td style="padding:0 0 5px 10px;">		
									<br />																	
										<strong>
											<xsl:value-of select="course/name" />
										</strong>
										&#160;
									</td>
								</tr>

								<xsl:for-each select="citations/reading_list_citation">
									<tr>
										<td style="padding:0 0 5px 10px;">
											<xsl:value-of select="due_date" />
											-
											<xsl:value-of select="title" />
											&#160;
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>

							<tr>
								<td>
									<br />
									<xsl:if test="notification_data/leganto_url  !=''">
										<span style="padding:0 0 5px 10px;">
											@@see_all_your_lists@@
											<xsl:element name="a">
												<xsl:attribute name="href">
									<xsl:value-of select="notification_data/leganto_url" />
								</xsl:attribute>
												<xsl:attribute name="style">
									<xsl:value-of select="'color:#337ab7;font-weight:bold;'" />
								</xsl:attribute>
												@@go_leganto@@
											</xsl:element>
										</span>
									</xsl:if>
								</td>
							</tr>
						</table>

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
