// #!groovy
// import jenkins.model.*
//
// def installed = false
// def initialized = false
//
// def pluginsList = new File('/opt/jenkins/init.groovy.d/plugins.txt')
//
// def instance = Jenkins.getInstance()
// def PluginManager = instance.getPluginManager()
// def UpdateCenter = instance.getUpdateCenter()
//
// pluginsList.eachLine {
//     // String line ->
//     println("--- Checking " + it)
//     if (!PluginManager.getPlugin(it)) {
//       println "--- Looking UpdateCenter for " + it
//       if (!initialized) {
//           UpdateCenter.updateAllSites()
//           initialized = true
//       }
//       def plugin = UpdateCenter.getPlugin(it)
//       if (plugin) {
//           println("--- Installing " + it)
//       	def installFuture = plugin.deploy()
//           while(!installFuture.isDone()) {
//           println("--- Waiting for plugin install: " + it)
//           sleep(3000)
//           }
//           installed = true
//       }
//     }
// }
//
// if (installed) {
//   println("--- Plugins installed, initializing a restart!")
//   instance.save()
//   instance.restart()
// }
