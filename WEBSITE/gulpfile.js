var elixir = require('laravel-elixir');
var gulp = require('gulp');
require('laravel-elixir-pug');
var shell = require('gulp-shell');

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
    mix.less('app-less.less')
        .sass('app-sass.sass')
        .browserify('app.js', null, null, {})
        .pug({
            // Pretty output or uglified
            pretty: true,
            // Source of pug files
            src: 'resources/views/public/',
            // File names to look for, useful if you are still naming files .jade
            search: '**/*.jade',
            // If blade is true, output to resources/views, otherwise public/html
            dest: 'public',
            // Any additional watches
            additional_watches: ['resources/views/includes/**/*.jade']
        });
});

gulp.task('serve',  shell.task([
    'php -S localhost:8000 -t public'
]));