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
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" />
				<!-- header.xsl -->

			    <table role='presentation'  cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>
							<h3>@@header@@</h3>
						</td>
					</tr>
				</table>

				<div class="messageArea">
					<div class="messageBody">
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									<strong>@@start@@</strong>
								</td>
							</tr>
						</table>

                        <br/>
                        
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<xsl:if test="notification_data/request_id !=''">
								<tr>
									<td>
										<strong> @@internalIdentifier@@: </strong>
										<xsl:value-of select="notification_data/request_id"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/external_request_id !=''">
								<tr>
									<td>
										<strong> @@externalIdentifier@@: </strong>
										<xsl:value-of select="notification_data/request/external_request_id"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/journal_title !=''">
								<tr>
									<td>
										<strong> @@journalTitle@@: </strong>
										<xsl:value-of select="notification_data/display/journal_title"/>
									</td>
								</tr>
								<tr>
									<td>
										<strong> @@articleTitle@@: </strong>
										<xsl:value-of select="notification_data/request/title"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/title !='' and notification_data/display/journal_title = ''">
								<tr>
									<td>
										<strong> @@title@@: </strong>
										<xsl:value-of select="notification_data/request/title"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/chapter_title !='' and notification_data/display/composer = null and notification_data/display/opus = null and notification_data/display/song_movement = null and notification_data/display/music_part = null">
								<tr>
									<td>
										<strong> @@chapterTitle@@: </strong>
										<xsl:value-of select="notification_data/display/chapter_title"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/author !=''">
								<tr>
									<td>
										<strong> @@by@@: </strong>
										<xsl:value-of select="notification_data/display/author"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/chapter_author !=''">
								<tr>
									<td>
										<strong> @@chapterAuthor@@: </strong>
										<xsl:value-of select="notification_data/display/chapter_author"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/format !=''">
								<tr>
									<td>
										<strong> @@format@@: </strong>
										<xsl:value-of select="notification_data/format"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/arrival_date !='' and notification_data/unavailable_resource = ''">
								<tr>
									<td>
										<strong> @@arrivalDate@@: </strong>
										<xsl:value-of select="notification_data/arrival_date"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/unavailable_resource != ''">
								<tr>
									<td>
										<strong> @@arrivalDate@@: </strong>
										@@unavailableResource@@
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/due_date !='' and notification_data/unavailable_resource = ''">
								<tr>
									<td>
										<strong> @@dueDate@@: </strong>
										<xsl:value-of select="notification_data/due_date"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/patron_cost !=''">
								<tr>
									<td>
										<strong> @@cost@@: </strong>
										<xsl:value-of select="notification_data/patron_cost"/>
										<xsl:value-of select="' '" />
										<xsl:value-of select="notification_data/currency" />
									</td>
								</tr>
							</xsl:if>				
							<xsl:if test="notification_data/display/chapter !=''">
								<tr>
									<td>
										<strong> @@chapterNumber@@: </strong>
										<xsl:value-of select="notification_data/display/chapter"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/volume !=''">
								<tr>
									<td>
										<strong> @@volume@@: </strong>
										<xsl:value-of select="notification_data/volume"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/issue !=''">
								<tr>
									<td>
										<strong> @@issue@@: </strong>
										<xsl:value-of select="notification_data/display/issue"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/start_page !=''">
								<tr>
									<td>
										<strong> @@startPage@@: </strong>
										<xsl:value-of select="notification_data/display/start_page"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/end_page !=''">
								<tr>
									<td>
										<strong> @@endPage@@: </strong>
										<xsl:value-of select="notification_data/display/end_page"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/start_page ='' and notification_data/display/end_page ='' and notification_data/display/pages !=''">
								<tr>
									<td>
										<strong> @@pages@@: </strong>
										<xsl:value-of select="notification_data/display/pages"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/composer !=''">
								<tr>
									<td>
										<strong> @@composer@@: </strong>
										<xsl:value-of select="notification_data/display/composer"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/opus !=''">
								<tr>
									<td>
										<strong> @@opus@@: </strong>
										<xsl:value-of select="notification_data/display/opus"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/song_movement !=''">
								<tr>
									<td>
										<strong> @@songMovement@@: </strong>
										<xsl:value-of select="notification_data/display/song_movement"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/music_part !=''">
								<tr>
									<td>
										<strong> @@part@@: </strong>
										<xsl:value-of select="notification_data/display/music_part"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/display/publication_date !=''">
								<tr>
									<td>
										<strong> @@publicationDate@@: </strong>
										<xsl:value-of select="notification_data/display/publication_date"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/needed_by_str !=''">
								<tr>
									<td>
										<strong> @@notNeededAfter@@: </strong>
										<xsl:value-of select="notification_data/needed_by_str"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/note !=''">
								<tr>
									<td>
										<strong> @@note@@: </strong>
										<xsl:value-of select="notification_data/request/note"/>
									</td>
								</tr>
							</xsl:if>
						</table>	
											
						<br/>
						
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									@@end@@
								</td>
							</tr>
						</table>
						
						<br/><br/>
						
						<table role='presentation' >
							<tr>
								<td>@@signature@@</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="notification_data/organization_unit/name" />
								</td>
							</tr>
							<xsl:if test="notification_data/organization_unit/address/line1 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/organization_unit/address/line1" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/organization_unit/address/line2 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/organization_unit/address/line2" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/organization_unit/address/line3 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/organization_unit/address/line3" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/organization_unit/address/line4 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/organization_unit/address/line4" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/organization_unit/address/line5 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/organization_unit/address/line5" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/organization_unit/address/city !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/organization_unit/address/city" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/organization_unit/address/country !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/organization_unit/address/country" />
									</td>
								</tr>

							</xsl:if>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter" />
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

