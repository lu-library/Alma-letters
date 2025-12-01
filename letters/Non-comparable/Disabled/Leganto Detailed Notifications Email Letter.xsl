<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
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
			<body style="color:#333; margin:0; padding: 10px 20px; font-size:80%; font-family: 'Source Sans Pro' !important; background-color: #f3f7f8;" data-new-gr-c-s-check-loaded="14.984.0" data-gr-ext-installed="">
				<xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

				<xsl:call-template name="head" /><!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

				<table role='presentation'  cellspacing="0" cellpadding="5" border="0"
							style="width:100%; background-color: #f3f7f8; padding: 0px 25px 25px 25px; border-bottom: 2px solid #dce8eb; font-family: 'Source Sans Pro' !important;padding: 25px 0 15px 0;">

						<tr>
							<td style="font-size:18px; padding: 0px 0 15px 0; font-weight: 700;">
								
									@@you_have@@
									<xsl:value-of select="notification_data/total_count" />
									@@new_notifications@@
								
								
							</td>
						</tr>
				</table>
				<div class="messageArea">
					<div class="messageBody">
					<xsl:for-each select="notification_data/events/detailed_notifications_summary">
						<table cellspacing="0" cellpadding="5" border="0"
							style="width:100%; background-color: #f3f7f8; padding: 0px 25px 25px 25px; border-bottom: 2px solid #dce8eb; font-family: 'Source Sans Pro' !important;padding: 25px 0 15px 0;">

							
							<h2 style="font-size: 2em; font-weight: 300; padding: 20px 0 5px 0; margin: 0;">
								@@list@@ <xsl:value-of select="list_name" />
							</h2>
						
										
							<xsl:for-each select="notification_list/notifications_summary">
								<tr>
									<td style="padding:0 0 5px 0px;">
									
										&#160; <xsl:value-of select="num_of_events" /> &#160;
										 
										<xsl:value-of select="event_type_display" />
									</td>

								</tr>
							</xsl:for-each>
							<tr>
									<td style="padding:0 0 5px 0px;">
									
										<xsl:element name="a">
												<xsl:attribute name="href">
												<xsl:value-of select="permalink_url" />
												</xsl:attribute>
												<xsl:attribute name="style">
													<xsl:value-of select="'color:#337ab7; font-weight:bold;'"/>
												</xsl:attribute>
												@@go_to@@ 
										</xsl:element>
									</td>
								</tr>
							</table>
						</xsl:for-each>
						<xsl:for-each select="notification_data/delete_events/detailed_notifications_summary">
							<table role='presentation'  cellspacing="0" cellpadding="0" border="0" style="width:100%; padding: 20px 0px; border-bottom: 2px solid #dce8eb;">
								 <tr>
									<td >
									<strong>@@LIST_DELETE@@  </strong>
								   	<xsl:value-of select="list_name" /> 
								
									</td>
								</tr>
							</table>
						</xsl:for-each>
						<xsl:for-each select="notification_data/course_sub_events/detailed_notifications_summary">
							<table role='presentation'  cellspacing="0" cellpadding="0" border="0"
								style="width:100%; padding: 20px 0px; border-bottom: 2px solid #dce8eb;">
								 <tr>
									<td style="padding:0 0 5px 0px;"> <strong>
										<xsl:value-of select="course_code" /> / <xsl:value-of select="course_name" /> : </strong>
									</td>
								</tr>
								<tr>
									<td style="padding:0 0 5px 0px;">
												@@COURSE_SUBMIT_LISTS_BY@@: <xsl:value-of select="submit_lists_by" />
									</td>
								</tr>
								<tr>
									<td style="padding:0 0 5px 0px;">
										<xsl:element name="a">
												<xsl:attribute name="href">
												<xsl:value-of select="permalink_url" />
												</xsl:attribute>
												<xsl:attribute name="style">
													<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
												</xsl:attribute>
												@@click_create_list@@
										</xsl:element>
									</td>
								</tr>
							</table>
						
						</xsl:for-each>
							<span style="padding:0 0 5px 10px; margin: 0 0 10px 0;">
							@@see_all_your_lists@@
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="notification_data/leganto_url" />
								</xsl:attribute>
								
								<xsl:attribute name="style">
									<xsl:value-of select="'color:#337ab7; font-weight:bold;'"/>
								</xsl:attribute>
								@@go_leganto@@
							</xsl:element>
							</span>
						


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
