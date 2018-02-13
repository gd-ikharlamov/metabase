#!groovy

folder('seed') {
    description('Folder seed jobs')
}


freeStyleJob("seed/main-seed") {
    scm {
        github('gd-ikharlamov/metabase')
    }

    steps {
        dsl {
            external('jobs/seed/main_seed.groovy')
        }
    }
}
