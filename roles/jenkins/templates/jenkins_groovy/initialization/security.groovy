#!/usr/bin/env groovy

import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)

hudsonRealm.createAccount('{{ jenkins_username }}','{{ jenkins_password }}')
instance.setSecurityRealm(hudsonRealm)
instance.save()
