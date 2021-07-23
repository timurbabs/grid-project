#!/usr/bin/env groovy

import hudson.model.*
import jenkins.model.*
import hudson.slaves.*
import hudson.slaves.EnvironmentVariablesNodeProperty.Entry
import hudson.plugins.sshslaves.verifiers.*

SshHostKeyVerificationStrategy hostKeyVerificationStrategy = new ManuallyTrustedKeyVerificationStrategy(false)

ComputerLauncher launcher = new hudson.plugins.sshslaves.SSHLauncher(
        "${host}",
        22,
        "${credentialsId}",
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
        "${name}",
        "${root_directory}",
        launcher)
agent.numExecutors = ${number_executors}
agent.labelString = "${label}"
agent.mode = Node.Mode.NORMAL
agent.retentionStrategy = new RetentionStrategy.Always()

Jenkins.instance.addNode(agent)
