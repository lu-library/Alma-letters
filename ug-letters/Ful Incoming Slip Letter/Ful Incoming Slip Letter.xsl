<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="counter" select="0"/>


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

<xsl:template name="id-info">
   <xsl:param name="line"/>
   <xsl:variable name="first" select="substring-before($line,'//')"/>
   <xsl:variable name="rest" select="substring-after($line,'//')"/>
    <xsl:if test="$first = '' and $rest = '' ">
          <!--br/-->
      </xsl:if>
   <xsl:if test="$rest != ''">
       <xsl:value-of select="$rest"/><br/>
   </xsl:if>
   <xsl:if test="$rest = ''">
       <xsl:value-of select="$line"/><br/>
   </xsl:if>

</xsl:template>

  <xsl:template name="id-info-hdr">
        <xsl:call-template name="id-info">
            <xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
            <xsl:with-param name="label" select="'Bibliographic Information:'"/>
         </xsl:call-template>
</xsl:template>

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->



			<div class="messageArea">
				<div class="messageBody">
					 <table cellspacing="0" cellpadding="5" border="0">


						<tr>
							<td>
								<b>@@supplied_to@@: </b>
								<xsl:value-of select="notification_data/partner_name"/>
							</td>
						</tr>

						<tr>
			                <td>
			                  <b>@@borrower_reference@@: </b>
			                   <xsl:call-template name="id-info-hdr"/>
			                </td>
			              </tr>

			          <tr>
							  <td><b>@@my_id@@: </b><img src="externalId.png" alt="externalId" /></td>
				      </tr>
						
						<xsl:choose>
							<xsl:when test="/notification_data/items/physical_item_display_for_printing/available_items/available_item/shelving_location != ''" >							
								<tr>
									<td>
										<b>Annex SLN: </b>
										<xsl:value-of select="/notification_data/items/physical_item_display_for_printing/available_items/available_item/shelving_location"/>
									</td>
								</tr>
							</xsl:when>	
							<xsl:otherwise>						
								<xsl:if  test="notification_data/items/physical_item_display_for_printing/internal_note1 != ''" >
									<tr>
										<td>
											<b>Original Annex SLN (internal_note1): </b>
											<xsl:value-of select="notification_data/items/physical_item_display_for_printing/internal_note1"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
						
						<tr>
							<td>
								<b>@@format@@: </b>
								<xsl:value-of select="notification_data/incoming_request/format"/>
							</td>
						</tr>

						<xsl:if  test="notification_data/assignee != ''" >
							<tr>
								<td>
									<b>@@assignee@@: </b>
									<xsl:value-of select="notification_data/assignee"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/title != ''" >
							<tr>
								<td>
									<b>Title: </b>
									<xsl:value-of select="notification_data/metadata/title"/>
								</td>
							</tr>
						</xsl:if>
                        
                        <xsl:if  test="notification_data/metadata/journal_title != ''" >
							<tr>
								<td>
									<b>@@journal_title@@: </b>
									<xsl:value-of select="notification_data/metadata/journal_title"/>
								</td>
							</tr>
						</xsl:if>
                        
                        <xsl:if  test="notification_data/metadata/chapter != ''" >
							<tr>
								<td>
									<b>@@chapter@@: </b>
									<xsl:value-of select="notification_data/metadata/chapter"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/chapter_title != ''" >
							<tr>
								<td>
									<b>@@chapter_title@@: </b>
									<xsl:value-of select="notification_data/metadata/chapter_title"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/chapter_author != ''" >
							<tr>
								<td>
									<b>@@chapter_author@@: </b>
									<xsl:value-of select="notification_data/metadata/chapter_author"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/author != ''" >
							<tr>
								<td>
									<b>@@author@@: </b>
									<xsl:value-of select="notification_data/metadata/author"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/call_number != ''" >
							<tr>
								<td>
									<b>@@call_number@@: </b>
									<xsl:value-of select="notification_data/metadata/call_number"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/barcode != ''" >
                            <tr>
                                <td><b>@@item_barcode@@: </b><img src="cid:{concat(concat('notification_data/metadata/barcode',position()),'.png')}" alt="{concat('notification_data/metadata/barcode',position())}" /></td>
                            </tr>
                        </xsl:if>

                        <xsl:if  test="notification_data/metadata/edition != ''" >
							<tr>
								<td>
									<b>@@edition@@: </b>
									<xsl:value-of select="notification_data/metadata/edition"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/volume != ''" >
							<tr>
								<td>
									<b>@@volume@@: </b>
									<xsl:value-of select="notification_data/metadata/volume"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/issue != ''" >
							<tr>
								<td>
									<b>@@issue@@: </b>
									<xsl:value-of select="notification_data/metadata/issue"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/isbn != ''" >
							<tr>
								<td>
									<b>@@isbn@@: </b>
									<xsl:value-of select="notification_data/metadata/isbn"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/issn != ''" >
							<tr>
								<td>
									<b>@@issn@@: </b>
									<xsl:value-of select="notification_data/metadata/issn"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/oclc_number != ''" >
							<tr>
								<td>
									<b>@@oclc_number@@: </b>
									<xsl:value-of select="notification_data/metadata/oclc_number"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/source != ''" >
							<tr>
								<td>
									<b>@@source@@: </b>
									<xsl:value-of select="notification_data/metadata/source"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/pages != ''" >
							<tr>
								<td>
									<b>@@pages@@: </b>
									<xsl:value-of select="notification_data/metadata/pages"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/publication_date != ''" >
							<tr>
								<td>
									<b>@@publication_date@@: </b>
									<xsl:value-of select="notification_data/metadata/publication_date"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/metadata/year != ''" >
							<tr>
								<td>
									<b>@@year@@: </b>
									<xsl:value-of select="notification_data/metadata/year"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/incoming_request/note != ''" >
							<tr>
								<td>
									<b>@@request_note@@: </b>
									<xsl:value-of select="notification_data/incoming_request/note"/>
								</td>
							</tr>
						</xsl:if>

                        <xsl:if  test="notification_data/incoming_request/needed_by_dummy/full_date != ''" >
							<tr>
								<td>
									<b>@@date_needed_by@@: </b>
									<xsl:value-of select="notification_data/incoming_request/needed_by"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/incoming_request/requester_email != ''" >
							<tr>
								<td>
									<b>@@requester_email@@: </b>
									<xsl:value-of select="notification_data/incoming_request/requester_email"/>
								</td>
							</tr>
						</xsl:if>
						
                        <xsl:if test="notification_data/level_of_service !=''">
                            <tr>
                                <td>
                                    <b>@@level_of_service@@: </b>
                                    <xsl:value-of select="notification_data/level_of_service"/>
                                </td>

                            </tr>
                        </xsl:if>						
					</table>
				</div>
			</div>

	<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->

</body>
</html>

	</xsl:template>
</xsl:stylesheet>
