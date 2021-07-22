#!/usr/bin/env groovy

import jenkins.model.Jenkins
import com.cloudbees.plugins.credentials.domains.Domain
import org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl
import com.cloudbees.plugins.credentials.CredentialsScope
import hudson.util.Secret
import com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey
import com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl

instance = Jenkins.instance
domain = Domain.global()
store = instance.getExtensionList(
  "com.cloudbees.plugins.credentials.SystemCredentialsProvider")[0].getStore()

{% for credential in jenkins_secret_text_credentials %***REMOVED***
secretText = new StringCredentialsImpl(
  CredentialsScope.GLOBAL,
  "{{ credential['name'] ***REMOVED******REMOVED***",
  "{{ credential['description'] ***REMOVED******REMOVED***",
  Secret.fromString("{{ credential['text'] ***REMOVED******REMOVED***")
)

store.addCredentials(domain, secretText)
{% endfor %***REMOVED***
