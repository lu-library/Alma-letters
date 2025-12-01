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

			<table role='presentation'  cellspacing="0" cellpadding="5" border="0">

				<tr>
					<td>
						<strong>@@reminder_message@@</strong>
						<br/>
						<br/>
					</td>
				</tr>
			  <xsl:if test="count(notification_data/deposit_activity_display/new_deposit_displays/deposit_data_display) > 0">
			  		<tr>
						<td>
							<strong>@@new_deposits@@</strong>
							<xsl:if test="notification_data/deposit_activity_display/last_run">
							( @@since@@ <xsl:value-of select="notification_data/deposit_activity_display/last_run"/> )
							</xsl:if>
						</td>
					</tr>
			  		<tr>
						<td>

						<table role='presentation'  cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
								</xsl:attribute>
								<tr>
									<th><strong>@@deposit_id@@</strong></th>
									<th><strong>@@status@@</strong></th>
									<th><strong>@@title@@</strong></th>
									<th><strong>@@date_created@@</strong></th>
									<th><strong>@@date_updated@@</strong></th>
								</tr>

								<xsl:for-each select="notification_data/deposit_activity_display/new_deposit_displays/deposit_data_display">
								<tr>
									<td><xsl:value-of select="deposit_id"/></td>
									<td><xsl:value-of select="status"/></td>
									<td><xsl:value-of select="title"/></td>
									<td><xsl:value-of select="date_created"/></td>
									<td><xsl:value-of select="date_updated"/></td>
								</tr>
								</xsl:for-each>
						</table>
						</td>
					</tr>
					<tr><td><br/></td></tr>
					<tr><td><br/></td></tr>
					<tr><td><br/></td></tr>
					<tr><td><br/></td></tr>
				</xsl:if>



			  <xsl:if test="notification_data/deposit_activity_display/active_deposit_displays">
			  		<tr>
						<td>
							<strong>@@active_deposits@@</strong>
						</td>
					</tr>
			  		<tr>
						<td>

						<table role='presentation'  cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
								</xsl:attribute>
								<tr>
									<th><strong>@@deposit_id@@</strong></th>
									<th><strong>@@status@@</strong></th>
									<th><strong>@@title@@</strong></th>
									<th><strong>@@date_created@@</strong></th>
									<th><strong>@@date_updated@@</strong></th>
								</tr>

								<xsl:for-each select="notification_data/deposit_activity_display/active_deposit_displays/deposit_data_display">
								<tr>
									<td><xsl:value-of select="deposit_id"/></td>
									<td><xsl:value-of select="status"/></td>
									<td><xsl:value-of select="title"/></td>
									<td><xsl:value-of select="date_created"/></td>
									<td><xsl:value-of select="date_updated"/></td>
								</tr>
								</xsl:for-each>
						</table>
			  		</td>
					</tr>

				</xsl:if>

					<tr>
						<td>
						<br/>
						<xsl:variable name="depositUrl"><xsl:value-of select="notification_data/deposit_activity_display/deposit_access_url"/></xsl:variable>
							@@click@@ <strong><a href="{$depositUrl}">
							@@here@@</a></strong>&#160;@@access_deposits@@
							<br/>
							<br/>
							</td>
					</tr>


			</table>

			<br />

			<table role='presentation' >
				<tr><td>@@sincerely@@</td></tr>
				<tr><td>@@department@@</td></tr>
			</table>

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
