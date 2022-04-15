<?xml version="1.0" encoding="UTF-8" ?>
<!-- /*********************************************************************************
* ITC5202 – Project
* I declare that this assignment is my own work in accordance with Humber Academic Policy.
* No part of this assignment has been copied manually or electronically from any other source
* (including web sites) or distributed to other students.
*
* Group member Name: Bikal Thapa Magar| Merin Joe Chandy 
    Student IDs: N01414695 | N01482121 
    Date: 2022/04/15
*
********************************************************************************/ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>XML and JavaScript</title>
            </head>
            <style>
            table, th, td{
               border: 1px solid black;
            }
            
            body {
                width: 50%;
                margin: 20px auto;
                background-color: mintcream;
            }

            th {
                background-color: lightseagreen;
            }

            td {
                background-color: mediumaquamarine;
                text-align: center;
                padding-left: 10px;
                padding-right: 10px;
            }

            td#name{
                text-align: left; 
            }

            td#number{
                text-align: right;   
            }
            </style>
            <body>
                <!-- dropdown list -->
                <select onchange="getData()" id="country">
                    <option selected="true" disabled="true">Select Country</option>
                    <!-- Loop though each country tag -->
                    <xsl:for-each select="//country">
                    <!-- Sort countries by name -->
                        <xsl:sort select="name"/>
                        <!-- dropdown list option -->
                        <option>
                        <!-- attribute for option name -->
                            <xsl:attribute name="id">
                                <xsl:value-of select="name"/>
                            </xsl:attribute>

                            <!-- attribute for option value -->
                            <xsl:attribute name="value">
                                <!-- call the template for html table -->
                                <xsl:call-template name="table">
                                    <!-- pass current country tag as parameter using . -->
                                    <xsl:with-param name="country" select="."/>
                                </xsl:call-template>
                            </xsl:attribute>
                            <!-- Option text -->
                            <xsl:value-of select="name"/>
                        </option>
                    </xsl:for-each>
                </select>

                <p id="loc">
                </p>

                <script>
                    function getData(){
                        var data = document.getElementById("country").value;
                        document.getElementById("loc").innerHTML = data;
                    }
                </script>
            </body>
        </html>
    </xsl:template>

    <!-- template for html table -->
    <xsl:template match="mondial" name="table">
        <!-- paramter for the template -->
        <xsl:param name="country"/> 
        
        <![CDATA[ <table border="1">
                    <thead>
                        <tr> 
                            <th>Province</th>
                            <th>Local Name</th>
                            <th>Population(2011)</th>
                            <th>No of Cities</th>
                        </tr>
                    </thead>
                    <tbody>]]>
        
        <!-- Checking if province exists or not -->
        <xsl:choose>
            <!-- If province does not exist then show country info -->
            <xsl:when test="not(province/@id)">
            <!-- using CDATA to persist html tags -->
                <![CDATA[ <tr>
                            <td id="name">]]>
                <xsl:value-of select="name"/>
                <![CDATA[   </td> ]]>
                <!-- check if local name exists or not -->
                <xsl:choose>
                    <xsl:when test="localname">
                        <![CDATA[   <td id="name"> ]]> <xsl:value-of select="localname"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <![CDATA[   <td> ]]> -
                    </xsl:otherwise>
                </xsl:choose>
                <![CDATA[   </td> ]]>

                <!-- check if population of 2011 exists or not -->
                <xsl:choose>
                    <xsl:when test=".//population[@year=2011]">
                        <![CDATA[   <td id="number"> ]]> <xsl:value-of select=".//population[@year=2011]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <![CDATA[   <td> ]]> -
                    </xsl:otherwise>
                </xsl:choose>
                <![CDATA[   </td>
                            <td id="number"> ]]>
                <xsl:value-of select="count(.//city)"/>
                <![CDATA[   </td>
                            </tr> ]]>
            </xsl:when>

            <!-- If province exists -->
            <xsl:otherwise>
                <xsl:for-each select=".//province">
                <xsl:sort select="name"/>
                    <![CDATA[ <tr>
                            <td id="name">]]>
                    <xsl:value-of select="name"/>
                    <![CDATA[   </td> ]]>
                <!-- check if local name exists or not -->
                    <xsl:choose>
                        <xsl:when test="localname">
                            <![CDATA[   <td id="name"> ]]> <xsl:value-of select="localname"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <![CDATA[   <td> ]]> -
                        </xsl:otherwise>
                    </xsl:choose>
                    <![CDATA[   </td> ]]>

                    <!-- check if population of 2011 exists or not -->
                    <xsl:choose>
                        <xsl:when test=".//population[@year=2011]">
                            <![CDATA[   <td id="number"> ]]> <xsl:value-of select=".//population[@year=2011]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <![CDATA[   <td> ]]> -
                        </xsl:otherwise>
                    </xsl:choose>
                    <![CDATA[   </td>
                                <td id="number"> ]]>
                    <xsl:value-of select="count(.//city)"/>
                    <![CDATA[   </td>
                                </tr> ]]>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        <![CDATA[   </tbody>
                </table> ]]>
    </xsl:template>

</xsl:stylesheet>
