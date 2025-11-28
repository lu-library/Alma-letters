<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />

  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />

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
        <xsl:call-template name="senderReceiver" />
        <!-- SenderReceiver.xsl -->
		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
        <div class="messageArea">
          <div class="messageBody">
            <table role='presentation'  cellspacing="0" cellpadding="5" border="0">
				<tr>
					<td>
						<xsl:choose >
							<xsl:when test="/notification_data/order_now_succed='true'">
								<br /><strong>@@order_now_succed@@.</strong>
							</xsl:when>
							<xsl:otherwise>
								<br /><strong>@@order_now_failed@@ <xsl:value-of select="notification_data/need_review_entity" />.</strong>
							</xsl:otherwise>
						</xsl:choose>

					<br />
					<br /><strong>@@pol_reference@@: </strong><xsl:value-of select="notification_data/line_reference" />
					<br /><strong>@@order_number@@: </strong><xsl:value-of select="notification_data/number" />
					</td>
				</tr>
					<tr>
					<td>

					<br />
					<br /><strong>@@vendor_note@@: </strong><xsl:value-of select="notification_data/vendor_note" />

					<xsl:choose >
							<xsl:when test="/notification_data/rush='true'">
								<br /><strong>@@rush@@.</strong>
							</xsl:when>
							<xsl:otherwise>

							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
          </div>
        </div>
		<br />
				<table role='presentation' >

						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>

				</table>
		<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
