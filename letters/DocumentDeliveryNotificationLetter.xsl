<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />
  <xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator" />
  <xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery" />

  <xsl:template match="/">
    <html>
      <head>
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
        <div class="messageArea">
          <div class="messageBody">
          	<table cellspacing="0" cellpadding="5" border="0">
          		<tr>
					<td>@@your_request@@.</td>
				</tr>
				<tr>
					<td><h2>@@title@@: <xsl:value-of select="notification_data/phys_item_display/title"/></h2></td>
				</tr>
				<xsl:if test="notification_data/resource_sharing_request/flat_d/author !=''">
				<tr>
					<td>Author: <xsl:value-of select="notification_data/resource_sharing_request/flat_d/author"/></td>
				</tr>
				</xsl:if>
				<xsl:if test="notification_data/resource_sharing_request/flat_d/volume !=''">
				<tr>
					<td>Volume: <xsl:value-of select="notification_data/resource_sharing_request/flat_d/volume"/></td>
				</tr>
				</xsl:if>
				<xsl:if test="notification_data/resource_sharing_request/flat_d/issue !=''">
				<tr>
					<td>Issue: <xsl:value-of select="notification_data/resource_sharing_request/flat_d/issue"/></td>
				</tr>
				</xsl:if>
				<tr>
					<td>@@to_see_the_resource@@</td>
				</tr>
				<tr>
					<td>@@for_saml_users@@<a><xsl:attribute name="href"><xsl:value-of select="notification_data/download_url_saml" /></xsl:attribute>@@click_here@@</a></td>
				</tr>
				<tr>
                    <td>
                        @@max_num_of_views@@
                        <xsl:choose>
                            <!-- primary use document_delivery_max_num_of_views -->
                            <xsl:when test="string-length(normalize-space(//document_delivery_max_num_of_views)) &gt; 0">
                                <xsl:value-of select="//document_delivery_max_num_of_views"/>
                            </xsl:when>

                            <!-- secondary use borrowing_document_delivery_max_num_of_views -->
                            <xsl:when test="string-length(normalize-space(//borrowing_document_delivery_max_num_of_views)) &gt; 0">
                                <xsl:value-of select="//borrowing_document_delivery_max_num_of_views"/>
                            </xsl:when>

                            <!-- fallback to be 5 -->
                            <xsl:otherwise>
                                5
                            </xsl:otherwise>
                        </xsl:choose>
                        .</td>
                </tr>
				<tr>
                <td>
    ___________________________________________________________________________________________ 
    <br />
            <br />
                </td>
              </tr>

              <tr>
					<td><strong>Copyright Statement - As you previously agreed:</strong></td>
				</tr>				        
        <tr>
					<td>You will receive only a single copy of the requested article/document.</td>
				</tr>				        
        <tr>
					<td>This copy has been made pursuant to the Fair Dealing Policy of Lakehead University, for use by a student, staff member, faculty member, or library patron. This copy may be used by the recipient solely for the purpose of research, private study, education, parody, satire, criticism, review, or news reporting. When using the copy for the purpose of criticism, review, or news reporting, attribution must be given to the source, including the name of the author or creator, if available.</td>
				</tr>				        
        <tr>
					<td>Any further reproduction or distribution of this copy, or use for any purpose other than those specified above, may require the consent of the copyright owner.</td>
				</tr>				        
        <tr>
					<td><strong>Failing to comply with the above conditions may constitute copyright infringement under Canadian law.</strong></td>
				</tr>
              
              <tr>
                <td>@@sincerely@@<br />@@department@@</td>
              </tr>
            </table>
          </div>
        </div>
        <xsl:call-template name="lastFooter" />
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
