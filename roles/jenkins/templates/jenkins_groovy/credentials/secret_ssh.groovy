#!/usr/bin/env groovy

import jenkins.model.Jenkins
import com.cloudbees.plugins.credentials.domains.Domain
import com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey
import com.cloudbees.plugins.credentials.CredentialsScope

instance = Jenkins.instance
domain = Domain.global()
store = instance.getExtensionList(
  "com.cloudbees.plugins.credentials.SystemCredentialsProvider")[0].getStore()

privateKey = new BasicSSHUserPrivateKey.DirectEntryPrivateKeySource(
  '''
${private_key}
  '''
)

sshKey = new BasicSSHUserPrivateKey(
  CredentialsScope.GLOBAL,
  "${name}",
  "${username}",
  privateKey,
  "${passphrase}",
  "${description}"
)

store.addCredentials(domain, sshKey)
