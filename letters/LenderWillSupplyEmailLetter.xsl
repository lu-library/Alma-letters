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

            <!-- AFN-VERSION 1.0 START -->
			<xsl:variable name="letter_lang" select="notification_data/languages/string"/>
			<!-- AFN-VERSION 1.0 END -->

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
									<strong>@@request@@</strong>
								</td>
							</tr>

						</table>

                        <br/>
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<tr>
								<td>
									<strong> @@requestId@@: </strong>
									<xsl:value-of select="notification_data/request/external_request_id"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@title@@: </strong>
									<xsl:value-of select="notification_data/request/display/title"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@author@@: </strong>
									<xsl:value-of select="notification_data/request/display/author"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@requestDate@@: </strong>
									<xsl:value-of select="notification_data/request/create_date_str"/>
								</td>
							</tr>
                            <!-- AFN-VERSION 1.0 START -->
							<!-- Add due date, no label for it so we must check language code -->							
							<xsl:if test="notification_data/request/due_date !=''">
								<tr>
									<td>
										<xsl:if test="$letter_lang = 'fr'">
        									<!-- due date label if lang is 'fr' -->
											<strong>Date d'échéance: </strong>
    									</xsl:if>
										<xsl:if test="$letter_lang = 'en'">
											<strong>Due Date: </strong>
    									</xsl:if>
										
										<xsl:value-of select="notification_data/request/due_date" />
									</td>
								</tr>
							</xsl:if>
							<!-- Add Shipping Cost -->						
							<xsl:if test="notification_data/request/shipping_cost/sum > 0">
								<tr>
									<td>										
										<xsl:if test="$letter_lang = 'fr'">
        									<!-- Shipping cost label if lang is 'fr' -->
											<strong>Frais de port: </strong>
    									</xsl:if>
										<xsl:if test="$letter_lang = 'en'">
											<strong>Shipping Cost: </strong>
    									</xsl:if>
										<xsl:value-of select="notification_data/request/shipping_cost/sum" />&#160;<xsl:value-of select="notification_data/request/shipping_cost/currency" />
									</td>
								</tr>
							</xsl:if>	     
                            <!-- AFN-VERSION 1.0 END -->
							<tr>
								<td>
									<br/>
									<strong> @@reason@@: </strong>
									<xsl:value-of select="notification_data/will_supply_reason"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong> @@note@@: </strong>
									<xsl:value-of select="notification_data/note_to_partner"/>
								</td>
							</tr>
							<xsl:if test="notification_data/auto_will_supply_note">
								<tr>
									<td>
										<xsl:value-of select="notification_data/auto_will_supply_note"/>
									</td>
								</tr>
							</xsl:if>
						</table>

						<br/><br/>

						<table role='presentation' >
							<tr>
								<td>@@signature@@</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="notification_data/library/name" />
								</td>
							</tr>
							<xsl:if test="notification_data/library/address/line1 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line1" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line2 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line2" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line3 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line3" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line4 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line4" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line5 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line5" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/city !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/city" />
                                        <!-- AFN-VERSION 1.0 START -->
										<xsl:if test="notification_data/library/address/state_province !=''">											
                                        , <xsl:value-of select="notification_data/library/address/state_province" />												
                                        </xsl:if>
                                        <xsl:if test="notification_data/library/address/postal_code !=''">											
                                        , <xsl:value-of select="notification_data/library/address/postal_code" />												
                                        </xsl:if>
                                        <!-- AFN-VERSION 1.0 END -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/country !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/country" />
									</td>
								</tr>

							</xsl:if>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter" />
				<xsl:call-template name="AFNLetterNameTemplate" />
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
