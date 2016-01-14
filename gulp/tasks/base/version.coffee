gulp = require('gulp-help')(require('gulp'))
git = require('gulp-git')
bump = require('gulp-bump')
filter = require('gulp-filter')
tag = require('gulp-tag-version')
argv = require('yargs').argv

newVer = (type)->
  fs = require('fs')
  pkg = JSON.parse fs.readFileSync('./package.json')
  semver = require('semver')
  semver.inc(pkg.version, type)

commit = (ver)->
  git.commit("bumps to #{ver}")

version = (type) ->
  ver = newVer(type)
  gulp.src('./package.json')
    .pipe(bump version: ver)
    .pipe(gulp.dest('./'))
    .pipe(commit(ver))
    .pipe(filter('package.json'))
    .pipe tag()

###*
# Bumping version number and tagging the repository with it.
# Please read http://semver.org/
# gulp version patch minor major
# ###

gulp.task 'version', -> version argv['to']
