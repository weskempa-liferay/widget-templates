<div class="row">

    <#if entries?has_content>
    	<#list entries as curEntry>

    		<#assign svgIcon = "star" />
    		<#assign assetRenderer = curEntry.getAssetRenderer() />
    		

			<#if assetRenderer.getType()=="journal_article">
               
               <#assign  journalArticle = assetRenderer.getArticle() />

               <#assign svgIcon = retrieveContentParam("Icon",journalArticle)/>
               <#assign link = retrieveContentParam("Link",journalArticle)/>

	        </#if>
    	    
    	    <div class="col col-sm-6">
    	        
    	        <div class="component-card text-break" style="margin-bottom: 20px;">
                	<div class="card m-0 overflow-hidden">
                		<div class="card-body py-4">
                		    
                			<h4 class="clearfix">
                			
                    		    <svg aria-hidden="true" class="lexicon-icon lexicon-icon-add-column">
                                    <use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#${svgIcon}" />
                                </svg>
                			    
                			    ${curEntry.getTitle(locale)}</h2>
                
                			<a class="link" href="${link}">Jump to Application</a>
                		</div>
                	</div>
                </div>
    		
    		</div>
    		
    	</#list>
    </#if>

</div>

<#function retrieveContentParam param article>
	<#assign paramValue = "" />

	<#assign  document = saxReaderUtil.read(journalArticle.getContent()) />
	<#assign  rootElement = document.getRootElement() />

	<#list rootElement.elements() as dynamicElement>
   
		<#if dynamicElement.attribute(0).getValue()=param>
       
			<#list dynamicElement.elements()  as innerElement>
           
				<#if innerElement.attribute(0).getValue()=="en_US">
					<#assign paramValue = innerElement.getText() >
				</#if>
                       
			</#list>
       
		</#if>

	</#list>

	<#return paramValue>
</#function>