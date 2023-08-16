<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei xs"
    version="2.0">

    <xsl:output method="html" indent="yes" encoding="utf-8"/>
    <xsl:strip-space elements="*"/>

    <!-- STRUCTURATION DE XML À HTML -->
    <xsl:template match="tei:TEI">
        <!-- variable pour les métadonnées -->
        <xsl:variable name="meta" select="tei:teiHeader"/>
        <!-- variable pour les données textuelles -->
        <xsl:variable name="texte" select="tei:text/tei:front|tei:text/tei:body"/>
        <!-- variable pour les données de l'apparat critique -->
        <xsl:variable name="apparat" select="tei:text/tei:back"/>

        <!-- PAGES DE LECTURE -->
        <xsl:copy>
            <xsl:for-each-group select="$texte/descendant::node()" group-starting-with="tei:pb[@n]">
                <xsl:result-document href="page-{position()}.html">
                    <html>
                        <head>
                            <link rel="stylesheet" type="text/css" href="../css/style.css"/>
                            <link rel="icon" href="../images/graphique.png" type="image/png"/>
                            <title><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title/node()"/></title>
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                            <script src="../javascript/script.js" type="text/javascript"></script>
                        </head>
                        <body>
                            <!-- entête -->
                            <header class="lecture">
                                <nav>
                                    <a href="index.html">Le projet</a>
                                    <div>
                                        <img id="menu" src="../images/menu.png"/>
                                        <a href="liminaire.html">Liminaire</a>
                                        <a href="page-1.html">Lecture</a>
                                        <a href="glossaire.html">Glossaire</a>
                                    </div>
                                </nav>
                            </header>
                            <!-- zone principale -->
                            <main>
                                <!-- section de contrôle -->
                                <section>
                                    <div>
                                        <!-- icones pour tourner les pages selon la position : si c'est la première page, seulement l'icone de droite est disponible; la dernière, l'icone de gauche -->
                                        <xsl:choose>
                                            <xsl:when test="position()=1"><a href="page-1.html"><img src="../images/retour-min.png"></img></a><a href="page-1.html"><img src="../images/retour.png"></img></a><a href="page-{position()+1}.html"><img src="../images/aller.png"></img></a><a href="page-11.html"><img src="../images/aller-max.png"></img></a></xsl:when>
                                            <xsl:when test="position()=last()"><a href="page-1.html"><img src="../images/retour-min.png"></img></a><a href="page-{position()-1}.html"><img src="../images/retour.png"></img></a><a href="page-11.html"><img src="../images/aller.png"></img></a><a href="page-11.html"><img src="../images/aller-max.png"></img></a></xsl:when>
                                            <xsl:otherwise><a href="page-1.html"><img src="../images/retour-min.png"></img></a><a href="page-{position()-1}.html"><img src="../images/retour.png"></img></a><a href="page-{position()+1}.html"><img src="../images/aller.png"></img></a><a href="page-11.html"><img src="../images/aller-max.png"></img></a></xsl:otherwise>
                                        </xsl:choose>
                                        <img src="../images/configuration.png"/><img src="../images/analytique.png"/><img src="../images/info.png"/>
                                        <p>Les menus déroulants dans le paneau de contrôle latéral offre des modalités de lecture, dont les options analytiques qui présentent du contenu supplémentaire lorsqu'elles sont survolées par le curseur.<br/><br/>Chaque lunette cliquable permet de voir une photographie de la section correspondante dans le texte original.</p>
                                    </div>
                                    <div>
                                        <div>
                                            <p><b>Configuration diplomatique</b></p>
                                            <label for="btn1">
                                                <input type="radio" name="opt1" id="btn1"/>
                                                <span class="bouton"></span>
                                            </label>
                                            &#xA0;&#xA0;
                                            <label for="btn2">
                                                <input type="radio" name="opt1" id="btn2"/>
                                                <span class="bouton"></span>
                                                &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;régularisations
                                            </label>
                                            <br/><br/>
                                            <label for="btn3">
                                                <input type="radio" name="opt2" id="btn3"/>
                                                <span class="bouton"></span>
                                            </label>
                                            &#xA0;&#xA0;
                                            <label for="btn4"> 
                                                <input type="radio" name="opt2" id="btn4"/> 
                                                <span class="bouton"></span>
                                                &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;corrections 
                                            </label>
                                            <br/><br/>
                                            <label for="btn5">
                                                <input type="radio" name="opt3" id="btn5"/>
                                                <span class="bouton"></span>
                                            </label>
                                            &#xA0;&#xA0;
                                            <label for="btn6">
                                                <input type="radio" name="opt3" id="btn6"/>
                                                <span class="bouton"></span>
                                                &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;désabréviations 
                                            </label>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <p><b>Options analytiques</b></p>
                                            <!--<input type="range" name="opt4" id="btn7" min="0" max="1" value="0"/>
                                            <label for="btn7"> apparats critiques </label>-->
                                            <label for="btn7">
                                                <input type="radio" name="opt4" id="btn7"/>
                                                <span class="bouton"></span>
                                            </label>
                                            &#xA0;&#xA0;
                                            <label for="btn8">
                                                <input type="radio" name="opt4" id="btn8"/>
                                                <span class="bouton"></span>
                                                &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;apparats critiques 
                                            </label>
                                            <br/><br/>
                                            <!--<input type="range" name="opt5" id="btn8" min="0" max="1" value="0"/>
                                            <label for="btn8"> formes augmentées </label>-->
                                            <label for="btn9">
                                                <input type="radio" name="opt5" id="btn9"/>
                                                <span class="bouton"></span>
                                            </label>
                                            &#xA0;&#xA0;
                                            <label for="btn10">
                                                <input type="radio" name="opt5" id="btn10"/>
                                                <span class="bouton"></span>
                                                &#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;formes augmentées 
                                            </label>
                                        </div>
                                    </div>
                                </section>
                                <!-- article de la page (de type lecture) -->
                                <article class="lecture">
                                    <!-- numéro de la page -->
                                    <p id="position"><xsl:value-of select="position()"/>/11</p>
                                    <!-- contenu de la page -->
                                    <xsl:apply-templates select="$texte/node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
                                </article>
                            </main>
                            <!-- pied de page -->
                            <footer>
                                <p>Diffusé par la <xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:distributor/node()"/>,<br/><xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:authority/node()"/></p>
                                <img src="../images/logo-1.png" width="250px"/>&#xA0;&#xA0;&#xA0;<img src="../images/logo-2.png" width="200px"/>
                                <p><xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:availability/node()"/><br/>&#169; <xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:date/node()"/></p>
                            </footer>
                        </body>
                    </html>
                </xsl:result-document>
            </xsl:for-each-group>
        </xsl:copy>

        <!-- PAGE D'ACCUEIL -->
        <xsl:copy>
            <xsl:result-document href="index.html">
                <html>
                    <head>
                        <link rel="stylesheet" type="text/css" href="../css/style.css"/>
                        <link rel="icon" href="../images/graphique.png" type="image/png"/>
                        <title><xsl:value-of select="$meta/tei:fileDesc/tei:titleStmt/tei:title/node()"/></title>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                        <script src="../javascript/script.js" type="text/javascript"></script>
                    </head>
                    <body>
                        <!-- entête -->
                        <header>
                            <nav>
                                <a href="index.html">Le projet</a>
                                <div>
                                    <img id="menu" src="../images/menu.png"/>
                                    <a href="liminaire.html">Liminaire</a>
                                    <a href="page-1.html">Lecture</a>
                                    <a href="glossaire.html">Glossaire</a>
                                </div>
                            </nav>
                            <h1><span class="surligner">AutoScript</span>.<br/>Un traitement <span class="surligner">automatique</span> de <span class="surligner">textes</span> anciens.</h1>
                        </header>
                        <!-- zone principale -->
                        <main>
                            <!-- article de la page -->
                            <article>
                            <p>Est notamment disponible en téléchargement un document contenant les données XML <a href="https://gitlab.com/pchartrand/autoscript/-/raw/master/xml/manuscrit.xml?inline=false" download="manuscrit"><img src="../images/fichier.png" width="40px"/></a> du projet.</p>
                            <p>Le répertoire GitLab du projet est également accessible <a id="ref" href="https://gitlab.com/pchartrand/autoscript">ici</a>.</p>
                            <br/>
                            <h2>À propos</h2>
                            <p><xsl:value-of select="$meta/tei:encodingDesc/tei:projectDesc/tei:p/node()"/></p>
                            <p>Réalisation par<br/><xsl:value-of select="$meta/tei:fileDesc/tei:titleStmt/tei:principal/tei:name/node()"/></p>
                            <p><xsl:value-of select="$meta/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp/node()"/><br/><xsl:value-of select="$meta/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name/node()"/></p>
                            </article>
                        </main>
                        <!-- pied de page -->
                        <footer>
                            <p>Diffusé par la <xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:distributor/node()"/>,<br/><xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:authority/node()"/></p>
                            <img src="../images/logo-1.png" width="250px"/>&#xA0;&#xA0;&#xA0;<img src="../images/logo-2.png" width="200px"/>
                            <p><xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:availability/node()"/><br/>&#169; <xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:date/node()"/></p>
                        </footer>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:copy>

        <!-- PAGE DU LIMINAIRE -->
        <xsl:copy>
            <xsl:result-document href="liminaire.html">
                <html>
                    <head>
                        <link rel="stylesheet" type="text/css" href="../css/style.css"/>
                        <link rel="icon" href="../images/graphique.png" type="image/png"/>
                        <title><xsl:value-of select="$meta/tei:fileDesc/tei:titleStmt/tei:title/node()"/></title>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                        <script src="../javascript/script.js" type="text/javascript"></script>
                    </head>
                    <body>
                        <!-- entête -->
                        <header class="lecture">
                            <nav>
                                <a href="index.html">Le projet</a>
                                <div>
                                    <img id="menu" src="../images/menu.png"/>
                                    <a href="liminaire.html">Liminaire</a>
                                    <a href="page-1.html">Lecture</a>
                                    <a href="glossaire.html">Glossaire</a>
                                </div>
                            </nav>
                        </header>
                        <!-- zone principale -->
                        <main>
                            <!-- article de la page -->
                            <article>
                                <!-- contenu de la page -->
                                <h2>La démarche philologique</h2>
                                <!-- paragraphe sur la correction -->
                                <p><xsl:value-of select="$meta/tei:encodingDesc/tei:editorialDecl/tei:correction/tei:p/node()"/></p>
                                <!-- paragraphe sur la normalisation -->
                                <p><xsl:value-of select="$meta/tei:encodingDesc/tei:editorialDecl/tei:normalization/tei:p/text()"/></p>
                                <ul class="info">
                                    <!-- éléments de la normalisation sous forme de liste -->
                                    <xsl:for-each select="$meta/tei:encodingDesc/tei:editorialDecl/tei:normalization/tei:p/tei:list/tei:item">
                                        <li><xsl:value-of select="node()"/></li>
                                    </xsl:for-each>
                                </ul>
                                <!-- paragraphe sur la segmentation -->
                                <p><xsl:value-of select="$meta/tei:encodingDesc/tei:editorialDecl/tei:segmentation/tei:p/node()"/></p>
                                <!-- paragraphe sur la ponctuation -->
                                <p><xsl:value-of select="$meta/tei:encodingDesc/tei:editorialDecl/tei:punctuation/tei:p/node()"/></p>
                                <!-- paragraphe sur la citation -->
                                <p><xsl:value-of select="$meta/tei:encodingDesc/tei:editorialDecl/tei:quotation/tei:p/node()"/></p>
                                <!-- paragraphe sur la structuration -->
                                <p><xsl:value-of select="$meta/tei:encodingDesc/tei:editorialDecl/tei:hyphenation/tei:p/node()"/></p>
                                <!-- paragraphe sur l'interprétation -->
                                <p><xsl:value-of select="$meta/tei:encodingDesc/tei:editorialDecl/tei:interpretation/tei:p/node()"/></p>
                                <br/>
                                <h2>Les témoins critiques</h2>
                                <!-- paragraphes sur chaque témoin -->
                                <xsl:for-each select="$meta/tei:fileDesc/tei:sourceDesc/tei:listWit/tei:witness">
                                    <p><xsl:value-of select="node()"/></p>
                                </xsl:for-each>
                                <br/>
                                <h2>Référence du texte de base</h2>
                                <!-- paragraphe ayant des valeurs bibliographiques qui font référence au texte de base -->
                                <p>
                                    <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:p/tei:biblStruct/tei:monogr/tei:author/node()"/>.
                                    « <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:p/tei:biblStruct/tei:monogr/tei:title[@type='text']/node()"/> ». Dans
                                    <i><xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:p/tei:biblStruct/tei:monogr/tei:title[@type='collection']/node()"/></i>,
                                    <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:p/tei:biblStruct/tei:monogr/tei:imprint/tei:respStmt/tei:resp/node()"/> <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:p/tei:biblStruct/tei:monogr/tei:imprint/tei:respStmt/tei:name/node()"/>,
                                    <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:p/tei:biblStruct/tei:monogr/tei:extent/tei:num/node()"/>. <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:p/tei:biblStruct/tei:monogr/tei:imprint/tei:pubPlace/node()"/>,
                                    <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:p/tei:biblStruct/tei:monogr/tei:imprint/tei:date/node()"/>.
                                </p>
                                <ul class="info">
                                    <li>
                                        Conservé à la <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:institution/node()"/> à
                                        <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement/node()"/> dans le répertoire
                                        <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository/node()"/>, notice <xsl:value-of select="$meta/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/node()"/>.
                                    </li>
                                </ul>
                                <br/>
                                <h2>Le protocole</h2>
                                <p>AutoScript est un projet de recherche-création en édition numérique sous les formats d’encodage XML/TEI, XSLT et JavaScript à partir d’une pièce théâtrale datant de 1609, et grâce à quatre autres versions de la performance parues entre 1611 et 1618. Le protocole de développement suit notamment trois étapes s’enchainant automatiquement l’une après l’autre : 1) la validation du document XML de base, à savoir des données brutes des textes anciens à l’étude, via un schéma conforme aux recommandations de la TEI; 2) la transformation des données par une feuille XSLT qui intègre une structure de balisage sémantique adaptée aux langages de programmation Internet; 3 ) le traitement des données textuelles pour le Web par des fonctions JavaScript qui permettent une manipulation dynamique des documents HTML.</p>
                                <div class="media"><img src="../images/media.png" alt="https://www.espacecourbe.com/fr/creation/expertise/dev-xml-xslt/"/></div>
                                <p>Pour y arriver, c'est au moyen du logiciel périphérique Saxon que s'effectue l'exploitation des données XML : à partir du dossier contenant le fichier <i>saxon.jar</i>, les pages HTML sont toutes automatiquement générées via une seule commande Java. La syntaxe XML du projet reprend notamment des balises sémantiques reliées au domaine théâtral afin de bien représenter, entre autres, les didascalies et chacune des performances oratoires. Le code a aussi été réalisé en prenant compte la nature diplomatique de l’édition, c’est-à-dire que le balisage reprend tous les témoins de chaque variante textuelle via une seule bibliographie critique dans le document. La structuration des données peut, ensuite, prendre forme grâce à une feuille XSLT qui respecte un schéma préalablement programmé. Par exemple, dans le cas où la lecture a été conçue en plusieurs pages, notamment pour respecter la forme du livre original, la structure veille alors à diviser automatiquement le document XML où les sauts de page sont indiqués par une balise spécifique. La feuille XSLT permet aussi de transformer les données, issues d’une interprétation et d’une analyse du texte, par une modélisation du balisage au format HTML. C’est-à-dire que chaque élément XML est repris tour à tour pour être converti sous une forme valide pour le Web. Enfin, le texte numérique est enrichi lors de sa publication sur le Web non seulement par une stylisation CSS de l’interface, mais aussi par une programmation JavaScript de plusieurs fonctions. C’est ici que repose effectivement tout l’intérêt d’une édition critique sur le Web, car l’expérience de lecture est considérablement augmentée au point où chaque lecteur peut configurer le texte de différentes façons. Un système de boutons peut, en effet, offrir plusieurs options d’affichage dynamique,et ce, avec quelques lignes de code Jquery.</p>
                            </article>
                        </main>
                        <!-- pied de page -->
                        <footer>
                            <p>Diffusé par la <xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:distributor/node()"/>,<br/><xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:authority/node()"/></p>
                            <img src="../images/logo-1.png" width="250px"/>&#xA0;&#xA0;&#xA0;<img src="../images/logo-2.png" width="200px"/>
                            <p><xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:availability/node()"/><br/>&#169; <xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:date/node()"/></p>
                        </footer>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:copy>

        <!-- PAGE DU GLOSSAIRE -->
        <xsl:copy>
            <xsl:result-document href="glossaire.html">
                <html>
                    <head>
                        <link rel="stylesheet" type="text/css" href="../css/style.css"/>
                        <link rel="icon" href="../images/graphique.png" type="image/png"/>
                        <title><xsl:value-of select="$meta/tei:fileDesc/tei:titleStmt/tei:title/node()"/></title>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                        <script src="../javascript/script.js" type="text/javascript"></script>
                    </head>
                    <body>
                        <!-- entête -->
                        <header class="lecture">
                            <nav>
                                <a href="index.html">Le projet</a>
                                <div>
                                    <img id="menu" src="../images/menu.png"/>
                                    <a href="liminaire.html">Liminaire</a>
                                    <a href="page-1.html">Lecture</a>
                                    <a href="glossaire.html">Glossaire</a>
                                </div>
                            </nav>
                        </header> 
                        <!-- zone principale -->
                        <main>
                            <!-- article de la page -->
                            <article>
                                 <h2><xsl:value-of select="$apparat/tei:div[@type='glossary']/tei:head/node()"/></h2>
                                 <h3><xsl:value-of select="$apparat/tei:div[@type='glossary']/tei:list/tei:head/node()"/></h3>
                                 <table>
                                     <tr>
                                         <th><xsl:value-of select="$apparat/tei:div[@type='glossary']/tei:list/tei:headLabel/node()"/></th>
                                         <th colspan="2"><xsl:value-of select="$apparat/tei:div[@type='glossary']/tei:list/tei:headItem/node()"/></th>
                                     </tr>
                                     <xsl:for-each select="$apparat/tei:div[@type='glossary']/tei:list/tei:label">
                                         <tr>
                                             <xsl:element name="td">
                                                 <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                                 <xsl:value-of select="node()"/>
                                             </xsl:element>
                                             <xsl:element name="td">
                                                 <xsl:value-of select="following-sibling::node()[1]"/>
                                             </xsl:element>
                                             <xsl:element name="td">                                         
                                                 <xsl:element name="button">
                                                     <xsl:attribute name="class">revenir</xsl:attribute>
                                                     <xsl:text>&#8617;</xsl:text>
                                                 </xsl:element>
                                             </xsl:element>
                                         </tr>
                                     </xsl:for-each>
                                 </table>
                            </article>
                        </main>
                        <!-- pied de page -->
                        <footer>
                            <p>Diffusé par la <xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:distributor/node()"/>,<br/><xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:authority/node()"/></p>
                            <img src="../images/logo-1.png" width="250px"/>&#xA0;&#xA0;&#xA0;<img src="../images/logo-2.png" width="200px"/>
                            <p><xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:availability/node()"/><br/>&#169; <xsl:value-of select="$meta/tei:fileDesc/tei:publicationStmt/tei:date/node()"/></p>
                        </footer>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:copy>
    </xsl:template>

    <!-- BALISAGE EN HTML -->
    <!-- sp = div -->
    <xsl:template match="tei:sp" mode="copy-no-namespace">
        <xsl:element name="div">
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>

    <!-- titlePart = h1 -->
    <xsl:template match="tei:titlePart" mode="copy-no-namespace">
        <xsl:element name="h2">
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>

    <!-- speaker = h2 -->
    <xsl:template match="tei:speaker" mode="copy-no-namespace">
        <xsl:element name="h3">
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>

    <!-- lb = br -->
    <xsl:template match="tei:lb" mode="copy-no-namespace">
        <xsl:element name="br">
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>

    <!-- p|stage = p -->
    <xsl:template match="tei:p|tei:stage" mode="copy-no-namespace">
        <xsl:element name="p">
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    <!-- lg = ol -->
    <xsl:template match="tei:lg" mode="copy-no-namespace">
        <xsl:element name="ol">
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>

    <!-- l = li -->
    <xsl:template match="tei:l" mode="copy-no-namespace">
        <xsl:element name="li">
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- graphic = img -->
    <xsl:template match="tei:graphic" mode="copy-no-namespace">
        <xsl:element name="img">
            <xsl:attribute name="class">photo</xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="@url"/></xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- ref = a -->
    <xsl:template match="tei:ref" mode="copy-no-namespace">
        <xsl:element name="a">
            <xsl:attribute name="class">lien</xsl:attribute>
            <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>

    <!-- choice|view = \ -->
    <xsl:template match="tei:choice|tei:view" mode="copy-no-namespace">
        <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
    </xsl:template>


    <!-- BALISES <SPAN></SPAN> POUR CODE DYNAMIQUE .JS -->    
    <!-- span pour l'explication de segments du texte -->
    <xsl:template match="tei:seg" mode="copy-no-namespace">
        <xsl:for-each select="tei:term">
            <xsl:element name="span">
                <xsl:attribute name="class">infobulle-1</xsl:attribute>
                <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
            </xsl:element>
        </xsl:for-each>
        <xsl:for-each select="tei:desc">
            <xsl:element name="span">
                <xsl:attribute name="class">infobulle-texte</xsl:attribute>
                <xsl:element name="img">
                    <xsl:attribute name="src"><xsl:value-of select="@synch"/></xsl:attribute>
                    <xsl:attribute name="width">250px</xsl:attribute>
                    <xsl:attribute name="style">max-height:250px;</xsl:attribute>
                </xsl:element>
                <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <!-- span pour l'indication des témoins -->
    <xsl:template match="tei:app" mode="copy-no-namespace">
        <xsl:for-each select="tei:rdg">
            <xsl:sort select="string-length(@wit)" order="descending" data-type="number"/>
            <xsl:if test="position()=1">
                <xsl:element name="span">
                    <xsl:attribute name="class">infobulle-2</xsl:attribute>
                    <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="position()>1">
                <xsl:element name="span">
                    <xsl:attribute name="class">infobulle-critique</xsl:attribute>
                    <xsl:value-of select="replace(@wit, '#', '')"/> : <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <!-- span pour les éléments originaux -->
    <xsl:template match="tei:orig" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les éléments réguliers -->
    <xsl:template match="tei:reg" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les éléments fautifs -->
    <xsl:template match="tei:sic" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="class">sic</xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les éléments corrigés -->
    <xsl:template match="tei:corr" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="class">corr</xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les éléments abrégés -->
    <xsl:template match="tei:abbr" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les éléments étendus -->
    <xsl:template match="tei:expan" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les termes -->
    <xsl:template match="tei:note" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="class">note</xsl:attribute>
            <xsl:attribute name="style">float:<xsl:value-of select="@place"/>;margin-<xsl:copy-of select="@place"/>:
                <xsl:if test="@place = 'right'">150px;</xsl:if>
                <xsl:if test="@place = 'left'">-150px;</xsl:if>
            </xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les rendus -->
    <xsl:template match="tei:hi" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="style">font-style:<xsl:value-of select="@rend"/>;</xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les caractères spéciaux -->
    <xsl:template match="tei:c" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:if test="@rend = 'initial'">
                <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="@rend = 'taille'">
                <xsl:attribute name="class"><xsl:value-of select="@rend"/></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les éléments de citation -->
    <xsl:template match="tei:q" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="class">citation</xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les termes aux glossaires -->
    <xsl:template match="tei:gloss" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="class">glose</xsl:attribute>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
            <xsl:element name="a">
                <xsl:attribute name="href">glossaire.html#<xsl:value-of select="@corresp"/></xsl:attribute>
                <xsl:text>#</xsl:text><xsl:value-of select="substring-after(@corresp, '-')"/>                
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- span pour les figures par section -->
    <xsl:template match="tei:figure" mode="copy-no-namespace">
        <xsl:element name="span">
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:attribute name="class">strophe</xsl:attribute>
            <xsl:attribute name="onclick">fonctionPhoto(this.id)</xsl:attribute>
            <xsl:element name="img">
                <xsl:choose>
                    <xsl:when test="position()=last()">
                        <xsl:attribute name="src">../images/lire.png</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="src">../images/voir.png</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:attribute name="width">20px</xsl:attribute>
            </xsl:element>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:element>
    </xsl:template>


    <!-- STRUCTURATION PAR PAGE DU DOCUMENT -->
    <!-- structure en chaque page -->
    <xsl:template match="tei:pb[@n]" mode="copy-no-namespace"/>
    
    <!-- structure générale -->
    <xsl:template match="node()" mode="copy-no-namespace">
        <xsl:copy>
            <xsl:apply-templates select="node()[descendant-or-self::node() intersect current-group()]" mode="copy-no-namespace"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
