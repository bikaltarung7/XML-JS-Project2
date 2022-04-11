<?xml version="1.0" encoding="UTF-8" ?>
<!-- /*********************************************************************************
* ITC5202 – Project
* I declare that this assignment is my own work in accordance with Humber Academic Policy.
* No part of this assignment has been copied manually or electronically from any other source
* (including web sites) or distributed to other students.
*
* Group member Name: Bikal Thapa Magar| Merin Joe Chandy 
    Student IDs: N01414695 | N01482121 
    Date: 2022/04/10
*
********************************************************************************/ -->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
            }
            </style>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>Country Name</th>
                            <th>Capital</th>
                            <th>Unemployment</th>
                            <th>Total GDP</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="//country">
                            <xsl:sort select="name"/>
                            <tr>
                                <td>
                                    <xsl:value-of select="name"/>
                                </td>
                                <xsl:for-each select=".//city">
                                        <xsl:if test="ancestor::country/@capital = @id">
                                            <td>
                                                <xsl:value-of select="name[1]"/>
                                            </td>
                                        </xsl:if>
                                </xsl:for-each>
                                <td>
                                    <xsl:value-of select="unemployment"/>
                                </td>
                                <td>
                                    <xsl:value-of select="gdp_total"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>
