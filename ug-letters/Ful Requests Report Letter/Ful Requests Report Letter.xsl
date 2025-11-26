<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<!-- Library tests for Home Delivery & Curbside Pickup and McLaughlin Library: potential search:  and position() = 1 -->
<xsl:variable name="mclaughlin_non_active">
	<xsl:if test="notification_data/non_active_requests/ful_request_interpated">                        
		<xsl:for-each select="notification_data/non_active_requests/ful_request_interpated[starts-with(pickup_location_display, 'McLaughlin Library')]">		
			TRUE
		</xsl:for-each>
	</xsl:if>		
</xsl:variable>

<xsl:variable name="curbside_pickup_non_active">
	<xsl:if test="notification_data/non_active_requests/ful_request_interpated">                        
		<xsl:for-each select="notification_data/non_active_requests/ful_request_interpated[starts-with(pickup_location_display, 'Curbside Pickup')]">		
			TRUE
		</xsl:for-each>
	</xsl:if>		
</xsl:variable>

<xsl:variable name="home_delivery_non_active">
	<xsl:if test="notification_data/non_active_requests/ful_request_interpated">                        
		<xsl:for-each select="notification_data/non_active_requests/ful_request_interpated[starts-with(pickup_location_display, 'Home Delivery')]">		
			TRUE
		</xsl:for-each>
	</xsl:if>		
</xsl:variable>

<xsl:variable name="mclaughlin_process">
	<xsl:if test="notification_data/process_requests/ful_request_interpated">	
		<xsl:for-each select="notification_data/process_requests/ful_request_interpated[starts-with(pickup_location_display, 'McLaughlin Library')]">		
			TRUE
		</xsl:for-each>
	</xsl:if>		
</xsl:variable>

<xsl:variable name="curbside_pickup_process">
	<xsl:if test="notification_data/process_requests/ful_request_interpated">	
		<xsl:for-each select="notification_data/process_requests/ful_request_interpated[starts-with(pickup_location_display, 'Curbside Pickup')]">		
			TRUE
		</xsl:for-each>
	</xsl:if>		
</xsl:variable>

<xsl:variable name="home_delivery_process">
	<xsl:if test="notification_data/process_requests/ful_request_interpated">		
		<xsl:for-each select="notification_data/process_requests/ful_request_interpated[starts-with(pickup_location_display, 'Home Delivery')]">		
			TRUE
		</xsl:for-each>
	</xsl:if>		
</xsl:variable>

<xsl:variable name="mclaughlin_hold">
	<xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">                        
		<xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated[starts-with(pickup_location_display, 'McLaughlin Library')]">		
			TRUE	
		</xsl:for-each>
	</xsl:if>				
</xsl:variable>

<xsl:variable name="curbside_pickup_hold">
	<xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">                        
		<xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated[starts-with(pickup_location_display, 'Curbside Pickup')]">		
			TRUE	
		</xsl:for-each>
	</xsl:if>				
</xsl:variable>

<xsl:variable name="home_delivery_hold">
	<xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">                        
		<xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated[starts-with(pickup_location_display, 'Home Delivery')]">		
			TRUE	
		</xsl:for-each>
	</xsl:if>						
</xsl:variable>

