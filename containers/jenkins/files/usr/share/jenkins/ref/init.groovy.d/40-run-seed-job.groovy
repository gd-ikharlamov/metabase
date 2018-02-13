#!groovy
import hudson.model.*
import jenkins.model.Jenkins

private def buildJob(String jobName) {
    println("--- Building job $jobName")
    def job = Jenkins.instance.getJob(jobName)
    Jenkins.instance.queue.schedule(job, 0, new CauseAction(new Cause() {
        @Override
        String getShortDescription() {
            "Jenkins startup script"
        }
    }))
}

buildJob('seed/main-seed')
