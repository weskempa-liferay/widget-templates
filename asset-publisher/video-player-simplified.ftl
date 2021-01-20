<#if entries?has_content>
	<#list entries as curEntry>
		<#assign assetRenderer = entry.getAssetRenderer() />
        <#assign viewURL = "" />
        
        <#if assetRenderer.getType()=="document">
            <#assign viewURL =  assetRenderer.getURLDownload(themeDisplay) />
        </#if>
        
        <video width="320" height="240" playsinline loop autoplay muted looppreload="auto" >
          <source src="${viewURL}" type="video/mp4">
          <!--<source src="${viewURL}" type="video/ogg">-->
          Your browser does not support the video tag.
        </video>
        
	</#list>
</#if>