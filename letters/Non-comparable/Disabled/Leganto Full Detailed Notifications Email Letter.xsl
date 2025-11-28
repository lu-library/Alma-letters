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

				<xsl:for-each select="notification_data/full_events">
					<xsl:for-each select="reading_list_full_notifications_wrapper">
						<h2><xsl:value-of select="reading_list_name" /></h2>
						<h4><xsl:element name="a">
							<xsl:attribute name="href">
								<xsl:value-of select="permalink_url" />
							</xsl:attribute>
							@@go_to_list@@
						</xsl:element>
						</h4>
						<xsl:if test="course_name">
							<span style="font-size:120%; font-weight:bold" >	 @@courses@@ :  </span> <xsl:value-of select="course_name" />	<br></br>
						</xsl:if>


						<xsl:for-each select="event_groups/list_full_notification_event_group">

							<xsl:choose>
								<xsl:when test="event_type='PUBLIC_NOTE'">
									<br></br>
									<span style="font-size:120%; font-weight:bold"> <xsl:value-of select="events_count" /> &#160;@@NOTE_FOR_STUDENT@@</span>
								</xsl:when>
								<xsl:when test=" event_type='SECTION_DELETE' or event_type='ITEM_COMPLETE' or event_type='ITEM_DECLINED' or event_type='SUGGESTION'  or event_type='CITATION_DELETE'  or event_type='DUE_DATE' or event_type='ITEM_ADD' or event_type='DISCUSSION' or event_type='RL_DISCUSSION' or event_type='NEW_EDITION_AVAILABLE' or event_type='SECTION_TAG' or event_type='SECTION_LIBRARY_TAG_DELETE' or event_type='SECTION_TAG_DELETE' or event_type='SECTION_LIBRARY_TAG_ADD' or event_type='CITATION_TAG' or event_type='CITATION_TAG_DELETE' or event_type='CITATION_LIBRARY_TAG_ADD' or event_type='CITATION_LIBRARY_TAG_DELETE'">
									<br></br>
									<span style="font-size:120%; font-weight:bold"> <xsl:value-of select="events_count" /> &#160;<xsl:value-of select="event_description" /></span>
								</xsl:when>

								<xsl:otherwise>
									<br></br>
									<span style="font-size:120%; font-weight:bold"> <xsl:value-of select="events_count" /> &#160;<xsl:value-of select="event_description" /></span>
								</xsl:otherwise>
							</xsl:choose>
							<br></br>


							<xsl:for-each select="list_notifications/reading_list_notifications_wrapper">
								<xsl:if test="sys_event/event_type='SECTION_TAG' or sys_event/event_type='SECTION_LIBRARY_TAG_ADD' or sys_event/event_type='CITATION_TAG' or sys_event/event_type='CITATION_LIBRARY_TAG_ADD'">
									&#160;* &#160;	@@the@@  &#160;"<xsl:value-of select="value" />"  &#160;@@tag_added_to@@ &#160;
									<xsl:if test="link_to_item">
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="link_to_item" />
											</xsl:attribute>
											<xsl:attribute name="style">
												<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
											</xsl:attribute>
											<xsl:value-of select="text" />

										</xsl:element>
									</xsl:if>
									<br></br>
								</xsl:if>
								<xsl:if test="sys_event/event_type='SECTION_LIBRARY_TAG_DELETE' or sys_event/event_type='SECTION_TAG_DELETE' or sys_event/event_type='CITATION_TAG_DELETE' or  sys_event/event_type='CITATION_LIBRARY_TAG_DELETE'">
									&#160;* &#160;		@@the@@  &#160;"<xsl:value-of select="value" />"  &#160;@@tag_removed_from@@&#160;
									<xsl:if test="link_to_item">
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="link_to_item" />
											</xsl:attribute>
											<xsl:attribute name="style">
												<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
											</xsl:attribute>
											<xsl:value-of select="text" />

										</xsl:element>
									</xsl:if>
									<br></br>
								</xsl:if>
								<xsl:if test="sys_event/event_type='PUBLIC_NOTE'">
									&#160;* &#160;		"<xsl:value-of select="value" />"&#160;
									@@was_added_to@@ &#160;
									<xsl:if test="link_to_item">
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="link_to_item" />
											</xsl:attribute>
											<xsl:attribute name="style">
												<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
											</xsl:attribute>
											<xsl:value-of select="text" />

										</xsl:element>

									</xsl:if>
									<br></br>
								</xsl:if>
								<xsl:if test="sys_event/event_type='DUE_DATE'" >
									&#160;* &#160;
									<xsl:if test="link_to_item">
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="link_to_item" />
											</xsl:attribute>
											<xsl:attribute name="style">
												<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
											</xsl:attribute>
											<xsl:value-of select="text" />

										</xsl:element>

									</xsl:if>
									&#160;@@new_due_date@@&#160;
									<xsl:value-of select="value" />
									<br></br>
								</xsl:if>
								<xsl:if test="sys_event/event_type='RL_DISCUSSION'" >
									&#160;* &#160;	<xsl:if test="text !=''">
									"<xsl:value-of select="text" />" &#160;

								</xsl:if>	@@RL_DISCUSSION@@&#160;
									<br></br>
								</xsl:if>
								<xsl:if test="link_to_item!= '' and  (sys_event/event_type='ITEM_DECLINED' or sys_event/event_type='BOLK_RIGHTS_CLEARANCE_REJECTED' or sys_event/event_type='BOLK_RIGHTS_CLEARANCE_APPROVED' or  sys_event/event_type='CITATION_ANNOTATION' or sys_event/event_type='NEW_EDITION_AVAILABLE' or sys_event/event_type='ITEM_ADD' or sys_event/event_type='ITEM_COMPLETE' )">
									&#160;* &#160;
									<xsl:if test="link_to_item">
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="link_to_item" />
											</xsl:attribute>
											<xsl:attribute name="style">
												<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
											</xsl:attribute>
											<xsl:value-of select="value" />

										</xsl:element>
									</xsl:if>
									<br></br>
								</xsl:if>
								<xsl:if test="sys_event/event_type='DISCUSSION'">
									&#160;* &#160;	<xsl:if test="text !=''">
									"<xsl:value-of select="text" />" &#160;
								</xsl:if>
									@@was_added_to@@&#160;
									<xsl:if test="link_to_item">
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="link_to_item" />
											</xsl:attribute>
											<xsl:attribute name="style">
												<xsl:value-of select="'color:#337ab7;font-weight:bold;'"/>
											</xsl:attribute>
											<xsl:value-of select="value" />

										</xsl:element>
									</xsl:if>
									<br></br>
								</xsl:if>

								<xsl:if test="sys_event/event_type='PUBLISH' or sys_event/event_type='DRAFT'">
									<br></br>
									&#160;* &#160;	<xsl:value-of select="sys_event/event_type_display" />
								</xsl:if>

							</xsl:for-each>

						</xsl:for-each>
					</xsl:for-each>
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
				<br></br>
				<div class="messageArea">
					<div class="messageBody">

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
