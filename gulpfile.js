var gulp = require('gulp');
var cleanCSS = require('gulp-clean-css');
var sass = require('gulp-sass') ;
var notify = require("gulp-notify") ;
var bower = require('gulp-bower');
var concat = require('gulp-concat');
var fontAwesome = require('node-font-awesome');
var minify = require('gulp-minify');

var config = {
     sassPath: './resources/sass',
     bowerDir: './bower_components' ,
	scriptsPath: './resources/scripts',
}

gulp.task('bower', function() { 
    return bower()
         .pipe(gulp.dest(config.bowerDir)) 
});

gulp.task('scripts', function () {
	 gulp.src([
	 	config.bowerDir + '/jquery/dist/jquery.js',
	 	config.scriptsPath + '/app.js',
	 	
	 ])
	 .pipe(concat('app.js'))
	 .pipe(minify({
        ext:{
            src:'-debug.js',
            min:'.js'
        },
        exclude: ['tasks'],
        ignoreFiles: ['.combo.js', '-min.js']
    }))
	 .pipe(gulp.dest('./public/js'));
});

gulp.task('css', function() {
    return gulp.src(config.sassPath + '/style.scss')
    .pipe(sass({
        includePaths: [config.bowerDir + '/bootstrap-sass/assets/stylesheets'],
    }))
    .pipe(cleanCSS({compatibility: 'ie8'}))
    .pipe(gulp.dest('./public/css'));
});

gulp.task('fonts', function() {
  gulp.src(fontAwesome.fonts)
    .pipe(gulp.dest('./public/fonts'));
});

// Rerun the task when a file changes
 gulp.task('watch', function() {
     gulp.watch(config.sassPath + '/**/*.scss', ['css']); 
	gulp.watch(config.scriptsPath + '/**/*.js', ['scripts']); 
});

  gulp.task('default', ['bower',  'css', 'scripts','fonts']);


