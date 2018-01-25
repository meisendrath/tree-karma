# README

## Website

https://wuji-karma-production-web-app.herokuapp.com/

## White Paper

https://docs.google.com/document/d/1RSjsYznhyBGm247p2zmfCyQAiq-aSmoAqnp8eUuv4z0

## Stripe Credit Card Usage Information

Stripe is currently switched to test mode

To test enter:
  - Credit card number: 4242 4242 4242 4242
  - Future expiry data, any 3 digit CVC, and existing zip code

## Bug Information

#### Steps to repro

1. On *CONTRIBUTE* page, enter credit card information
2. Submit the form

#### Affected

- *YOUR CONTRIBUTIONS* page, only not *completed* orders

#### Steps to go around

1. On *PARTNER DASHBOARD* (or *BECOME PARTNER*, to make user partner), *Accept* and *Complete* all open orders
2. After all orders are completed, *YOUR CONTRIBUTIONS* page will be available

#### Cause & Fix

Line 14 at https://github.com/meisendrath/wuji-karma/blob/master/app/views/contributions/index.html.haml

Should check if `resource.item` exists before showing tree image, since `item` with tree information is created when order is completed
