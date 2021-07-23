#!/usr/bin/env groovy

import hudson.model.*
import jenkins.model.*
import hudson.slaves.*
import hudson.slaves.EnvironmentVariablesNodeProperty.Entry
import hudson.plugins.sshslaves.verifiers.*

SshHostKeyVerificationStrategy hostKeyVerificationStrategy = new ManuallyTrustedKeyVerificationStrategy(false)

ComputerLauncher launcher = new hudson.plugins.sshslaves.SSHLauncher(
        "${host***REMOVED***",
        22,
        "${credentialsId***REMOVED***",
        (String)null,
        (String)null,
        (String)null, 
        (String)null, 
        (Integer)null, 
        (Integer)null,
        (Integer)null, 
        hostKeyVerificationStrategy 
)

Slave agent = new DumbSlave(
        "${name***REMOVED***",
        "${root_directory***REMOVED***",
        launcher)
agent.numExecutors = ${number_executors***REMOVED***
agent.labelString = "${label***REMOVED***"
agent.mode = Node.Mode.NORMAL
agent.retentionStrategy = new RetentionStrategy.Always()

Jenkins.instance.addNode(agent)
