<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
<xsl:template match="/">
	<html>
		<head>
			<xsl:call-template name="generalStyle" />
		</head>
		<body>
			<xsl:call-template name="head" /> <!-- header.xsl -->
			<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
			<br />
			<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
			<div class="messageArea">
				<div class="messageBody">
                    <p>
                        The University of Guelph Library is a member of the new Omni Library System, which joins 14 Ontario University Libraries together. This system replaces Primo which you’ve used over the past 10 years.
                    </p>
                    <p>You can read more about Omni and this collaboration on our Library website: <a href="https://www.lib.uoguelph.ca/omni">https://www.lib.uoguelph.ca/omni</a></p>
                    <p>As part of this, all registered Community Borrowers, designated OMAFRA researchers, and Alumni registered with the Library, will be required to reset their passwords in order to gain access to Omni and their U of G Library Accounts.</p>
                    <p>In order to protect your security, we have created a page on the trusted Library website which contains instructions to update your information, including a link to the Omni password reset page. Please visit <a href="https://www.lib.uoguelph.ca/omni-password-reset">https://www.lib.uoguelph.ca/omni-password-reset</a> for full details.</p>                    
                    <p>When you arrive at the page above, please double-check that the URL at the top of the page begins with <a href="https://www.lib.uoguelph.ca">www.lib.uoguelph.ca</a></p>
                    <p>If you have questions or to validate this message, please feel free to contact us at the ‘Ask Us Desk’ in the library, email us at <a href="mailto:library@uoguelph.ca">library@uoguelph.ca</a>, call us at extension 53617, or visit our contact website to chat online (<a href="https://www.lib.uoguelph.ca/ask-us">https://www.lib.uoguelph.ca/ask-us</a>).</p>
		        </div>
			</div>
			<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->            
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>