#!groovy
import javaposse.jobdsl.dsl.*
import javaposse.jobdsl.plugin.*

println "--- adding seed job"

def jobDslScript = new File('/opt/jenkins/init.groovy.d/jobs/seed.groovy.dsl')
def workspace = new File('.')

def jobManagement = new JenkinsJobManagement(System.out, [:], workspace)

new DslScriptLoader(jobManagement).runScript(jobDslScript.text)
