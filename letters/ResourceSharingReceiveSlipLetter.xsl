<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:template match="/">
		<html>
			<head>
				<!-- <xsl:call-template name="generalStyle"/> -->
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>				

				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0">
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>

							<tr>
								<td>
									<h1><xsl:value-of select="notification_data/patron_name"/></h1>
								</td>
							</tr>

							<tr>
								<td>
									Pickup at:
									<br />
									<h3><xsl:value-of select="notification_data/request/pickup_location_str"/></h3>
								</td>
							</tr>

							<xsl:if test="notification_data/barcode !=''">
								<tr>
								  <td>
								  	<b>@@item_barcode@@: </b> <img src="Barcode.png" alt="Barcode" />
								  </td>
								</tr>
							</xsl:if>

							<tr>
							  <td>
							  	<br/>
							  	<b>@@request_id@@: </b> <xsl:value-of select="notification_data/request/external_request_id"/>
							  </td>
				   			</tr>

							<tr>
								<td>
									<b> Due Date: </b>
									<xsl:value-of select="notification_data/request/due_date"/>
								</td>
							</tr>

							<tr>
								<td>
									<br/>
									<b> @@title@@: </b>
									<xsl:value-of select="notification_data/request/display/normalized_title"/>
								</td>
							</tr>
							<tr>
								<td>
									<b> @@author@@: </b>
									<xsl:value-of select="notification_data/request/display/author"/>
								</td>
							</tr>

						</table>

						<br/><br/>

					</div>
				</div>
				<xsl:call-template name="head"/>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
