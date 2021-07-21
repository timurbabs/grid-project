#!groovy

import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

def hudsonRealm = new HudsonPrivateSecurityRealm(false)

hudsonRealm.createAccount('{{ jenkins_username ***REMOVED******REMOVED***','{{ jenkins_password ***REMOVED******REMOVED***')
instance.setSecurityRealm(hudsonRealm)
instance.save()
