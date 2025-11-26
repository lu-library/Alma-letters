<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

<!-- START Test if it's an EMAIL partner, if so terminate letter -->
<xsl:variable name="is_email_partner">
	<xsl:if test="(notification_data/user_for_printing/user_group = 'NZILLUSER') or (notification_data/user/user_group = 'NZILLUSER') or (notification_data/request/user_group = 'NZILLUSER')">	
		TRUE		
	</xsl:if>
</xsl:variable>
<!-- END Test if it's an EMAIL partner, if so terminate letter -->

<!-- Library tests for Home Delivery & Curbside Pickup and McLaughlin Library: potential search: and position() = 1 -->

<xsl:variable name="mclaughlin_hold">
	<xsl:if test="notification_data/request/delivery_address">                        
        <xsl:if test="contains(notification_data/request/delivery_address, 'McLaughlin Library')">
			TRUE
        </xsl:if>				
	</xsl:if>
</xsl:variable>

<xsl:variable name="humber_hold">
	<xsl:if test="notification_data/request/delivery_address">                        
        <xsl:if test="contains(notification_data/request/delivery_address, 'Humber')">
			TRUE
        </xsl:if>				
	</xsl:if>
</xsl:variable>

<xsl:variable name="ridgetown_hold">
	<xsl:if test="notification_data/request/delivery_address">                        
        <xsl:if test="contains(notification_data/request/delivery_address, 'Ridgetown')">
			TRUE
        </xsl:if>				
	</xsl:if>
</xsl:variable>

<xsl:variable name="curbside_pickup_hold">
	<xsl:if test="notification_data/request/delivery_address">                        
        <xsl:if test="contains(notification_data/request/delivery_address, 'Curbside Pickup')">        
			TRUE
        </xsl:if>				
	</xsl:if>
</xsl:variable>

<xsl:variable name="home_delivery_hold">
	<xsl:if test="notification_data/request/delivery_address">                        
        <xsl:if test="contains(notification_data/request/delivery_address, 'Home Delivery')">        
			TRUE
        </xsl:if>
	</xsl:if>
</xsl:variable>

