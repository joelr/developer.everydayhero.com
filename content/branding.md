---
title: Sign-in Branding
---

* TOC
{:toc}

## Introduction

Integrating with Everyday Hero's Giving Passport makes authenticating users
simple but can be a disjointed experience for some. To assist, you can supply
branding information that will be incorporated into the signing in process.
When a user is asked to sign-up through your [OAuth integration](/oauth-integration/)
they will see your brand and have a consistent experience.

### Before
![Before sign-in branding](/images/signin_standard.png)

### After
![After sign-in branding](/images/signin_branding.png)

## Usage

Branding the sign-in form is a two-step process. Firstly the branding
information must be given along with a unique reference that is managed by
you. Then secondly, during the
[OAuth authorization process](/oauth-integration/#authorize-endpoint) you
supply that reference for the branding given. This tells Giving Passport
that you wish for the user to have a branded experience and which branding
to use. There are no limits as to how many different brandings you can
supply, as long as each have a unique reference.

If no branding can be found by the given reference then the process
defaults back to the standard Giving Passport experience.

## Supply/update branding

Adds, or updates, the branding for the given reference.

  PUT passport_host/api/v1/branding/:reference.json

### Visibility

Restricted. Requires an authenticated user.

### Payload

brand[background_colour]
: _Optional_ **string**. The background colour as a hex code. ie. `#ff00ff`.

brand[background_image_url]
: _Optional_ **string**. The URL of the image to be used in the background.
Image width must be at least 1100px. Optimal dimensions should be 1100x800px.

brand[header_image_url]
: _Optional_ **string**. The URL of the image to be used in the header.
Image width must be 890px. Optimal dimensions should be 890x290px.

At least one of these attributes must be supplied to be acceptable.

<%= json \
  brand: {
    background_colour: '#f6c783',
    background_image_url: 'http://developer.everydayhero.com/images/bg.jpeg',
    header_image_url: 'http://developer.everydayhero.com/images/header.jpeg'
  }
%>

### Response

204 *No content*

## Remove branding

Deletes the branding.

  DELETE passport_host/api/v1/branding/:reference.json

### Response

204 *No content*
