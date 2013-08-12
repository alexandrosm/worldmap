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

install ruby 1.9.3

gem install compass

-- repo setup

clone repository

npm install yo grunt-cli bower

npm install

bower install

grunt server

== how to deploy

grunt server:dist

browser opens, make sure everything is fine. If you're sure it will be fine without looking, just run "grunt build" instead

git commit -m "{some message here}"

git push

git subtree push --prefix dist origin gh-pages

(and wait up to 10 minutes for changes to take effect)