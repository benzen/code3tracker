module.exports = (grunt)->

  # Project configuration
  grunt.initConfig(
    
    pkg: grunt.file.readJSON('package.json')

    uglify: 
      options: 
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build: 
        src: 'build/<%= pkg.name %>.js'
        dest: 'build/<%= pkg.name %>.min.js'

    coffee: 
      glob_to_multiple: 
        expand: true
        flatten: true
#        cwd: 'path/to'
        src: ['src/main/**/*.coffee']
        dest: 'build'
        ext: '.js'

#      compile: 
#        files: 
#          'build/code3tracker.js': 'src/main/code3tracker.coffee'

    nodeunit:
      all: ['src/test/*_test.coffee']

    copy:
      main:
        files:[
          src: ['src/main/properties.yml']
          dest: "build/properties.yml" 
        ]
        

#
#    watch: 
#      scripts:
#        files: ['src/*.coffee']
#        tasks: ['livereload']
#        options: 
#          nospawn: true
#          

  )

  
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-nodeunit')
  grunt.loadNpmTasks('grunt-contrib-copy')
# grunt.loadNpmTasks('grunt-contrib-watch')
  

  # Default task(s)
  grunt.registerTask('default', ['coffee','uglify','copy','nodeunit'])
