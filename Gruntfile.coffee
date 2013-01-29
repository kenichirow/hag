module.exports = (grunt) ->

  expandCoffeePath = (coffeePath,destDir)->
               grunt.file.expandMapping([coffeePath + '/**/*.coffee'], destDir,
                      rename: (destBase, destPath) ->
                        return destBase + destPath.slice(coffeePath.length, destPath.length).replace(/\.coffee$/, '.js')
               )
  grunt.initConfig
          coffee :
            compile :
              files : expandCoffeePath('src/javascripts/','dist/javascripts/')
            test :
              files : expandCoffeePath('spec/coffee','spec/js')

          concat :
             vendor :
               src  : [
                 'src/javascripts/vendor/jquery/dist/jquery.js',
                 'src/javascripts/vendor/underscore/underscore.js',
                 'src/javascripts/vendor/backbone/backbone.js',
                 'src/javascripts/vendor/d3/d3.v2.js'
               ]
               dest : 'dist/javascripts/vendor.js'
             app :
               src : ['src/javascripts/app/**/*.js']
               dest : 'dist/javascripts/app.js'

          jasmine :
            src : [
              'dist/vendor.js',
              'dist/app.js'
            ]
            options :
              specs : 'spec/js/*.js'

          copy:
            main:
              files: [
                src: ['src/index.html']
                dest: 'dist/index.html'
                filter: 'isFile' 
              ]

            require:
              files: [
                src: ['src/javascripts/vendor/require.js']
                dest: 'dist/javascripts/require.js'
                filter: 'isFile' 
              ]

          watch : 
            files : ['src/**/*.coffee','spec/coffee/**/*.coffee','src/index.html','Gruntfile.coffee']
            tasks : ['build']

           connect:
             server:
               options:
                 port: 8888
                 base: './dist'


  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'server', ['connect:server:keepalive']
  grunt.registerTask 'build', ['coffee','concat','jasmine','copy:main']
