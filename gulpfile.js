var elixir = require('laravel-elixir');
var pug = require('gulp-pug');
var gulp = require('gulp');

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir(function (mix) {
    mix.less('app.less')
        .browserify('app.js', null, null, {});
    gulp.src('resources/views/*.jade')
        .pipe(pug({
            // Your options in here.
        })).pipe(gulp.dest('public'));
});