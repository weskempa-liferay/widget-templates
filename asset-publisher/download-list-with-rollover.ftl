<div id="<@portlet.namespace />doccontainer" class="example-documents">
    <#if entries?has_content>
        <#list entries as entry>
            <div class="doc-item">
            
                <#assign assetRenderer = entry.getAssetRenderer() />
                <#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />
                <#assign viewURL = "" />
                
                <#if assetRenderer.getType()=="document">
                    <#assign viewURL = assetRenderer.getURLDownload(themeDisplay) />
                </#if> 
                
                <p class="title"><span><img src="${assetRenderer.getURLImagePreview(renderRequest)}"/></span> <a target="_blank" href="${viewURL}">
                
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

<script>

    AUI().ready('ACG','event', 'node', function(A) {

        var roll = A.all("#<@portlet.namespace />doccontainer .doc-item a");
        roll.on('mousemove',function(ev){
       
            var popX = ev._event.layerX +6;
            var popY = ev._event.layerY +6;
            ev.currentTarget._node.parentNode.firstChild.setAttribute("style","left:"+popX+"px;top:"+popY+"px");
        });
        roll.on('mouseover',function(ev){
            ev._currentTarget.parentElement.parentElement.className = "doc-item hover";
        });
        roll.on('mouseout',function(ev){
            ev._currentTarget.parentElement.parentElement.className = "doc-item";
        });
    });

</script>


<style>
    .example-documents .doc-item{   
        border-bottom: 1px solid #ddd;
        position:relative;
    }
    .example-documents .doc-item p{
        margin: 3px 15px 4px;
        font-size: .9em;    
    }
    .example-documents .doc-item span{
        display:none;
        position: absolute;
        z-index:999;
        width: 150px;
        left: -40px;
        background-color: white;
        z-index: 25;
        border: 1px #aaa solid;
    }
    .example-documents .doc-item.hover span{
        display:block;
    }
    .example-documents .doc-item span img{
        width: 100%;
    }
    .example-documents .doc-item p a:hover{ 
        color: #009ae5;
    }
    
    .portlet-asset-publisher .lfr-pagination .lfr-pagination-delta-selector{
        display:none;
    }
    .portlet-asset-publisher .taglib-page-iterator .search-results {
        position: absolute;
        z-index:999;
        top: 40px;
        left: -9px;
    }
    .portlet-asset-publisher .taglib-page-iterator {
        position: relative;
        overflow: visible;
        padding-top: 10px;
    }
    .portlet-barebone .portlet-content .portlet-title-text {
        display:inline;
        font-size: 20px;
        margin-bottom: 0;
        margin-top: 10px;
    }
    #<@portlet.namespace />doccontainer{
        padding-bottom: 80px;
    }
    

</style>