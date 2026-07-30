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
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>
				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

				<div class="messageArea">
					<div class="messageBody">
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									@@on@@
									<xsl:value-of select="notification_data/general_data/current_date" />
									@@we_cancel_y_req_of@@
									<xsl:value-of select="notification_data/request/create_date" />
									@@detailed_below@@ :
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl -->
								</td>
							</tr>
							<!-- <xsl:if test="notification_data/metadata/title != ''">
								<tr>
									<td>
										<strong>@@title@@: </strong>
										<xsl:value-of select="notification_data/metadata/title" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/journal_title != ''">
								<tr>
									<td>
										<strong> @@journal_title@@: </strong>
										<xsl:value-of select="notification_data/metadata/journal_title" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/author != ''">
								<tr>
									<td>
										<strong> @@author@@: </strong>
										<xsl:value-of select="notification_data/metadata/author" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/author_initials != ''">
								<tr>
									<td>
										<strong>@@author_initials@@: </strong>
										<xsl:value-of select="notification_data/metadata/author_initials" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/edition != ''">
								<tr>
									<td>
										<strong> @@edition@@: </strong>
										<xsl:value-of select="notification_data/metadata/edition" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/identifier != ''">
								<tr>
									<td>
										<strong>@@identifier@@: </strong>
										<xsl:value-of select="notification_data/metadata/identifier" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/lccn != ''">
								<tr>
									<td>
										<strong> @@lccn@@: </strong>
										<xsl:value-of select="notification_data/metadata/lccn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/issn != ''">
								<tr>
									<td>
										<strong>@@issn@@: </strong>
										<xsl:value-of select="notification_data/metadata/issn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/isbn != ''">
								<tr>
									<td>
										<strong> @@isbn@@: </strong>
										<xsl:value-of select="notification_data/metadata/isbn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/oclc_nr != ''">
								<tr>
									<td>
										<strong> @@oclc_nr@@: </strong>
										<xsl:value-of select="notification_data/metadata/oclc_nr" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/doi != ''">
								<tr>
									<td>
										<strong>@@doi@@: </strong>
										<xsl:value-of select="notification_data/metadata/doi" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/pmid != ''">
								<tr>
									<td>
										<strong> @@pmid@@: </strong>
										<xsl:value-of select="notification_data/metadata/pmid" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/publisher != ''">
								<tr>
									<td>
										<strong> @@publisher@@: </strong>
										<xsl:value-of select="notification_data/metadata/publisher" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/publication_date != ''">
								<tr>
									<td>
										<strong>@@publication_date@@: </strong>
										<xsl:value-of select="notification_data/metadata/publication_date" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/place_of_publication != ''">
								<tr>
									<td>
										<strong> @@place_of_publication@@: </strong>
										<xsl:value-of select="notification_data/metadata/place_of_publication" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/additional_person_name != ''">
								<tr>
									<td>
										<strong> @@additional_person_name@@: </strong>
										<xsl:value-of select="notification_data/metadata/additional_person_name" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/source != ''">
								<tr>
									<td>
										<strong>@@source@@: </strong>
										<xsl:value-of select="notification_data/metadata/source" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/series_title_number != ''">
								<tr>
									<td>
										<strong> @@series_title_number@@: </strong>
										<xsl:value-of select="notification_data/metadata/series_title_number" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/call_number != ''">
								<tr>
									<td>
										<strong> @@call_number@@: </strong>
										<xsl:value-of select="notification_data/metadata/call_number" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/volume != ''">
								<tr>
									<td>
										<strong>@@volume@@: </strong>
										<xsl:value-of select="notification_data/metadata/volume" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/part != ''">
								<tr>
									<td>
										<strong> @@part@@: </strong>
										<xsl:value-of select="notification_data/metadata/part" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/chapter != ''">
								<tr>
									<td>
										<strong> @@chapter@@: </strong>
										<xsl:value-of select="notification_data/metadata/chapter" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/pages != ''">
								<tr>
									<td>
										<strong>@@pages@@: </strong>
										<xsl:value-of select="notification_data/metadata/pages" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/start_page != ''">
								<tr>
									<td>
										<strong> @@start_page@@: </strong>
										<xsl:value-of select="notification_data/metadata/start_page" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/end_pagee != ''">
								<tr>
									<td>
										<strong> @@end_page@@: </strong>
										<xsl:value-of select="notification_data/metadata/end_page" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/issue != ''">
								<tr>
									<td>
										<strong>@@issue@@: </strong>
										<xsl:value-of select="notification_data/metadata/issue" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/note != ''">
								<tr>
									<td>
										<strong> @@note@@: </strong>
										<xsl:value-of select="notification_data/metadata/note" />
									</td>
								</tr>
							</xsl:if> -->


							<xsl:if test="notification_data/request/start_time != ''">
								<tr>
									<td>
										<strong> @@start_time@@: </strong>
										<xsl:value-of select="notification_data/booking_start_time_str" />
									</td>
								</tr>
							</xsl:if>
						<xsl:if test="notification_data/request/end_time != ''">
								<tr>
									<td>
										<strong> @@end_time@@: </strong>
										<xsl:value-of select="notification_data/booking_end_time_str" />
									</td>
								</tr>
							</xsl:if>
						<xsl:if test="notification_data/request/note != ''">
								<tr>
									<td>
										<strong> @@request_note@@: </strong>
										<xsl:value-of select="notification_data/request/note" />
									</td>
								</tr>
							</xsl:if>
                            
                            <!-- START stop emails for converted to resource sharing -->
                            <xsl:if test="notification_data/request/status_note">                        
                                <xsl:if test="contains(notification_data/request/status_note, 'ConvertedToResourceSharingRequest')">
                                    <xsl:message terminate="yes">A converted to resource sharing cancellation, don't send email</xsl:message>
                                </xsl:if>
                            </xsl:if>
                            <!-- END stop emails for converted to resource sharing -->
						
							
							
							
						<!-- Start of Custom Cancellation reasons -->
                            <tr><td>	
                            <strong> @@reason_deleting_request@@: </strong>
                            <xsl:choose>
								<xsl:when test="notification_data/request/status_note='AdditionalReason10'">
							    	<xsl:text>This is the cancellation note for testing.</xsl:text>
								</xsl:when>

								<!--
                                <xsl:when test="notification_data/request/status_note='AdditionalReason01'">
							    	<xsl:text>Due to copyright, we are only able to digitally send a single chapter, article, or excerpt of a work not exceeding 10% of total pages. This request will be cancelled. You may resubmit your request for a physical loan of this material OR resubmit your digitization request according to the copyright guidelines.</xsl:text>
								</xsl:when>
								
								<xsl:when test="notification_data/request/status_note='RequestedMaterialCannotBeLocated'">
							    	<xsl:text>We cannot find a resource matching this citation. This request will be cancelled. Please feel free to resubmit with updated citation information. If you believe this
