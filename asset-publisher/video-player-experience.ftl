<#assign count = 0 />
    
<#if entries?has_content>
    <#list entries as curEntry>
    
        <#if count == 0 >
            <#assign count = count + 1 />
            
            <#assign assetRenderer = entry.getAssetRenderer() />
            <#assign viewURL = "" />
            
            <#if assetRenderer.getType()=="document">
                <#assign viewURL =  assetRenderer.getURLDownload(themeDisplay) />
            </#if>
            
            <video width="100%" playsinline loop autoplay muted looppreload="auto" >
               <source src="${viewURL}" type="video/mp4">
               Your browser does not support the video tag.
            </video>
            
            <#continue>
        </#if>
        
        <#assign assetRenderer = curEntry.getAssetRenderer() />
        <#assign viewURL = "" />
        
        <#if assetRenderer.getType()=="document">
            <#assign viewURL =  assetRenderer.getURLDownload(themeDisplay) />
        <#else>
            <#continue>
        </#if>
        
        <#if count % 2 = 1>
            <div class="row align-items-lg-start align-items-sm-start align-items-start align-items-md-start flex-lg-row flex-sm-row flex-row flex-md-row" style="padding:0;">
        </#if>
        
        	<div class="col col-lg-6 col-xs-12 col-md-6" style="padding:0;margin-top: -6px;">
                <video width="100%" playsinline loop autoplay muted looppreload="auto" >
                   <source src="${viewURL}" type="video/mp4">
                   Your browser does not support the video tag.
                </video>
        	</div>
        
        <#if count % 2 = 0>
            </div>
        </#if>
        
        <#assign count = count + 1 />
        
    </#list>
</#if>

<style>
    
    #content .portlet-boundary_com_liferay_asset_publisher_web_portlet_AssetPublisherPortlet_ .portlet-content{
    	padding:0;
    }
    
</style>