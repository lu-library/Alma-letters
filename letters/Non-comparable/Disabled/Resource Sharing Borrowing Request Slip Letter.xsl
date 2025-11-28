<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="utf-8" indent="yes"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />
    <xsl:include href="style.xsl"/>
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
                <xsl:call-template name="generalStyle"/>
            </head>
            <body>
                <xsl:attribute name="style">
                    <xsl:call-template name="bodyStyleCss" />
                </xsl:attribute>

                <!-- Title ("Letter of Transmittal") -->
                <h3 style="text-align:center">@@slip_title@@</h3>

                <table role='presentation'  cellpadding="5">
                    <xsl:attribute name="style">
                        <!-- style.xsl -->
                        <xsl:call-template name="mainTableStyleCss" />
                    </xsl:attribute>
                    <tbody><tr><td>

                        <!--
                            First section is some bits from notification_data/nacsis_data/request_details/
                        -->
                        <table cellpadding="5">
                            <tbody>
                                <!-- No (or few) labels here? -->
                                <tr>
                                    <!-- ID : NACSIS request ID (not request number) -->
                                    <td><xsl:value-of select="notification_data/nacsis_data/request_details/request_id"/></td>
                                    <!-- Borrowing library name (OMLNM) + Borrowing library ID (OMLID) -->
                                    <td>
                                        <xsl:value-of select="notification_data/nacsis_data/request_details/bor_lib_name"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="notification_data/nacsis_data/request_details/bor_lib_id"/>
                                    </td>
                                    <!-- Lending library name (AMLNM) + Lending library ID (AMLID) -->
                                    <td>
                                        <xsl:value-of select="notification_data/nacsis_data/request_details/len_lib_name"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="notification_data/nacsis_data/request_details/len_lib_id"/>
                                    </td>
                                </tr>
                                <!-- @@shipping_method@@: send_method -->
                                <tr>
                                    <th>@@shipping_method@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/request_details/send_method"/></td>
                                </tr>
                                <!-- STAT NACSIS Request Status <request_stat> -->
                                <tr>
                                    <th>@@request_status@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/request_details/request_stat"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <hr/>

                        <!--
                            Second section is some bits from notification_data/nacsis_data/request_details/
                            and notification_data/nacsis_data/service_type (?)
                        -->
                        <table cellpadding="5">
                            <tbody>
                                <!-- SRVCE: Request Type = service_type (copy or loan or borrow) -->
                                <tr>
                                    <th>@@service_type@@:</th>
                                    <xsl:variable name="serviceType" select="notification_data/nacsis_data/service_type"/>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="$serviceType = 'B'"><xsl:text>@@loan@@</xsl:text></xsl:when>
                                            <xsl:when test="$serviceType = 'C'"><xsl:text>@@copy@@</xsl:text></xsl:when>
                                        </xsl:choose>
                                    </td>
                                </tr>
                                <!-- ONO: Request Number = <bor_local_id> (not request_id)-->
                                <tr>
                                    <th>@@bor_request_local_id@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/request_details/bor_local_id"/></td>
                                </tr>
                                <!-- ADATE : len_request_date  -->
                                <tr>
                                    <th>@@lending_request_create_date@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/dates/len_request_date"/></td>
                                </tr>
                                <!-- ACCT: Payment class = payment_type -->
                                <tr>
                                    <th>@@payment_type@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/request_details/payment_type"/></td>
                                </tr>
                                <!-- TYPE: Copy type = copy_type (if copy) -->
                                <tr>
                                    <th>@@copy_type@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/request_details/copy_type"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <hr/>

                        <!-- Third section is possibly some more data from notification_data/nacsis_data/request_details/
                            followed by the shipping data
                        -->
                        <table cellpadding="5">
                            <tbody>
                                <!-- "Reception number" = Local ILS request ID (lender) ANO: len_local_id  -->
                                <tr>
                                    <th>@@lending_request_local_id@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/request_details/len_local_id"/></td>
                                </tr>
                                <!-- ODATE: requested_date -->
                                <tr>
                                    <th>@@requested_date@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/dates/requested_date"/></td>
                                </tr>
                                <!-- SDATE: Shipping date = ship_date -->
                                <tr>
                                    <th>@@shipping_date@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/dates/ship_date"/></td>
                                </tr>
                                <!-- DDATE: Return deadline = return_due_date -->
                                <tr>
                                    <th>@@return_deadline@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/dates/return_due_date"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <!-- Repeatable: notification_data/nacsis_data/shipping_cost_list/shipping_cost -->
                        <!--
                            size: <item>           \
                            unit price : <uprice>   > These 4 are a group (optional + repeatable), on one line. Usually for Copy, not for Loan.
                            quantity : <quantity>  /
                            subtotal : <charge>   /
                        -->
                        <!-- Not repeatable:
                            base fee : <fee>      \
                            shipping fee : <post>  > These 3 are a group, on one line.
                            total : <sum>         /
                        -->
                        <table cellpadding="5">
                            <tbody>
                                <xsl:for-each select="notification_data/nacsis_data/shipping_cost_list/shipping_cost">
                                    <tr>
                                        <!-- item -->
                                        <th>@@size@@:</th>
                                        <td><xsl:value-of select="item"/></td>
                                        <!-- unit price -->
                                        <th>@@unit_price@@:</th>
                                        <td><xsl:value-of select="uprice"/></td>
                                        <!-- quantity -->
                                        <th>@@quantity@@:</th>
                                        <td><xsl:value-of select="quantity"/></td>
                                        <!-- charge -->
                                        <th>@@subtotal@@:</th>
                                        <td><xsl:value-of select="charge"/></td>
                                    </tr>
                                </xsl:for-each>
                                <tr>
                                    <th></th><td></td>
                                    <!-- "basic fee" == fee -->
                                    <th>@@basic_fee@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/fee"/></td>
                                    <!-- shipping fee == post -->
                                    <th>@@shipping_fee@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/post"/></td>
                                    <!-- total == sum -->
                                    <th>@@total@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/sum"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <hr/>

                        <!-- Fourth section is from
                            <bib_data>
                              <bib_id></bib_id>
                              <bib_title></bib_title>
                              <bib_std_num></bib_std_num>
                              <volume></volume>
                              <page></page>
                              <year></year>
                              <artcl></artcl>
                            </bib_data>
                        -->

                        <table cellpadding="5">
                            <tbody>
                                <!-- no labels for bib id/title? -->
                                <tr>
                                    <td><xsl:value-of select="notification_data/nacsis_data/bib_data/bib_id"/></td>
                                    <td><xsl:value-of select="notification_data/nacsis_data/bib_data/bib_title"/></td>
                                    <td><xsl:value-of select="notification_data/nacsis_data/bib_data/bib_std_num"/></td>
                                </tr>
                                <!-- article == artcl -->
                                <tr>
                                    <th>@@article@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/bib_data/artcl"/></td>
                                </tr>
                                <!-- Volume number == volume -->
                                <tr>
                                    <th>@@volume_number@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/bib_data/volume"/></td>
                                </tr>
                                <!-- page == page -->
                                <tr>
                                    <th>@@page@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/bib_data/page"/></td>
                                </tr>
                                <!-- year == year -->
                                <tr>
                                    <th>@@year@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/bib_data/year"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <hr/>

                        <!-- Fifth section: applicant data:
                            <app>
                              <name></name>
                              <affiliation></affiliation>
                            </app>
                        -->
                        <table cellpadding="5">
                            <tbody>
                                <!-- Applicant name = <name> -->
                                <tr>
                                    <th>@@applicant_name@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/app/name"/></td>
                                </tr>
                                <!-- Affiliation = <affiliation> -->
                                <tr>
                                    <th>@@affiliation@@:</th>
                                    <td><xsl:value-of select="notification_data/nacsis_data/app/affiliation"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <hr/>

                        <!-- Sixth section: Not <comments>!
                            This is fixed text, either part of XSL or from label.
                        -->
                        <table cellpadding="5">
                            <tbody>
                                <tr>
                                    <td>@@apology_message@@</td>
                                </tr>
                            </tbody>
                        </table>
                        <hr/>
                        <table cellpadding="5">
                            <tbody>
                                <tr>
                                    <td>@@message_to_lender@@</td>
                                </tr>
                            </tbody>
                        </table>

                        <hr/>

                        <!-- Last section is the contact information
                            Delivery Address (the borrower)

                            From (the lender)

                                <zip></zip>
                                <address></address>
                                <name></name>
                                <ill_dept></ill_dept>
                                <ill_staff></ill_staff>
                                <tel></tel>
                                <ex_tel></ex_tel>
                                <fax></fax>
                                <email></email>
                                <offset_code></offset_code>
                        -->
                        <table cellpadding="5">
                            <xsl:attribute name="style">
                                <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
                            </xsl:attribute>
                            <tbody>
                                <!-- Delivery Address (borrower) -->
                                <tr>
                                    <td style="width:50%;vertical-align:top">
                                        <table cellpadding="5">
                                            <tbody>
                                                <tr>
                                                    <th>@@delivery_address@@:</th>
                                                </tr>
                                                <xsl:if test="notification_data/nacsis_data/borrower/zip != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/borrower/zip"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/borrower/member_id != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/borrower/member_id"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/borrower/name != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/borrower/name"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/borrower/address != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/borrower/address"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/borrower/ill_dept != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/borrower/ill_dept"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/borrower/tel != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/borrower/tel"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/borrower/extra_tel != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/borrower/extra_tel"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/borrower/fax != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/borrower/fax"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/borrower/email != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/borrower/email"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                            </tbody>
                                        </table>
                                    </td>

                                    <!-- From (lender) -->
                                    <td style="vertical-align:top">
                                        <table cellpadding="5">
                                            <tbody>
                                                <tr>
                                                    <th>@@from@@:</th>
                                                </tr>
                                                <xsl:if test="notification_data/nacsis_data/active_lender/zip != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/active_lender/zip"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/active_lender/member_id != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/active_lender/member_id"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/active_lender/name != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/active_lender/name"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/active_lender/address != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/active_lender/address"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/active_lender/ill_dept != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/active_lender/ill_dept"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/active_lender/tel != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/active_lender/tel"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/active_lender/ex_tel != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/active_lender/ex_tel"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/active_lender/fax != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/active_lender/fax"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                                <xsl:if test="notification_data/nacsis_data/active_lender/email != ''">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="notification_data/nacsis_data/active_lender/email"/>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td></tr></tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