<!-- templates get rendered at a different time then inline if statements, this allows us to get info under the details tables -->
<xsl:template name="home_delivery_note">
	<xsl:choose>
		<xsl:when test="(string-length($mclaughlin_non_active) > 0) or (string-length($mclaughlin_process) > 0) or (string-length($mclaughlin_hold) > 0)">
			<tr>
				<strong>Home delivery options are also available for patrons.</strong> In the future, you may select “Home Delivery” as your pickup option when placing requests in Omni. We encourage only essential trips to campus! <a href="https://www.lib.uoguelph.ca/using-library/reopening-library-services/">Learn more about our home delivery option on our website</a>.
			</tr>
			<br/>
			<br/>
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

				<!-- AFN CODE -->
                <xsl:choose>
                    <!-- AFN test (is_afn_patron) defined in footer.xsl -->
                    <xsl:when test="(string-length($is_afn_patron) > 0)">
                        <!-- UG currently SEND AFN requests via on hold shelf, terminate this letter -->
                        <!-- FUL REQUESTS for NON AFN -->
                        <xsl:message terminate="yes">user group is an AFN patron - TERMINATE </xsl:message>

                        <!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
                        <xsl:choose>
                            <xsl:when test="(string-length($is_preferred_lang_fr) > 0)">                                
                                <!-- handle AFN default language fr -->

                                <table role='presentation' cellspacing="0" cellpadding="5" border="0" style="float:left">
                                    <xsl:attribute name="style">
                                        <xsl:call-template name="mainTableStyleCss" />
                                        <!-- style.xsl -->
                                    </xsl:attribute>

                                    <!-- for AFN we're ONLY going to show when on hold shelf -->
                                    <xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">
                                        <tr>
											<td>
                                            	Le(s)document(s) que vous avez demandé(s) de <xsl:value-of select="notification_data/organization_unit/name"/> est (sont) maintenant prêt(s) à être récupéré(s) au lieu de ramassage indiqué:
											</td>
                                        </tr>										
                                        <tr>
                                            <td>
												<br/>										
                                                <table role='presentation' >
                                                    <xsl:attribute name="style">
                                                        <xsl:call-template name="mainTableStyleCss" />
                                                        <!-- style.xsl -->
                                                    </xsl:attribute>
                                                    <tr>
                                                        <xsl:attribute name="style">
                                                            <xsl:call-template name="headerTableStyleCss" />
                                                            <!-- style.xsl -->
                                                        </xsl:attribute>
                                                        <!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
                                                        <!-- 
                                                            <th>Type</th>
                                                            <th>Title</th>
                                                            <th>Author</th>
                                                            <th>Status</th>
                                                            <th>Pickup location</th>
                                                         -->
                                                        <th>Type</th>
                                                        <th>Titre</th>
                                                        <th>Auteur</th>
                                                        <th>État</th>
                                                        <th>Lieu de ramassage</th>
                                                    </tr>
                                                    <xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated">
                                                        <tr>
                                                            <td>
                                                                <xsl:value-of select="request_type_display"/>
                                                            </td>
                                                            <td>
                                                                <xsl:value-of select="title_display"/>
                                                            </td>
                                                            <td>
                                                                <xsl:value-of select="author_display"/>
                                                            </td>
                                                            <td>
                                                                <xsl:value-of select="request_status_display"/>
                                                            </td>
                                                            <td>
                                                                <!-- pickup_location_displayjust contains a numerical code..potential ticket -->
                                                                <!-- just show a inst. name -->
                                                                <!-- <xsl:value-of select="pickup_location_display"/> -->
                                                                <xsl:value-of select="from_another_inst"/>
                                                            </td>
                                                        </tr>
                                                    </xsl:for-each>
                                                </table>
                                                <hr/>
                                                <br />
                                            </td>
                                        </tr>

										<tr>
											<td>												
												<!-- AFN-VERSION 1.1 -->
												Pour connaitre les heures de service et les informations sur le ramassage, veuillez consulter la page web de la bibliothèque sur le ramassage, donnée ci-dessus.
												<br/>
											</td>
										</tr>

                                    </xsl:if>
                                </table>     
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- handle AFN default language en -->

                                <table role='presentation' cellspacing="0" cellpadding="5" border="0" style="float:left">
                                    <xsl:attribute name="style">
                                        <xsl:call-template name="mainTableStyleCss" />
                                        <!-- style.xsl -->
                                    </xsl:attribute>

                                    <!-- for AFN we're ONLY going to show when on hold shelf -->
                                    <xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">
                                        <tr>
											<td>
                                            	The item(s) you requested from <xsl:value-of select="notification_data/organization_unit/name"/> are now available at the indicated pickup location(s):
											</td>
                                        </tr>
										
                                        <tr>
                                            <td>
												<br/>
                                                <table role='presentation' >
                                                    <xsl:attribute name="style">
                                                        <xsl:call-template name="mainTableStyleCss" />
                                                        <!-- style.xsl -->
                                                    </xsl:attribute>
                                                    <tr>
                                                        <xsl:attribute name="style">
                                                            <xsl:call-template name="headerTableStyleCss" />
                                                            <!-- style.xsl -->
                                                        </xsl:attribute>
                                                        <th>Type</th>
                                                        <th>Title</th>
                                                        <th>Author</th>
                                                        <th>Status</th>
                                                        <th>Pickup location</th>
                                                    </tr>
                                                    <xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated">
                                                        <tr>
                                                            <td>
                                                                <xsl:value-of select="request_type_display"/>
                                                            </td>
                                                            <td>
                                                                <xsl:value-of select="title_display"/>
                                                            </td>
                                                            <td>
                                                                <xsl:value-of select="author_display"/>
                                                            </td>
                                                            <td>
                                                                <xsl:value-of select="request_status_display"/>
                                                            </td>
                                                            <td>
                                                                <!-- pickup_location_displayjust contains a numerical code..potential ticket -->
                                                                <!-- just show a inst. name -->
                                                                <!-- <xsl:value-of select="pickup_location_display"/> -->
                                                                <xsl:value-of select="from_another_inst"/>                                                                
                                                            </td>
                                                        </tr>
                                                    </xsl:for-each>
                                                </table>
                                                <hr/>
                                                <br />
                                            </td>
                                        </tr>

										<tr>                                                                                                                                
                                            <td>                                                
                                                Please check the website at the pickup library indicated above for service hours and pickup information.
                                                <br/>
                                            </td>
                                        </tr>

                                    </xsl:if>
                                </table>        
                                                    
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- AFN TODO -->
                        <!-- handle local institution on hold (ie. PUT YOUR EXISTING HOLD LETTER INFO HERE between the xsl:otherwise tag)-->                                                                                            

						<table cellspacing="0" cellpadding="5" border="0"  style="float:left">
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
							</xsl:attribute>					
							<!-- to test library / location: notification_data/non_active_requests/ful_request_interpated/pickup_location_display -->	
							<!-- <xsl:when test="(string-length($curbside_pickup_non_active) > 0) contains($curbside_pickup_non_active, 'TRUE') or contains($curbside_pickup_process, 'TRUE')"> -->					
							<xsl:choose>                    
								<xsl:when test="((string-length($mclaughlin_non_active) > 0) or (string-length($mclaughlin_process) > 0)) and (notification_data/user_for_printing/user_group != 'TUGUSER')">
									<tr>
										<h2>McLaughlin Library:</h2>
									</tr>							
									<tr>
										Some of the following item(s) are still being processed for the McLaughlin Library In-person pick up service. When your item(s) are ready, you'll receive a notification so you can plan your visit.
									</tr>							
									<br/>
									<br/>
								</xsl:when>
								<xsl:when test="(string-length($mclaughlin_hold) > 0) and (notification_data/user_for_printing/user_group != 'TUGUSER')">
									<tr>
										<h2>McLaughlin Library:</h2>
									</tr>							
									<tr>
										The following item(s) can be picked up at the Ask Us Desk on the first floor of McLaughlin Library. Please check the <a href="https://www.lib.uoguelph.ca/service-hours/">Library’s Building and Service Hours</a> webpage before coming to campus to pick up your item(s).
									</tr>				
									<br/>
									<br/>			
									<tr>
										<strong>Please note that you must use a valid University of Guelph ID card with i-class chip to gain entry to the Library and to present to staff when picking up your materials in-person.</strong>
									</tr>
									<br/>
									<br/>
								</xsl:when>								
								<xsl:otherwise>						
								</xsl:otherwise>			
							</xsl:choose>						

							<xsl:choose>                    
								<xsl:when test="((string-length($curbside_pickup_non_active) > 0) or (string-length($curbside_pickup_process) > 0)) and (notification_data/user_for_printing/user_group != 'TUGUSER')">
									<tr>
										<h2>Curbside:</h2>
									</tr>							
									<tr>
										Some of the following item(s) are still being processed for the Curbside pick up service. When your item(s) are ready, you'll receive a notification to schedule a pickup time.
									</tr>							
									<br/>
									<br/>
								</xsl:when>
								<xsl:when test="(string-length($curbside_pickup_hold) > 0) and (notification_data/user_for_printing/user_group != 'TUGUSER')">
									<tr>
										<h2>Curbside:</h2>
									</tr>							
									<tr>
										The following item(s) can be picked up at the Curbside pick up service.								
									</tr>
									<tr>
										Please schedule a pickup time by going to <a href="https://cal.lib.uoguelph.ca/appointments/library_curbside">https://cal.lib.uoguelph.ca/appointments/library_curbside</a>.
									</tr>
									<tr>
										<strong>Please note that you must use a valid University of Guelph email address to book a curbside pick up.</strong>
									</tr>
									<br/>
									<br/>
									<tr>
										<strong>Only one time slot is needed to collect ALL items for which you have received an available notice.</strong>
									</tr>
									<tr>
										You do not need to select more than one pickup time per week. If you wish you change your pickup time, please edit the original appointment.
									</tr>
									<br/>
									<br/>
								</xsl:when>								
								<xsl:otherwise>									
								</xsl:otherwise>			
							</xsl:choose>							

							<xsl:choose>                    				
								<xsl:when test="((string-length($home_delivery_non_active) > 0) or (string-length($home_delivery_process) > 0)) and (notification_data/user_for_printing/user_group != 'TUGUSER')">								
									<tr>
										<h2>Home Delivery:</h2>
									</tr>							
									<tr>
										Some of the following item(s) is still being processed for Home Delivery service. When your item(s) is ready, you'll receive a notification to verify your current phone number and mailing address.
									</tr>       
									<br/>
									<br/>                                                         
								</xsl:when>
								<xsl:when test="(string-length($home_delivery_hold) > 0) and (notification_data/user_for_printing/user_group != 'TUGUSER')">
									<tr>
										<h2>Home Delivery:</h2>
									</tr>							
									<tr>
										The following item(s) is ready for Home Delivery service. <strong>Please e-mail <a href="mailto:library@uoguelph.ca">library@uoguelph.ca</a> with your current phone number and mailing address (the address to which you want the books delivered)</strong>. Staff will process your delivery as soon as possible after confirmation of your address.
									</tr>
									<br/>
									<br/>
								</xsl:when>
								<xsl:otherwise>						
								</xsl:otherwise>			
							</xsl:choose>																				
							
							<xsl:if test="notification_data/non_active_requests/ful_request_interpated">   
								<tr>
									<td>
										<table>								

										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
										</xsl:attribute>
											<tr>
												<h3>@@not_active@@</h3>
											</tr>
											<tr>
												<h>@@not_active_description@@</h>
											</tr>                                             						                    

											<tr>
											<xsl:attribute name="style">
												<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
											</xsl:attribute>
												<th>@@type@@</th>
												<th>@@title@@</th>												
												<th>@@place_in_queue@@</th>
												<th>@@pickup_location@@</th>
											</tr>
											<xsl:for-each select="notification_data/non_active_requests/ful_request_interpated">
											<tr>
												<td><xsl:value-of select="request_type_display"/></td>
												<td><xsl:value-of select="title_display"/></td>												
												<td><xsl:value-of select="place_in_queue"/></td>
												<td><xsl:value-of select="pickup_location_display"/></td>
											</tr>
											</xsl:for-each>
										</table><hr/><br />
									</td>
								</tr>
							</xsl:if>
																		
							<xsl:if test="notification_data/process_requests/ful_request_interpated">					
								<tr>
									<td>
										<table>							
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
										</xsl:attribute>
										
											<tr>
												<h3>@@in_process@@</h3>
											</tr>
											<tr>
												<h>@@in_process_description@@</h>
											</tr>
										
											<tr>
											<xsl:attribute name="style">
												<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
											</xsl:attribute>
												<th>@@type@@</th>
												<th>@@title@@</th>												
												<th>@@status@@</th>
												<th>@@pickup_location@@</th>
											</tr>

											<xsl:for-each select="notification_data/process_requests/ful_request_interpated">
											<tr>
												<td><xsl:value-of select="request_type_display"/></td>
												<td><xsl:value-of select="title_display"/></td>												
												<td><xsl:value-of select="request_status_display"/></td>
												<td><xsl:value-of select="pickup_location_display"/></td>
											</tr>
											</xsl:for-each>
										</table><hr/><br />
									</td>
								</tr>
							</xsl:if>
								
												
							<xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">                        
								<tr>
									<td>
										<table>
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
										</xsl:attribute>
											<tr>
												<h3>@@on_hold_shelf@@</h3>
											</tr>
											<xsl:choose>                    																
												<xsl:when test="(string-length($home_delivery_hold) > 0)">						
													<tr>
														<h>The item(s) that you requested is available:</h>
													</tr>
												</xsl:when>			
												<xsl:otherwise>	
													<tr>
														<h>@@on_hold_shelf_description@@</h>
													</tr>					
												</xsl:otherwise>			
											</xsl:choose>												

											<tr>
											<xsl:attribute name="style">
												<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
											</xsl:attribute>
												<th >@@type@@</th>
												<th>@@title@@</th>												
												<th>@@status@@</th>												
											</tr>
											<xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated">
											<tr>
												<td><xsl:value-of select="request_type_display"/></td>
												<td><xsl:value-of select="title_display"/></td>												
												<td><xsl:value-of select="request_status_display"/></td>												
											</tr>
											</xsl:for-each>
										</table><hr/><br />
									</td>
								</tr>
							</xsl:if>	

						</table>

                        <!-- END OF AFN TODO -->
                    </xsl:otherwise>
                </xsl:choose>
                <!-- END OF AFN CODE -->   				
				
				<xsl:choose>
                    <!-- AFN test (is_afn_patron) defined in footer.xsl -->
                    <xsl:when test="(string-length($is_afn_patron) = 0)">
						<xsl:call-template name="home_delivery_note" />
					</xsl:when>						
					<xsl:otherwise>										
					</xsl:otherwise>
				</xsl:choose>	
				
				<!-- AFN TODO -->
                <xsl:call-template name="AFNLastFooter" />
                <xsl:call-template name="AFNAccount" />
                <!-- END OF AFN TODO -->					

			</body>
	</html>
</xsl:template>

</xsl:stylesheet>