<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3c.org/2001/XMLSchema-instance" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="onelinecsv">
        <xsl:variable name="eventIDType">aacp_csv_identifier_unauthority</xsl:variable>
        <premis xmlns="info:lc/xmlns/premis-v2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="info:lc/xmlns/premis-v2 http://www.loc.gov/standards/premis/v2/premis.xsd" version="2.0">
            <object xsi:type="representation">
                <objectIdentifier>
                    <objectIdentifierType>American Archive GUID</objectIdentifierType>
                    <objectIdentifierValue><xsl:value-of select="col02"/></objectIdentifierValue>
                </objectIdentifier>
            </object>
            <!-- inspection event -->
            <xsl:if test="col08!=''">
                <event>
                    <eventIdentifier>
                        <eventIdentifierType>
                            <xsl:value-of select="$eventIDType"/>
                        </eventIdentifierType>
                        <eventIdentifierValue>
                            <xsl:value-of select="col02"/>
                            <xsl:text>-inspection</xsl:text>
                        </eventIdentifierValue>
                    </eventIdentifier>
                    <eventType>inspection</eventType>
                    <eventDateTime>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="dateParam" select="col08" />
                        </xsl:call-template>
                    </eventDateTime>
                    <xsl:if test="col09 !='' or col10!=''">
                        <eventDetail>
                            <xsl:if test="col10!=''">
                                <xsl:text>Operator: </xsl:text>
                                <xsl:value-of select="col10"/>
                            </xsl:if>
                            <xsl:if test="col09 !='' and col10!=''">
                                <xsl:text>&#10;</xsl:text>
                            </xsl:if>
                            <xsl:if test="col09!=''">
                                <xsl:text>Notes: </xsl:text>
                                <xsl:value-of select="col09"/>
                            </xsl:if>
                        </eventDetail>
                    </xsl:if>
                </event>
            </xsl:if>
            <!-- baking event -->
            <xsl:if test="col12!=''">
                <event>
                    <eventIdentifier>
                        <eventIdentifierType>
                            <xsl:value-of select="$eventIDType"/>
                        </eventIdentifierType>
                        <eventIdentifierValue>
                            <xsl:value-of select="col02"/>
                            <xsl:text>-tape-baking</xsl:text>
                        </eventIdentifierValue>
                    </eventIdentifier>
                    <eventType>tape baking</eventType>
                    <eventDateTime>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="dateParam" select="col12" />
                        </xsl:call-template>
                    </eventDateTime>
                    <xsl:if test="col11 !='' or col13!=''">
                        <eventDetail>
                            <xsl:if test="col11!=''">
                                <xsl:text>Baking OK: </xsl:text>
                                <xsl:value-of select="col11"/>
                            </xsl:if>
                            <xsl:if test="col11 !='' and col13!=''">
                                <xsl:text>&#10;</xsl:text>
                            </xsl:if>
                            <xsl:if test="col13!=''">
                                <xsl:text>Notes: </xsl:text>
                                <xsl:value-of select="col13"/>
                            </xsl:if>
                        </eventDetail>
                    </xsl:if>
                </event>
            </xsl:if>
            <!-- cleaning event -->
            <xsl:if test="col14!=''">
                <event>
                    <eventIdentifier>
                        <eventIdentifierType>
                            <xsl:value-of select="$eventIDType"/>
                        </eventIdentifierType>
                        <eventIdentifierValue>
                            <xsl:value-of select="col02"/>
                            <xsl:text>-tape-cleaning</xsl:text>
                        </eventIdentifierValue>
                    </eventIdentifier>
                    <eventType>tape cleaning</eventType>
                    <eventDateTime>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="dateParam" select="col14" />
                        </xsl:call-template>
                    </eventDateTime>
                    <xsl:if test="col15 !='' or col16!=''">
                        <eventDetail>
                            <xsl:if test="col15!=''">
                                <xsl:text>Operator: </xsl:text>
                                <xsl:value-of select="col15"/>
                            </xsl:if>
                            <xsl:if test="col15 !='' and col16!=''">
                                <xsl:text>&#10;</xsl:text>
                            </xsl:if>
                            <xsl:if test="col16!=''">
                                <xsl:text>Notes: </xsl:text>
                                <xsl:value-of select="col16"/>
                            </xsl:if>
                        </eventDetail>
                    </xsl:if>
                </event>
            </xsl:if>
            <!-- ingest event -->
            <xsl:if test="col17!=''">
                <event>
                    <eventIdentifier>
                        <eventIdentifierType>
                            <xsl:value-of select="$eventIDType"/>
                        </eventIdentifierType>
                        <eventIdentifierValue>
                            <xsl:value-of select="col02"/>
                            <xsl:text>-ingest</xsl:text>
                        </eventIdentifierValue>
                    </eventIdentifier>
                    <eventType>ingest</eventType>
                    <eventDateTime>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="dateParam" select="col17" />
                        </xsl:call-template>
                    </eventDateTime>
                    <xsl:variable name="ingestEventDetail">
                        <xsl:if test="col18 !=''">
                            <xsl:text>Operator: </xsl:text>
                            <xsl:value-of select="col18"/>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        <xsl:if test="col30 !=''">
                            <xsl:text>TRTActualIngestedTime: </xsl:text>
                            <xsl:value-of select="col30"/>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        <xsl:if test="col31 !=''">
                            <xsl:text>FormatreVTMD: </xsl:text>
                            <xsl:value-of select="col31"/>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        <xsl:if test="col32 !=''">
                            <xsl:text>AudioTrackConfiguration: </xsl:text>
                            <xsl:value-of select="col32"/>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        <xsl:if test="col33 !=''">
                            <xsl:text>ClosedCaption: </xsl:text>
                            <xsl:value-of select="col33"/>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        <xsl:if test="col35 !='' and col34 =''">
                            <xsl:text>MigrationNotes: </xsl:text>
                            <xsl:value-of select="col35"/>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:variable>
                    <xsl:if test="$ingestEventDetail !=''">
                        <eventDetail>
                            <xsl:value-of select="$ingestEventDetail"/>
                        </eventDetail>
                    </xsl:if>
                    <xsl:if test="col34 !=''">
                        <eventOutcomeInformation>
                            <eventOutcome>
                                <xsl:value-of select="col34"/>
                            </eventOutcome>
                            <xsl:if test="col35 !=''">
                                <eventOutcomeDetail>
                                    <xsl:value-of select="col35"/>
                                </eventOutcomeDetail>
                            </xsl:if>
                        </eventOutcomeInformation>
                    </xsl:if>
                </event>
            </xsl:if>
            <!-- quality control event: preservation file-->
            <xsl:if test="col19!=''">
                <event>
                    <eventIdentifier>
                        <eventIdentifierType>
                            <xsl:value-of select="$eventIDType"/>
                        </eventIdentifierType>
                        <eventIdentifierValue>
                            <xsl:value-of select="col02"/>
                            <xsl:text>-quality-control-preservation</xsl:text>
                        </eventIdentifierValue>
                    </eventIdentifier>
                    <eventType>quality control</eventType>
                    <eventDateTime>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="dateParam" select="col19" />
                        </xsl:call-template>
                    </eventDateTime>
                    <eventDetail>
                        <xsl:text>Quality control focusing the preservation file.</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:if test="col20 !=''">
                            <xsl:text>Operator: </xsl:text>
                            <xsl:value-of select="col20"/>
                        </xsl:if>
                    </eventDetail>
                </event>
            </xsl:if>
            <!-- quality control event: mezzanine file-->
            <xsl:if test="col21!=''">
                <event>
                    <eventIdentifier>
                        <eventIdentifierType>
                            <xsl:value-of select="$eventIDType"/>
                        </eventIdentifierType>
                        <eventIdentifierValue>
                            <xsl:value-of select="col02"/>
                            <xsl:text>-quality-control-mezzanine</xsl:text>
                        </eventIdentifierValue>
                    </eventIdentifier>
                    <eventType>quality control</eventType>
                    <eventDateTime>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="dateParam" select="col21" />
                        </xsl:call-template>
                    </eventDateTime>
                    <eventDetail>
                        <xsl:text>Quality control focusing the mezzanine file.</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:if test="col22 !=''">
                            <xsl:text>Operator: </xsl:text>
                            <xsl:value-of select="col22"/>
                        </xsl:if>
                    </eventDetail>
                </event>
            </xsl:if>
            <!-- quality control event: proxy file-->
            <xsl:if test="col23!=''">
                <event>
                    <eventIdentifier>
                        <eventIdentifierType>
                            <xsl:value-of select="$eventIDType"/>
                        </eventIdentifierType>
                        <eventIdentifierValue>
                            <xsl:value-of select="col02"/>
                            <xsl:text>-quality-control-proxy</xsl:text>
                        </eventIdentifierValue>
                    </eventIdentifier>
                    <eventType>quality control</eventType>
                    <eventDateTime>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="dateParam" select="col23" />
                        </xsl:call-template>
                    </eventDateTime>
                    <eventDetail>
                        <xsl:text>Quality control focusing the proxy file.</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:if test="col24 !=''">
                            <xsl:text>Operator: </xsl:text>
                            <xsl:value-of select="col24"/>
                        </xsl:if>
                    </eventDetail>
                </event>
            </xsl:if>
            <!-- quality control event: proxy file-->
            <xsl:if test="col26!=''">
                <event>
                    <eventIdentifier>
                        <eventIdentifierType>
                            <xsl:value-of select="$eventIDType"/>
                        </eventIdentifierType>
                        <eventIdentifierValue>
                            <xsl:value-of select="col02"/>
                            <xsl:text>-quality-control-wave</xsl:text>
                        </eventIdentifierValue>
                    </eventIdentifier>
                    <eventType>quality control</eventType>
                    <eventDateTime>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="dateParam" select="col26" />
                        </xsl:call-template>
                    </eventDateTime>
                    <eventDetail>
                        <xsl:text>Quality control focusing the WAVE file.</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:if test="col27 !=''">
                            <xsl:text>Operator: </xsl:text>
                            <xsl:value-of select="col27"/>
                        </xsl:if>
                    </eventDetail>
                </event>
            </xsl:if>
            <!-- quality control event: proxy file-->
            <xsl:if test="col28!=''">
                <event>
                    <eventIdentifier>
                        <eventIdentifierType>
                            <xsl:value-of select="$eventIDType"/>
                        </eventIdentifierType>
                        <eventIdentifierValue>
                            <xsl:value-of select="col02"/>
                            <xsl:text>-quality-control-mp3</xsl:text>
                        </eventIdentifierValue>
                    </eventIdentifier>
                    <eventType>quality control</eventType>
                    <eventDateTime>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="dateParam" select="col28" />
                        </xsl:call-template>
                    </eventDateTime>
                    <eventDetail>
                        <xsl:text>Quality control focusing the MP3 file.</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:if test="col29 !=''">
                            <xsl:text>Operator: </xsl:text>
                            <xsl:value-of select="col29"/>
                        </xsl:if>
                    </eventDetail>
                </event>
            </xsl:if>
        </premis>
    </xsl:template>
    
    <!-- this template was grabbed from http://stackoverflow.com/questions/10385544/xslt-convert-date-format, credit to dogbane -->
    <xsl:template name="formatDate">
            <xsl:param name="dateParam" />
            <!-- input format mm/dd/yyyy or m/d/yyyy -->
            <!-- output format yyyy-mm-dd -->
            <!-- parse out the day, month and year -->
            <xsl:variable name="month" select="substring-before($dateParam,'/')" />
            <xsl:variable name="day" select="substring-before(substring-after($dateParam,'/'),'/')" />
            <xsl:variable name="year" select="substring-after(substring-after($dateParam,'/'),'/')" />
            <!-- now print them out. Pad with 0 where necessary. -->
            <xsl:value-of select="$year" />
            <xsl:value-of select="'-'" />
            <xsl:if test="string-length($month) = 1">
                <xsl:value-of select="'0'" />
            </xsl:if>
            <xsl:value-of select="$month" />
            <xsl:value-of select="'-'" />
            <xsl:if test="string-length($day) = 1">
                <xsl:value-of select="'0'" />
            </xsl:if>
            <xsl:value-of select="$day" />
        </xsl:template>
</xsl:stylesheet>
