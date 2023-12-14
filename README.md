# php-code-quality

## Features

PHP static analysis tools to add out-of-the-box on php projects.

## How to use

```
$ git clone https://github.com/gstapinato/php-code-quality.git
$ cd php-code-quality
$ docker build -t gstapinato/php-code-quality .

# copy 'makefile.qa' and configuration files on your project
$ cp -a qa/. <project_root_directory>
```

Then, on your project run 

```
$ make -f makefile.qa phpstan
```

## Notes

PHP version can be changed on dockerfile before docker build.


### Reference

https://github.com/adamculp/php-code-quality