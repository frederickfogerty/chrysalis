gulp = require 'gulp'
stylus = require 'gulp-stylus'
prefix = require 'gulp-autoprefixer'
cssmin = require 'gulp-cssmin'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
concat = require 'gulp-concat'
reload = require 'gulp-livereload'
karma = require('karma').server
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
sourcemaps = require 'gulp-sourcemaps'
jade = require 'gulp-jade'
connect = require 'gulp-connect'

onError = (err) ->
  # notify
  #     title:    "Gulp",
  #     subtitle: "Failure!",
  #     message:  "Error: "+err.message+" %>",
  #     sound:    "Beep"
  gutil.beep()
  gutil.log err

gulp.task 'css', ->
  return gulp.src 'src/style/*.styl'
    .pipe plumber errorHandler: onError
    .pipe sourcemaps.init()
      .pipe stylus()
      .pipe concat 'style.css'
    .pipe sourcemaps.write()
    .pipe prefix()
    # .pipe cssmin keepSpecialComments: 0
    .pipe gulp.dest 'build/css'

gulp.task 'coffee', ->
  return gulp.src 'src/script/**/*.coffee'
    .pipe plumber errorHandler: onError
    .pipe concat 'app.coffee'
    .pipe coffee()
    .pipe gulp.dest 'build/js'

gulp.task 'templates', ->
  return gulp.src 'src/html/**'
    .pipe jade()
    .pipe gulp.dest 'build/'

gulp.task 'connect', ->
  connect.server()
    # root: 'build'
    # livereload: true

gulp.task 'build', ['css', 'coffee', 'templates']
gulp.task 'test', ['build', 'build-js-test', 'build-html-test'], (done) ->
  karma.start({
    configFile: __dirname + '/karma.conf.js'
    singleRun: true
    },
  done
  )



gulp.task 'watch', ->
  reload.listen()
  gulp.watch 'src/html/**', ['templates']
  gulp.watch 'src/script/**', ['coffee']
  gulp.watch 'src/style/**', ['css']
  gulp.watch 'src/test/**', ['build-js-test', 'build-html-test']
  gulp.watch(['build/**', 'index.html', 'templates/**', 'bravatrackcom/Bravatrak_files/**', 'css/**'])
    .on 'change', reload.changed

gulp.task 'bdd', ['build', 'build-js-test', 'build-html-test'], ->
  gulp.run 'watch'
gulp.task 'default', ['build', 'connect'], ->
  gulp.run 'watch'