citation to be correct, please contact us with the source of your citation.</xsl:text>
								</xsl:when>
									
								<xsl:when test="notification_data/request/status_note='FailedToLocateSuppliers'">
							    	<xsl:text>Unfortunately, we have been unable to find a lender who will fill this request. This request will be cancelled. If you have any questions, please contact Interlibrary Loans at interlib@mcmaster.ca or hslill@mcmaster.ca for the Health Sciences Library.</xsl:text>
								</xsl:when>
								
								<xsl:when test="notification_data/request/status_note='AdditionalReason05'">
							    	<xsl:text>The charges from the lender to fill this request exceed the amount covered from the library.</xsl:text>
								</xsl:when>
								
								<xsl:when test="notification_data/request/status_note='AdditionalReason04'">
							    	<xsl:text>Unfortunately, this item is not presently available from McMaster Libraries. This request will be cancelled.</xsl:text>
								</xsl:when>
								
								<xsl:when test="notification_data/request/status_note='ItemAlreadyAvailable'">
							    	<xsl:text>This item is already available.</xsl:text>
								</xsl:when>
								
								<xsl:when test="notification_data/request/status_note='RequestSwitched'">
							    	<xsl:text>Request switched.</xsl:text>
								</xsl:when>
								
								<xsl:when test="notification_data/request/status_note='PurchaseRequest'">
							    	<xsl:text>Thank you for your request. The library will be purchasing the item for our collection. We will notify you when it is available. </xsl:text>
								</xsl:when>
								
								<xsl:when test="notification_data/request/status_note='AdditionalReason03'">
							    	<xsl:text>This is a high-demand item and it is not currently available from McMaster University Libraries or for interlibrary loan. You may wish to submit a new request at a later date.
This request will be cancelled. If you have any questions, please contact Interlibrary Loans at interlib@mcmaster.ca or hslill@mcmaster.ca for the Health Sciences Library. Thank you.</xsl:text>
								</xsl:when>
								
								<xsl:when test="notification_data/request/status_note='AdditionalReason02'">
							    	<xsl:text>There is no print copy of this title available for loan and access to a digital version is available from the library. To recommend a print copy please fill out this form and Collections will evaluate: https://library.mcmaster.ca/forms/request-print-purchase.
							    </xsl:text>
							</xsl:when>
							-->
							    
								<!--Cancellation reason when no custom description exists-->
								<xsl:otherwise>
									<xsl:value-of select="notification_data/request/status_note_display" />
								</xsl:otherwise>
							</xsl:choose>
								</td></tr>

							<!-- Cancellation custom note from staff -->					
							<!-- If the approval note is populated, don't show cancel_reason but the reject note -->
							<xsl:choose>
								<xsl:when test="notification_data/request/approval_entity/reject_reason != ''">
									<xsl:if test="notification_data/request/approval_entity/note != ''">
										<tr>
											<td>												
												<xsl:value-of select="notification_data/request/approval_entity/note"/>												
											</td>
										</tr>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>			
							<xsl:if test="notification_data/request/cancel_reason != ''">
								<tr>
									<td>
										<strong> @@request_cancellation_note@@: </strong>
										<xsl:value-of select="notification_data/request/cancel_reason" />
									</td>
								</tr>
							</xsl:if>
								</xsl:otherwise>
							</xsl:choose>	

								
							<!-- ORIGINAL LINES
							<xsl:if test="notification_data/request/cancel_reason != ''">
								<tr>
									<td>
										<strong> @@request_cancellation_note@@: </strong>
										<xsl:value-of select="notification_data/request/cancel_reason" />
									</td>
								</tr>
							</xsl:if> -->
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
				<xsl:call-template name="contactUs" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