<!-- templates get rendered at a different time then inline if statements, this allows us to get info under the details tables -->
<xsl:template name="home_delivery_note">
	<xsl:choose>
		<xsl:when test="(string-length($mclaughlin_hold) > 0)">			
            <p>
				<strong>Home delivery options are also available for patrons.</strong> In the future, you may select “Home Delivery” as your pickup option when placing requests in Omni. We encourage only essential trips to campus! <a href="https://www.lib.uoguelph.ca/using-library/reopening-library-services/">Learn more about our home delivery option on our website</a>.
			</p>					
		</xsl:when>						
		<xsl:otherwise>						
		</xsl:otherwise>			
	</xsl:choose>						
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
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

					<div class="messageArea">
				<div class="messageBody">
					<!-- AFN CODE -->
					<xsl:choose>
						<!-- START Test if it's an EMAIL partner, if so terminate letter -->
						<xsl:when test="(string-length($is_email_partner) > 0)">
							<xsl:message terminate="yes">user group is an EMAIL ILL PARTNER - TERMINATE </xsl:message>
						</xsl:when>
						<!-- END Test if it's an EMAIL partner, if so terminate letter -->

                        <!-- AFN test (is_afn_patron) defined in footer.xsl -->
                        <xsl:when test="(string-length($is_afn_patron) > 0)">
                            <!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
                            <xsl:choose>
                                <xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
									<!-- handle AFN language fr -->
									<table cellspacing="0" cellpadding="5" border="0">
										<tr>
											<td>
                                                <!-- START AFN-VERSION 1.10 -->
												Le document suivant de [<xsl:call-template name="AFNOrgName" />] - <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>, que vous avez demandé le <xsl:value-of select="notification_data/request/create_date"/> peut être récupéré à <b><xsl:value-of select="notification_data/request/assigned_unit_name"/></b>
                                                <!-- END AFN-VERSION 1.10 -->
											</td>
										</tr>

										<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
											<tr>
												<td>
                                                    <br/>
													Le document sera conservé pour vous jusqu'au <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
												</td>
											</tr>
										</xsl:if>
										<tr>
											<td>
                                                <br/>
                                                <xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl -->
                                            </td>
										</tr>

										<!-- If notes exist, then we'll display the notes lable and the note -->
										<xsl:if test="notification_data/request/system_notes !='' ">
											<tr>
												<td>
                                                    <br/>
                                                    <b>NOTES qui peuvent affecter le prêt:</b>
                                                </td>
											</tr>

											<tr>
												<td><xsl:value-of select="notification_data/request/system_notes"/></td>
											</tr>
										</xsl:if>										
                                        
                                        <tr>
                                            <td>
                                                <br/>      
                                                <!-- AFN-VERSION 1.1 -->
                                                Pour connaitre les heures de service et des informations liées à la récupération de documents veuillez consulter ci-dessus la page web de la bibliothèque.
                                                <br/>
                                            </td>
                                        </tr>

									</table>								
								</xsl:when>	
								<xsl:otherwise>
									<!-- handle AFN language default english 'en' -->
									<table cellspacing="0" cellpadding="5" border="0">
										<tr>
											<td>
                                                <!-- START AFN-VERSION 1.10 -->
												The following item from [<xsl:call-template name="AFNOrgName" />] - <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>, which you requested on <xsl:value-of select="notification_data/request/create_date"/> can be picked up at <b><xsl:value-of select="notification_data/request/assigned_unit_name"/></b>
                                                <!-- END AFN-VERSION 1.10 -->
											</td>
										</tr>

										<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
                                            
											<tr>
												<td>
                                                    <br/>
													The item will be held for you until <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
												</td>
											</tr>
										</xsl:if>
                                        
										<tr>                                        
											<td>
                                                <br/>
                                                <xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl -->
                                            </td>
										</tr>

										<!-- If notes exist, then we'll display the notes lable and the note -->
										<xsl:if test="notification_data/request/system_notes !='' ">                                            
											<tr>
												<td>
                                                    <br/>    
                                                    <b>NOTES that may affect loan:</b>
                                                </td>
											</tr>

											<tr>
												<td><xsl:value-of select="notification_data/request/system_notes"/></td>
											</tr>
										</xsl:if>	
                                        
                                        <tr>
                                            <td>
                                                <br/>                                                
                                                Please check the website at the pickup library indicated above for service hours and pickup information.
                                                <br/>
                                            </td>
                                        </tr>
                                        									
									</table>
								</xsl:otherwise>
							</xsl:choose>																													
						</xsl:when>
						<xsl:otherwise>		                            
							<!-- AFN TODO -->
							<!-- handle local institution on hold (ie. PUT YOUR EXISTING HOLD LETTER INFO HERE between the xsl:otherwise tag)-->

							<xsl:choose>                    								
								<xsl:when test="(string-length($mclaughlin_hold) > 0)">
									<tr>
                                        <td>
										    <h2>McLaughlin Library:</h2>
                                        </td>
									</tr>
									<tr>
                                        <td>
										    @@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, can be picked up on the first floor of the McLaughlin Library from the Holds Pick-up Shelves. Please inquire at the Ask Us Desk if you need assistance. Please check the <a href="https://www.lib.uoguelph.ca/service-hours/">Library’s Building and Service Hours</a> webpage before coming to campus to pick up your item.
                                        </td>
									</tr>													

									<!-- Comment out the holiday hours -->
									<!--
									<br/>
									<br/>	                                    		
									<tr>
                                        <td>
										    <strong>Please note: McLaughlin Library (U of G) closes for the holidays on Friday December 20, 2024 at 5:00pm and reopens on Thursday January 2, 2025 at 9:00am. Materials cannot be returned to the library during this period. Branch libraries and Omni Network libraries may have different service dates. Please refer to our library website for current building and service hours at <a href="https://www.lib.uoguelph.ca/service-hours/">https://www.lib.uoguelph.ca/service-hours</a> before planning your trip.</strong>
                                        </td>
									</tr>    
									-->

									<br/>
									<br/>			
									<tr>
                                        <td>
										    <strong>Please note that you must use a valid University of Guelph ID card when picking up your materials.</strong>
                                        </td>
									</tr>
									<br/>
									<br/>
								</xsl:when>								
								<xsl:otherwise>						
								</xsl:otherwise>			
							</xsl:choose>						

							<xsl:choose>                    								
								<xsl:when test="(string-length($humber_hold) > 0)">
									<tr>
                                        <td>
										    <h2>Humber Library – North Campus (U of GH):</h2>
                                        </td>
									</tr>
									<tr>
                                        <td>
											<!-- <xsl:value-of select="notification_data/request/assigned_unit_name"/> once circ desk name in place, use this -->
										    @@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, can be picked up at <b>Humber Library – North Campus (U of GH) - Library Support Desk (LRC, 4th floor)</b>. Please check the <a href="https://library.humber.ca/hours">Library’s Building and Service Hours</a> webpage before coming to campus to pick up your item.
                                        </td>
									</tr>

									<!-- Comment out the holiday hours -->
									<!--
									<br/>
									<br/>	                                    		
									<tr>
                                        <td>
										    <strong>Please note: Humber Library closes for the holidays on Friday December 20, 2024 at 4:30pm and reopens on Thursday January 2, 2025 at 8:30am. Materials cannot be returned to the library during this period. Please refer to the Humber library website for current building and service hours at <a href="https://library.humber.ca/hours">https://library.humber.ca/hours</a> before planning your trip.</strong>
                                        </td>
									</tr>    
									-->
									
									<br/>
									<br/>
								</xsl:when>								
								<xsl:otherwise>						
								</xsl:otherwise>			
							</xsl:choose>	

							<xsl:choose>                    								
								<xsl:when test="(string-length($curbside_pickup_hold) > 0)">
									<tr>
                                        <td>
										    <h2>Curbside:</h2>
                                        </td>
									</tr>							
									<tr>
                                        <td>
										    @@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, is available for curbside pickup.
                                        </td>
									</tr>
									<tr>
                                        <td>
										    Please schedule a pickup time by going to <a href="https://cal.lib.uoguelph.ca/appointments/library_curbside">https://cal.lib.uoguelph.ca/appointments/library_curbside</a>.
                                        </td>
									</tr>
									<tr>
                                        <td>
										    Only one time slot is needed to collect ALL items for which you have received an available notice.
                                        </td>
									</tr>
									<br/>
									<br/>									
								</xsl:when>								
								<xsl:otherwise>									
								</xsl:otherwise>			
							</xsl:choose>							

							<xsl:choose>                    												
								<xsl:when test="(string-length($home_delivery_hold) > 0)">
									<tr>
                                        <td>
										    <h2>Home Delivery:</h2>
                                        </td>
									</tr>							
									<tr>
                                        <td>
										    @@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, is ready for Home Delivery service. Please e-mail <a href="mailto:library@uoguelph.ca">library@uoguelph.ca</a> with your current phone number and mailing address (the address to which you want the books delivered). Staff will process your delivery as soon as possible after confirmation of your address. If you have already provided your address to us during the current semester, there is no need to reply to this email.
                                        </td>
									</tr>
									<br/>
									<br/>                                    
								</xsl:when>
								<xsl:otherwise>						
								</xsl:otherwise>			
							</xsl:choose>		

							<table cellspacing="0" cellpadding="5" border="0">
                                                            
								<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
                                    <tr>
                                        <td>
                                            @@note_item_held_until@@ <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.
                                            </td>
                                    </tr>
                                        </xsl:if>
                                    <tr>
                                        <td><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
                                    </tr>
                                    <xsl:if test="notification_data/request/system_notes !='' ">
                                    <tr>
                                        <td><b>@@notes_affect_loan@@:</b></td>
                                    </tr>

                                    <tr>
                                        <td><xsl:value-of select="notification_data/request/system_notes"/></td>
                                    </tr>

								</xsl:if>                                

							</table>                            

							<p>If you no longer need the item please cancel your hold through <a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH">your account.</a></p>
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
