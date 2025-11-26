<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />

<xsl:variable name="found_mclaughlin">
    <xsl:if test="notification_data/item_loans/item_loan">	
        <xsl:for-each select="notification_data/item_loans/item_loan[starts-with(library_name, 'McLaughlin Library')]">		
            TRUE
        </xsl:for-each>
    </xsl:if>		
</xsl:variable>

<xsl:variable name="found_humber">
    <xsl:if test="notification_data/item_loans/item_loan">	
        <xsl:for-each select="notification_data/item_loans/item_loan[starts-with(library_name, 'Humber')]">		
            TRUE
        </xsl:for-each>
    </xsl:if>		
</xsl:variable>

  <xsl:template match="/">
    <html>
      <head>
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
            
            <!-- AFN CODE -->
            <xsl:choose>
                <!-- AFN test (is_afn_patron) defined in footer.xsl -->
                <xsl:when test="(string-length($is_afn_patron) > 0)">
                    <!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
                    <xsl:choose>
                        <xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
                            <p>
                                <b>Le(s) document(s) suivant(s) de <xsl:value-of select="notification_data/organization_unit/name"/> est (sont) à rendre aujourd'hui. Veuillez retourner le(s) document(s) à votre bibliothèque, ou pour un renouvellement:</b>                                
                            </p>
                            <ol class="afn_steps_list">
                                <li>
                                    <!-- use a template from footer.xml with AFN conditional link logic. displays as 1. LINK  -->
                                    <xsl:call-template name="AFNVisitLoansLink" />
                                </li>                                    
                                <li>                                        
                                    Cliquez sur <xsl:call-template name="AFNOrgName" /> à la gauche et renouvelez le(s) document(s)
                                </li>
                            </ol>
                            
                            <table cellpadding="5" class="listing">
                                <xsl:attribute name="style">
                                    <xsl:call-template name="mainTableStyleCss" />
                                    <!-- style.xsl -->
                                </xsl:attribute>
                                <tr>
                                    <!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE 
                                    <th>Title</th>
                                    <th>Author</th>
                                    <th>Due Date</th>
                                    <th>Library</th>
                                    -->
                                    <th>Titre</th>
                                    <th>Auteur</th>
                                    <th>Date de retour</th>
                                    <th>Bibliothèque</th>                                                
                                </tr>

                                <xsl:for-each select="notification_data/item_loans/item_loan">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="title"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="author"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="due_date"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="library_name"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>                                                           
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- handle AFN default language en -->
                            <p>
                                <b>The following item(s) from <xsl:value-of select="notification_data/organization_unit/name"/> are due today. Please return the item(s) to your library, or, to renew them:</b>                                
                            </p>
                            <ol class="afn_steps_list">
                                <li>
                                    <!-- use a template from footer.xml with AFN conditional link logic. displays as 1. LINK  -->
                                    <xsl:call-template name="AFNVisitLoansLink" />
                                </li>                                    
                                <li>
                                    Click the <xsl:call-template name="AFNOrgName" /> option along the left and renew items                                        
                                </li>
                            </ol>
                            
                            <table cellpadding="5" class="listing">
                                <xsl:attribute name="style">
                                    <xsl:call-template name="mainTableStyleCss" />
                                    <!-- style.xsl -->
                                </xsl:attribute>
                                <tr>
                                    <th>Title</th>
                                    <th>Author</th>
                                    <th>Due Date</th>
                                    <th>Library</th>
                                </tr>

                                <xsl:for-each select="notification_data/item_loans/item_loan">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="title"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="author"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="due_date"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="library_name"/>
                                        </td>

                                    </tr>
                                </xsl:for-each>

                            </table>
                                                           
                        </xsl:otherwise>
                    </xsl:choose>																													
                </xsl:when>
                <xsl:otherwise>			
                    <!-- AFN TODO -->
                    <!-- handle local institution on hold (ie. PUT YOUR EXISTING HOLD LETTER INFO HERE between the xsl:otherwise tag) -->
                    <p>
                        <b>@@message@@</b>                                
                        <br/>
                        <br/>
                    </p>
                    <p>
                        <b>@@loans@@</b>                                
                    </p>

                    <table cellpadding="5" class="listing" border="0">
                        <xsl:attribute name="style">
                            <xsl:call-template name="mainTableStyleCss" />
                            <!-- style.xsl -->
                        </xsl:attribute>
                        <tr>
                            <th>@@title@@</th>
                            <th>@@author@@</th>
                            <th>@@due_date@@</th>
                            <th>@@library@@</th>
                        </tr>

                        <xsl:for-each select="notification_data/item_loans/item_loan">
                            <tr>
                                <td>
                                    <xsl:value-of select="title"/>
                                </td>
                                <td>
                                    <xsl:value-of select="author"/>
                                </td>
                                <td>
                                    <xsl:value-of select="due_date"/>
                                </td>
                                <td>
                                    <xsl:value-of select="library_name"/>
                                </td>

                            </tr>
                        </xsl:for-each>
                    </table>
                    <!-- COMMENTED OUT HOLIDAY PERIOD -->
                    <!--
                    <xsl:choose>                    
                        <xsl:when test="(string-length($found_mclaughlin) > 0)">
                            <P>
                                <strong>Please note: McLaughlin Library (U of G) closes for the holidays on Friday December 20, 2024 at 5:00pm and reopens on Thursday January 2, 2025 at 9:00am. Materials cannot be returned to the library during this period. Branch libraries and Omni Network libraries may have different service dates. Please refer to our library website for current building and service hours at <a href="https://www.lib.uoguelph.ca/service-hours/">https://www.lib.uoguelph.ca/service-hours</a> before planning your trip.</strong>
                            </P>
                        </xsl:when>                        
                        <xsl:otherwise>						
                        </xsl:otherwise>			
                    </xsl:choose>			
                    <xsl:choose>                                            
                        <xsl:when test="(string-length($found_humber) > 0)">
                            <P>
                                <strong>Please note: Humber Library closes for the holidays on Friday December 20, 2024 at 4:30pm and reopens on Thursday January 2, 2025 at 8:30am. Materials cannot be returned to the library during this period. Please refer to the Humber library website for current building and service hours at <a href="https://library.humber.ca/hours">https://library.humber.ca/hours</a> before planning your trip.</strong>
                            </P>
                        </xsl:when>                        						
                        <xsl:otherwise>						
                        </xsl:otherwise>			
                    </xsl:choose>
                    -->
                    
                    <!-- END OF AFN TODO -->
                </xsl:otherwise>
            </xsl:choose>			
            <!-- END OF AFN CODE -->						
          </div>
        </div>

        <!-- AFN TODO -->
        <!-- AFN footer template options from footer.xsl -->
        <xsl:call-template name="AFNLastFooter" />
        <xsl:call-template name="AFNAccount" />
        <!-- END OF AFN TODO -->

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>