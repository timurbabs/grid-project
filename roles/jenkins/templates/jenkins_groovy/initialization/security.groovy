#!/usr/bin/env groovy

import jenkins.model.*
import hudson.security.*
import java.io.File

def fileName = "jenkins_security"
def inputFile = new File("/tmp/" + fileName)

if(!inputFile.exists()) {
		inputFile.createNewFile()

		def instance = Jenkins.getInstance()
		def hudsonRealm = new HudsonPrivateSecurityRealm(false)
		
		hudsonRealm.createAccount('{{ jenkins_username }}','{{ jenkins_password }}')
		instance.setSecurityRealm(hudsonRealm)
		instance.save()
}
