# php-code-quality

## Features

PHP static analysis tools to add out-of-the-box on php projects.

## How to use

```
git clone https://github.com/gstapinato/php-code-quality.git
cd php-code-quality
docker build -t gstapinato/php-code-quality .
```
Copy 'conf/makefile' and 'conf/phpstan.neon' files on your project directory. 

Then, on your project run 

```
make phpstan
```


## Notes

PHP version can be changed on dockerfile before docker build.


### Reference

https://github.com/adamculp/php-code-quality