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

{% for credential in jenkins_ssh_credentials %***REMOVED***
privateKey = new BasicSSHUserPrivateKey.DirectEntryPrivateKeySource(
  '''
{{ credential['private_key'] ***REMOVED******REMOVED***
  '''
)

sshKey = new BasicSSHUserPrivateKey(CredentialsScope.GLOBAL,
                                    "{{ credential['name'] ***REMOVED******REMOVED***",
                                    "{{ credential['username'] ***REMOVED******REMOVED***",
                                    privateKey,
                                    "{{ credential['passphrase'] ***REMOVED******REMOVED***",
                                    "{{ credential['description'] ***REMOVED******REMOVED***"
)

store.addCredentials(domain, sshKey)
{% endfor %***REMOVED***

