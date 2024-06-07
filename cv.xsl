<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="XSLT-compat" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/cv">
        <html>
            <head>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
                <link rel="stylesheet" href="cv.css" type="text/css"/>
                <title>Resume - <xsl:value-of select="entete/prenom"/> <xsl:value-of select="entete/nom"/></title>
            </head>
            <body>
                <div class="resume">
                    <div class="left-bar">
                        <div class="profile-section">
                            <img src="Images/berradi.cv.jpeg" alt="Profile Image"/>
                        </div>
                        <div class="contact-info">
                            <p><i class="fa fa-birthday-cake"></i><strong>Date De Naissance:</strong> <xsl:value-of select="entete/dateDeNaisssance"/></p>
                            <p><i class="fa fa-flag"></i><strong>Nationalite:</strong> <xsl:value-of select="entete/nationalite"/></p>
                            <p><i class="fa fa-envelope"></i><strong>Email:</strong> <xsl:value-of select="entete/mail"/></p>
                            <p><i class="fa fa-phone"></i><strong>Mobile:</strong> <xsl:value-of select="entete/telephone"/></p>
                            <p><i class="fa-brands fa-linkedin"></i><strong>Linkedin:</strong> <xsl:value-of select="concat(' ',entete/linkedin)"/></p>
                            
                        </div> <br></br>
                        
                        <div class="skills">
                            <center><h2 class="section2">Compétences</h2></center>
                            <xsl:for-each select="competences/competence">
                                <p>
                                    <i>
                                        <xsl:choose>
                                            <xsl:when test="contains(titre, 'Techniques')">
                                                <xsl:attribute name="class">fa fa-tools</xsl:attribute>
                                            </xsl:when>
                                            <xsl:when test="contains(titre, 'données')">
                                                <xsl:attribute name="class">fa fa-database</xsl:attribute>
                                            </xsl:when>
                                            <xsl:when test="contains(titre, 'Managériales')">
                                                <xsl:attribute name="class">fa fa-users</xsl:attribute>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:attribute name="class">fa fa-star</xsl:attribute>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </i>
                                    <strong><xsl:value-of select="titre"/></strong>
                                </p>
                                <p><xsl:value-of select="description_competence"/></p>
                            </xsl:for-each>
                        </div><br></br>
                        
                        
                        <div class="languages">
                            <center><h2 class="section2"><i class="fa-solid fa-language"></i>Langues</h2></center>
                            <xsl:for-each select="langues/langue">
                                <p>• <strong><xsl:value-of select="intitule"/></strong> <xsl:value-of select="concat(' ',niveau)"/></p>
                            </xsl:for-each>
                        </div> <br></br>
                        <div class="languages"><br></br>
                            <center><h2 class="section2"><i class="fa-solid fa-certificate"></i>Certification</h2></center>
                            <xsl:for-each select="certificates/certificate">
                                <p>• <xsl:value-of select="titre_certificate"/>  <label class="font-style: italic;color=#f4f4f4;">(<xsl:value-of select="date_certificate"/>)</label></p>
                            </xsl:for-each>
                        </div>
                    </div>
                    <div class="right-bar">
                        
                        <h1><xsl:value-of select="concat(entete/prenom,' ',entete/nom)"/></h1>
                        <center><p style="font-size: 18px;font-style: italic;margin-bottom:0 0;max-width: 80%;"><xsl:value-of select="entete/profile"/></p></center>
                        <div class="section education">
                            <h2><i class="fa-solid fa-graduation-cap"></i>Formation</h2><br></br>
                            <xsl:for-each select="Formations/diplome"> 
                               <label class="datestyle"><xsl:value-of select="annee"/></label> <br></br>
                                <div class="details-column"><p> •<xsl:value-of select="intitule"/></p></div>
                            </xsl:for-each>
                        </div>
                        <div class="section experience">
                            <h2><i class="fa-solid fa-briefcase"></i>Expériences professionnelles</h2>
                            <br></br>
                            <xsl:for-each select="stages/stage">
                                <div class="stage-entry">
                                    <div class="date-column">
                                        <label class="datestyle"><xsl:value-of select="date"/></label>
                                    </div>
                                    <div class="details-column">
                                        <div class="text-content">
                                            <img class="logo" src="{organisation}" alt="Company Logo"/>
                                            <div class="job-title">
                                                <h3><xsl:value-of select="titre"/></h3>
                                                <p><xsl:value-of select="description"/></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                        <div class="section experience">
                            <h2><i class="fa-solid fa-code"></i>Projets academiques</h2>
                            <br/>
                            <xsl:for-each select="projets/projet">
                                <div class="stage-entry">
                                    <div class="date-column">
                                        <label class="datestyle"><xsl:value-of select="date_projet"/></label>
                                    </div>
                                    <div class="details-column">
                                        <div class="text-content">
                                            <div class="job-title">
                                                <h3><xsl:value-of select="titre_projet"/></h3>
                                                <p><xsl:value-of select="description_projet"/></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                        
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
