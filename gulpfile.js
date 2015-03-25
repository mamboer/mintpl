var gulp = require('gulp'),
    uglify = require('gulp-uglify'),
    rename = require('gulp-rename'),
    swig = require('gulp-swig'),
    pkg = require('./package.json');

gulp.task('default', function() {

    var swigOpts = {

        data:pkg

    };

    var cfg = {
        fileName:pkg.name+'.js',
        minFileName:pkg.name+'.min.js',
        srcFileName:'src/'+pkg.name+'.js'
    };

    gulp.src(cfg.srcFileName)
        .pipe(swig(swigOpts))
        .pipe(rename(cfg.fileName))
        .pipe(gulp.dest('dist'))
        .pipe(gulp.dest('site/dist'))
        .pipe(uglify({preserveComments:'some'}))
        .pipe(rename(cfg.minFileName))
        .pipe(gulp.dest('dist'))
        .pipe(gulp.dest('site/dist'));

    gulp.src('bower.swig')
        .pipe(swig(swigOpts))
        .pipe(rename('bower.json'))
        .pipe(gulp.dest(__dirname));
    
    gulp.src('index.swig')
        .pipe(swig(swigOpts))
        .pipe(gulp.dest('site'));    
    
    var siteFiles = ['package.json'];
    gulp.src(siteFiles,{base:'.'})
        .pipe(gulp.dest('site'));


});
