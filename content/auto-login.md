---
title: Auto-login URLs
---
## Create auto-login URL
<p class='info'><strong>Authentication types</strong>: OAuth User Token, OAuth App token</p>

    POST https://everydayhero.com/api/v2/urls

The auto-login API endpoint accepts both application tokens and user tokens. In the case of user tokens, auto-login URLs will be scoped against that user. For application tokens, a user email must be provided, the application also has to have permission to access this endpoint if using an application token.

### Parameters

user_email : _optional_ **string**<br/>
If authenticating as an application, a user's email must be provided.

url : **string**<br/>
The URK to redirect to
