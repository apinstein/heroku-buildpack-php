Apache Worker MPM + fastcgi + php-fpm build pack
================================================

This is a build pack bundling PHP and Apache for Heroku apps.

Configuration
-------------

The config files are bundled with the build pack itself:

* conf/httpd.conf
* conf/php.ini


Pre-compiling binaries
----------------------

This buildpack uses binaries built with Vulcan; all bulid scripts are in https://github.com/apinstein/vulcan-build-scripts

Performance
-----------

The Apache worker mpm is highly memory-efficient (compared to the common prefork mpm), and combined with php-fpm yields a web app server that can support thousands of static file requests/sec and hundreds of php requests/sec on a single Heroku dyno.

Many people think you need to use nginx+php-fpm to get this kind of efficiency, but it's not true. Apache's worker mpm is great, and if you're already comfortable with apache, it's a great stack for running PHP apps.

The buildpack currently uses the worker mpm defaults for Apache (see support/httpd.conf).
The php-fpm config (see support/php-fpm.conf) is tuned to a max of 30 php processes, but aims to stay around 10.

This is a pretty good setup for a heroku dyno and shouldn't need tuning unless proven troublesome with extensive production data.

App-Specific Tuning
-------------------

App-Specific Tuning
-------------------

- If your app has a composer.json file, all composer deps will be installed at deploy time. The composer vendor dir is cached for fast re-deploys.
- If you use config-magic, ```heroku config:add CONFIG_MAGIC_PROFILE profile-name```
- If you want to supply your own php-fpm.conf ```heroku config:add PHP_FPM_CONF``` or php.ini ```heroku config:add PHP_INI```
- If you want to customize the slug with an app-specific task ```heroku config:add COMPILE_TASK "rake app:setup"```

Hacking
-------

To change this buildpack, fork it on Github. Push up changes to your fork, then create a test app with --buildpack <your-github-url> and push to it.

Meta
----

Created by Pedro Belo.
Many thanks to Keith Rarick for the help with assorted Unix topics :)

Vastly edited by Alan Pinstein.
