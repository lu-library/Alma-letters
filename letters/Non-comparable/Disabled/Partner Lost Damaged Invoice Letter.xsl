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

            <body>
                <xsl:attribute name="style">
                    <xsl:call-template name="bodyStyleCss" />
                </xsl:attribute>

                <xsl:call-template name="head" />
                <xsl:call-template name="senderReceiver" />

                <br />

                <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

                <div class="messageBody">

                    <table role='presentation'  cellspacing="0" cellpadding="5" border="0">
                        <xsl:if  test="notification_data/invoice_id != ''" >
                            <b>@@invoiceNumber@@: <xsl:value-of select="/notification_data/invoice_id"/></b>
                        </xsl:if>
                        <br />
                        <xsl:if  test="notification_data/lending_request_lost_damaged_fee/external_identifier != ''" >
                            <b>@@externalIdentifier@@: <xsl:value-of select="notification_data/lending_request_lost_damaged_fee/external_identifier"/></b>
                        </xsl:if>
                        <br />
                        <xsl:if  test="notification_data/lending_request_lost_damaged_fee/title != ''" >
                            <b>@@title@@: <xsl:value-of select="notification_data/lending_request_lost_damaged_fee/title"/></b>
                        </xsl:if>
                        <br />
                        <xsl:if  test="notification_data/lending_request_lost_damaged_fee/charge_amount != ''" >
                            <b>@@chargeAmount@@: <xsl:value-of select="notification_data/lending_request_lost_damaged_fee/charge_amount"/>&#160;<xsl:value-of select="notification_data/lending_request_lost_damaged_fee/currency"/></b>
                        </xsl:if>
                    </table>

                    <br />
                    <table role='presentation' >

                        <tr><td>@@sincerely@@</td></tr>
                        <tr><td>@@department@@</td></tr>

                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>


