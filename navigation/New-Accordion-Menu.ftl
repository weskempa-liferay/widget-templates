<!-- New Accordion -->

<script src="https://kit.fontawesome.com/bf8d3d6627.js" crossorigin="anonymous"></script>

<#assign portletDisplay = themeDisplay.getPortletDisplay() />

<style>
	.subnav {border: 1px solid #e7e7e7;}
	.subnav div.level-0,
	.subnav div.level-1,
	.subnav div.level-2,
	.subnav div.level-3{padding:6px 10px;border-bottom: 1px solid #e7e7e7;cursor:pointer;}
	.subnav div span{display:inline-block;vertical-align: top;font-size: 15px;
letter-spacing: -.02em;}
	.subnav div .icon{width:10px;}

	.subnav div.level-0{background-color:#2f65a7;border-bottom: 2px solid #5c86ba;color:white;}
	.subnav div.level-0 .icon{color:#81a2c9;}
	.subnav div.level-1{padding-left: 20px;background-color:#fff;}
	.subnav div.level-1 .lbl{width: 252px;}
	.subnav div.level-2{padding-left: 40px;background-color:#fff;}
	.subnav div.level-2 .lbl{width: 232px;}
	.subnav div.level-3{padding-left: 60px;background-color:#fff;}
	.subnav div.level-3 .lbl{width: 212px;color:#555;font-size:.9em;}

	#content .subnav div.selected{background-color:#5f95c7;}
	.subnav div.selected > .lbl{color:black;font-weight:bold;}
    #content .subnav a {
        color:white;
    }
    #content .subnav .subsection a {
        color:#555;
    }
	.subnav .subsection{display:none;}
	.subnav .subsection.expanded{display:block;}
</style>

<div class="subnav">

    <#if !entries?has_content>
        <#if themeDisplay.isSignedIn()>
            <div class="alert alert-info">
                <@liferay.language key="there-are-no-menu-items-to-display" />
            </div>
        </#if>
    <#else>

        <#list entries as navItem>

			<@createNav navItem=navItem level=0/>
			
        </#list>
	
	</#if>
</div>

<script>
	AUI().use('aui-base','aui-node', function(A){
	    A.all(".subnav div[class^='level']").on("click",function(ev){

	        var target = A.one(ev._currentTarget);
	        var clickid = target.getAttribute("id");
    		
    		A.one("div[data-parent="+clickid+"]").toggleClass("expanded");
    	
    		if(target.hasClass("expanded")){
    		    A.one("#"+clickid+" .icon .fas").removeClass("fa-chevron-right").addClass("fa-chevron-down");
    		}else{
    			A.one("#"+clickid+" .icon .fas").removeClass("fa-chevron-down").addClass("fa-chevron-right");
    		}
    	});
	});
</script>

<#function isBrowsable navItem>
    <#if navItem.hasBrowsableChildren()>
        <#return true>
    </#if>

    <#list navItem.getChildren() as childNavigationItem>
        <#if childNavigationItem.hasBrowsableChildren()>
            <#return true>
        </#if>
    </#list>

    <#return false>
</#function>

<#function isExpanded navItem>
	<#assign expanded = false />

	<#if navItem.isSelected()>
	    <#assign expanded = true />
	<#else>
	    <#if navItem.hasBrowsableChildren()>
	        <#list navItem.getChildren() as child>
	    		<#assign expanded = isExpanded(child) />		
				<#if expanded>
					<#break>
				</#if>
	        </#list>
	    </#if>
	</#if>

	<#return expanded>
</#function>

<#macro createNav navItem level>

	<#assign classNames = "" />
	<#if navItem.isSelected()>
	    <#assign classNames += "selected " />
	</#if>
	<#if isExpanded(navItem)>
	    <#assign classNames += "expanded " />
	</#if>

    <div class="level-${level} ${classNames}" id="nav${navItem.getLayoutId()}">
		<span class="icon">
			<#if isBrowsable(navItem)>
		        <i class="fas fa-chevron-right"></i>
		    </#if>
		</span>
					
		<span class="lbl">
		    <a onclick="location.href='${navItem.getURL()}'">
                ${navItem.getName()}
            </a>    
		</span>
	</div>
	<#if isBrowsable(navItem)>
		<#assign nextLevel = level+1 />
		<div class="subsection ${classNames}" data-parent="nav${navItem.getLayoutId()}">
			
			<#list navItem.getChildren() as child>

				<@createNav navItem=child level=level+1/>
				
			</#list>

		</div>
	</#if>
</#macro>