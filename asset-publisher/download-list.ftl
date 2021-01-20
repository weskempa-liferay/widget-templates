<style>

    .portal-documents .doc-item{	
        border-bottom: 1px solid #ddd;
        position:relative;
    }

    .portal-documents .doc-item p{
    	margin: 3px 15px 4px;
    	font-size: .9em;	
    }

    .portal-documents .doc-item p a:hover{	
    	color: #009ae5;
    }

</style>

<div id="${randomNamespace}container" class="portal-documents">
    <#if entries?has_content>
        <#list entries as entry>
            <div class="doc-item">
            
                <#assign assetRenderer = entry.getAssetRenderer() />
                <#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />
                <#assign viewURL = "" />
                
                <#if assetRenderer.getType()=="document">
                    <#assign viewURL = assetRenderer.getURLDownload(themeDisplay)?replace("download=true","") />
                </#if> 
                
                <p class="title"><a target="_blank" href="${viewURL}">
                
                <#if entryTitle!="">
                    ${entryTitle}
                <#else>
                    ${entry.getDescriptionCurrentValue()}
                </#if>
                
                </a></p>
                
            </div>
        </#list>
        
    <#else>
        
        <div class="doc-item" style="text-align:center">
            <p class="title">No results found for this search.</p>
        </div>
    </#if>
</div>