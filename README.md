== what is this

A fun side project to explore the latest in web tech.

Here's the roster:

CoffeeScript / AngularJS / SVG

LoDash / Bootstrap / Compass

Yeoman / Grunt / Bower

...and of course Github pages

== how to play

visit http://worldmap.io and enjoy!

== how to hack

-- basics

install nodejs 0.10.15

install ruby 1.9.3 or 2.0

make sure you have ruby in your path

gem install compass

-- repo setup

clone repository

npm -g install yo grunt-cli bower karma

optional: (npm install -g generator-angular)

npm install

...expect a lot of packages to be installed.

bower install

...expect a lot of packages to be installed

grunt server

...the browser should come up with the application

== how to deploy

grunt server:dist

browser opens, make sure everything is fine. If you're sure it will be fine without looking, just run "grunt build" instead

git commit -m "{some message here}"

git push

git subtree push --prefix dist origin gh-pages

(and wait up to 10 minutes for changes to take effect)