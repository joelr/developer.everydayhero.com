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

## Authentication with Everyday Hero's Giving Passport

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
