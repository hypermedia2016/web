# web

## How to configure
1. Create a mysql database and an user with write acces to it
2. Import `DB/dbschema.sql`
3. Set server address on
    * `WEBSITE/resources/views/includes/config.jade`
    * `WEBSITE/resources/assets/js/app.js`
4. Create `config.php` file using example on `config` directory

## How to compile
1. type `npm install` 
1. type `gulp`

## How to test locally
type `gulp serve`

**Note:** all actions must be executed in the `WEBSITE` directory

## External reosurces
### Frameworks
* [Vuje](http://vuejs.org/)
* [pug (ex jade)](http://jade-lang.com/)
* [sass](http://sass-lang.com/)
* [less](http://lesscss.org/)
* [bootstrap](http://getbootstrap.com/)
* [jQuery](https://jquery.com/)
* [Gulp](http://gulpjs.com/)

### Libraries
All libraries are npm libraries
 * babel-preset-es2015
 * babel-preset-react
 * gulp-print
 * gulp-rename
 * gulp-shell
 * jquery-stickytabs
 * laravel-elixir
 * laravel-elixir-pug
 * query-string
 * vue-resource

## Notes
* In the realease version we will add the compiled files

## TODO
- [ ] "The .pdf with the P-IDM schema (the same P-IDM schema of the design project)"
- [ ] "Obviously the APK should also be uploaded inside the github repository."
- [ ] config.php
- [ ] installation guide
- [ ] sql
- [ ] check vue bootstrap
- [ ] apache config
- [ ] npm install
- [ ] complete schema
- [ ] guide to populate
- [ ] compiled files
- [ ] concat of js, just to show them
