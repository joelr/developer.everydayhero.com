---
title: Integration
---

* TOC
{:toc}

One of the biggest questions we receive from developers is around end to
end integration - the API is great for pushing and pulling information
but what if I want to create a tighter experience with Everyday Hero?

Everyday Hero offer several integration points with third party software
- the two that will be described in detail will firstly be
authentication and secondly registration before creating supporter
pages.

## Why integrate with Everyday Hero for Authentication

* Ability to gain more detailed information on users because you can
leverage any information provided by Everyday Hero
* Build upon data provided by Everyday Hero to customise an experience
for you users
* Global user identification. Once authenticated you will be given a
universal identifier (uid) which is our guarantee to you that this is
the same user within Everyday Hero and your product. This is especially
useful for year on year campaigns.

## How to Authenticate with Everyday Hero's Giving Passport

Everyday Hero's Giving Passport is our way of globally recognising a
user within any one of our products. We are now opening this
functionality for other developers to leverage. We are using the same
technology that powers Twitter and Facebook: OAuth2. Because this has
predominately been an internal tool there is no user interface for
creating and managing your OAuth applications but if you contact
[support](mailto:support@everydayhero.com) we can get you underway.

Integrating OAuth2 into any modern system should be fairly simple.
Everyday Hero have written (and maintain) the ruby client for
interfacing with the Giving Passport and it can be found on
[GitHub](https://github.com/everydayhero/omniauth-passport). A quick
google for your language / framework and OAuth2 should yield the best
library for you.

By authenticating with the Giving Passport you are guaranteed that the
user you are dealing with will be the same person person that is
represented in any Everyday Hero product.

## Third Party Registration Product Integration

A [sample application](http://example-rego-integration.herokuapp.com) has been
built to show one possible end to end third party registration scenario.
Source code for the application can be found on
[GitHub](https://github.com/everydayhero/example_registrations).
This application demonstrates:

* authentication with the Giving Passport
* using the Everyday Hero API to create a supporter page and view
information on the campaign
* while still giving you ultimate control over your registration system

For this type of integration you will need the following:

* An OAuth2 application
* An API key
* Registering a third party integration application

All of this can be obtained by emailing
[support](mailto:support@everydayhero.com).

Generally there are going to be two entry points into your campaign, the
first will be through your website and the second will be through an
Everyday Hero supporter page. The two flows are slightly different and
deserve separate discussions.

### Your Website

It is much more likely that the bulk of participants will 

### Everyday Hero Supporter Page
