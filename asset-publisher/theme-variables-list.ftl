<#--

<#assign 
    userService = serviceLocator.findService("com.liferay.portal.kernel.service.UserLocalServiceUtil")
/>

<#assign HttpUtil = staticUtil["com.liferay.portal.kernel.util.HttpUtil"] />

-->


<div class="card-horizontal main-content-card">
    <div class="panel-body">
        <b>locale</b>: ${locale}
    </div>
</div>

<div class="card-horizontal main-content-card">
    <div class="panel-body">
        <b>template_id</b>: ${template_id}
    </div>
</div>

<div class="card-horizontal main-content-card">
    <div class="panel-body">
        <b>currentURL</b>: ${currentURL}
    </div>
</div>

<div class="card-horizontal main-content-card">
    <div class="panel-body">
        <b>themeDisplay</b>: ${themeDisplay}
    </div>
</div>

<div class="card-horizontal main-content-card">
    <div class="panel-body">
        <b>request</b>: ${request}
    </div>
</div>

<div class="card-horizontal main-content-card">
    <div class="panel-body">
        <b>renderRequest</b>: ${renderRequest}
    </div>
</div>

<div class="card-horizontal main-content-card">
    <div class="panel-body">
        <b>renderResponse</b>: ${renderResponse}
    </div>
</div>

<div class="card-horizontal main-content-card">
    <div class="panel-body">
        <b>assetPublisherHelper</b>: ${assetPublisherHelper}
    </div>
</div>

<div class="card-horizontal main-content-card">
    <div class="panel-body">
        
        <b>For Web Content Display Templates in freemarker the following reserved variables are available:</b>
        <br/>
        <br/>
        <b>$</b><b>{.vars['reserved-article-create-date'].data}</b>
        <br/>
        <br/>
        
        reserved-article-asset-tag-names<br/>
        reserved-article-author-comments<br/>
        reserved-article-author-email-address<br/>
        reserved-article-author-id<br/>
        reserved-article-author-job-title<br/>
        reserved-article-author-location<br/>
        reserved-article-author-name<br/>
        reserved-article-author-organization<br/>
        reserved-article-create-date<br/>
        reserved-article-description<br/>
        reserved-article-display-date<br/>
        reserved-article-id<br/>
        reserved-article-modified-date<br/>
        reserved-article-small-image-url<br/>
        reserved-article-title<br/>
        reserved-article-type<br/>
        reserved-article-url-title<br/>
        reserved-article-version<br/>
    </div>
</div>