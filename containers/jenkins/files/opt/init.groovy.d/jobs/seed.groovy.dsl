#!groovy
folder('metabase') {
    description('Folder for metabase')
}

pipelineJob('metabase/build') {

  def repo = 'https://github.com/gd-ikharlamov/metabase'

  description('metabase build job')

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches('master')
          scriptPath('jobs/metabase-build-pipeline')
          extensions { }
        }
      }
    }
  }
}
