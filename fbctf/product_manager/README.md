# Product Manager Writeup

>Come play with our products manager application!
>http://challenges.fbctf.com:8087
>Written by Vampire
>(This problem does not require any brute force or scanning. We will ban your team if we detect brute force or scanning).

## Initial thoughts
..*SQLI
..*Cookie Manipulation

## Walkthrough

Reading through the files provided it appears the flag is in the description of the *facebook* product.
![product_manager][add_product.png]
Using MySQL vulnerability, when a new product is added with the name facebook plus any number of spaces the website accepts this as a valid new product but ends up just changing the original facebook product's secret key.

View the facebook product using the newly changed secret key to view the flag.

Links:
https://bugs.mysql.com/bug.php?id=64772


