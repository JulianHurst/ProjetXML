<xsl:stylesheet

 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

  version="1.0">

   <xsl:output method="xml" indent="yes" />
   <xsl:strip-space elements="*"/>

    <xsl:template match="/">
		<Cuisines>
     <ListeRecette>

      <xsl:for-each select="//objet[@type = 'recette']">

       <Recette ID="{@id}">

	 		<Titre><xsl:value-of select="info[@nom='nom']/@value"/></Titre>
      <xsl:if test="info[@nom='résumé']!=''">
	 		    <Resume><xsl:copy-of select="info[@nom='résumé']/*"/></Resume>
      </xsl:if>
	 		<Photo><xsl:value-of select="info[@nom='photo']/@value"/></Photo>
	 		<Date><xsl:value-of select="info[@nom='date_publication']/@value"/></Date>
	 		<Difficulte><xsl:value-of select="info[@nom='difficulté']/@value"/></Difficulte>
	 		<ListeIngredients>
	 			<xsl:for-each select="info[@nom = 'ingrédient']">
          <xsl:if test="translate(@value,'1234567890','')!=@value">
	 				<Ingredients IDIngredientRef="{@value}">
	 				<Quantite><xsl:value-of select="@quantite"/></Quantite>
	 				</Ingredients>
          </xsl:if>
	 			</xsl:for-each>

	 		</ListeIngredients>
	 		<NbPersonnes><xsl:value-of select="info[@nom='nbre_personnes']/@value"/></NbPersonnes>
      <TpsPreparation><xsl:value-of select="info[@nom='Préparation']/@value"/></TpsPreparation>
			<TpsCuisson><xsl:value-of select="info[@nom='Cuisson']/@value"/></TpsCuisson>
        <TpsRepos><xsl:value-of select="info[@nom='Repos']/@value"/></TpsRepos>
        <SousCategorie scatref="{info[@nom='sous-catégorie']/@value}"/>
	  		<Preparation><xsl:copy-of select="info[@nom='Préparation']/*"/></Preparation>

       </Recette>

      </xsl:for-each>

     </ListeRecette>
     <ListeAuteur>
     	<xsl:for-each select="//objet[@type = 'auteur']">
     		<Auteur IDAuteur="{@id}">
     			<Pseudo><xsl:value-of select="info[@nom='idext']/@value"/></Pseudo>
     			<Nom>
     			<xsl:if test="info[@nom='prenom']">
     				<xsl:value-of select="info[@nom='prenom']/@value"/>
     			</xsl:if>
     			<xsl:if test="info[@nom='nom']">
     				<xsl:if test="info[@nom='prenom']">
     					<xsl:text> </xsl:text>
     				</xsl:if>
     				<xsl:value-of select="info[@nom='nom']/@value"/>
     			</xsl:if>
     			</Nom>
     			<Pays><xsl:value-of select="info[@nom='pays']/@value"/></Pays>
     			<Sexe><xsl:value-of select="info[@nom='sexe']/@value"/></Sexe>
     			<xsl:if test="info[@nom='biographie']">
     				<Bio><xsl:value-of select="info[@nom='biographie']/@value"/></Bio>
     			</xsl:if>
     			<xsl:for-each select="info[@nom='recette']">
     				<ref-recette ref="{@value}"/>
     			</xsl:for-each>
     		</Auteur>
     	</xsl:for-each>
     </ListeAuteur>
     <Categories>
     <xsl:for-each select="//objet[@type='catégorie']">
     	<Category catid="{@id}">
        <xsl:variable name="catid" select="@id" />
     		<Nom><xsl:value-of select="info[@nom='nom']/@value"/></Nom>
        <xsl:if test="info[@nom='nom-court']">
          <Nom-court><xsl:value-of select="info[@nom='nom-court']/@value"/></Nom-court>
        </xsl:if>
     		<Descriptif><xsl:copy-of select="info[@nom='descriptif']/*"/></Descriptif>
     			<xsl:for-each select="//objet[@type='sous-catégorie']">
     			<xsl:if test="info[@nom='catégorie']/@value=$catid">
     			    <SousCategory scatid="{@id}">
     				       <Nom><xsl:value-of select="info[@nom='nom']/@value"/></Nom>
                   <xsl:if test="info[@nom='nom-court']">
                     <Nom-court><xsl:value-of select="info[@nom='nom-court']/@value"/></Nom-court>
                   </xsl:if>
     				       <Descriptif><xsl:copy-of select="info[@nom='descriptif']/*"/></Descriptif>
              </SousCategory>
          </xsl:if>
        </xsl:for-each>
      </Category>
    </xsl:for-each>
  </Categories>
  <ListeIngredient>
    <xsl:for-each select="//objet[@type = 'ingredient']">
      <Ingredient IDIngredient="{@id}">
        <Nom><xsl:value-of select="info[@nom='nom']/@value"/></Nom>
        <ApportEn><xsl:value-of select="info[@nom='Apport énergétique']/@value"/></ApportEn>
        <ApportNut><xsl:value-of select="info[@nom='Apport nutritif']/@value"/></ApportNut>
        <Descriptif><xsl:copy-of select="info[@nom='descriptif']/*"/></Descriptif>
      </Ingredient>
    </xsl:for-each>
  </ListeIngredient>
     </Cuisines>
    </xsl:template>
</xsl:stylesheet>
