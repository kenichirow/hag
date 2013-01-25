module.exports = (grunt) ->

  expandCoffeePath = (coffeePath,destDir)->
               grun.file.expandMapping([coffeePath + '/**/*.coffee'], destDir, 
                      rename: (destBase, destPath) ->
                        return destBase + destPath.slice(coffeePath.length, destPath.length).replace(/\.coffee$/, '.js')
               )

  grunt.initConfig
          coffee :
            test :
              files : expandCoffeePath('spec/coffee','spec/js')

          jasmine : 
            src : 'dist/*.js'
            options : 
              specs : 'spec/js/*.js'

          watch : 
            files : ['src/**/*.coffee','spec/**/*.coffee']
            tasks : ['coffee','jasmine']

          requirejs :



  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'build', ['coffee','jasmine']