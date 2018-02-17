#!groovy

folder('metabase') {
    description('Folder for metabase jobs')
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


folder('tools') {
    description('Folder for tools related jobs')
}


pipelineJob('tools/buildenv-docker-build') {

    def repo = 'https://github.com/gd-ikharlamov/metabase'

    description('metabase build job')

    definition {
        cpsScm {
            scm {
                git {
                    remote { url(repo) }
                    branches('master')
                    scriptPath('jobs/buildenv-docker-build-pipeline')
                    extensions { }
                }
            }
        }
    }
}


pipelineJob('tools/postgres-docker-build') {

    def repo = 'https://github.com/gd-ikharlamov/metabase'

    description('postgres build job')

    definition {
        cpsScm {
            scm {
                git {
                    remote { url(repo) }
                    branches('master')
                    scriptPath('jobs/postgres-docker-build-pipeline')
                    extensions { }
                }
            }
        }
    }
}
