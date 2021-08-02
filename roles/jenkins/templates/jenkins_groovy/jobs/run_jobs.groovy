#!/usr/bin/env groovy

import hudson.model.*

def job = hudson.model.Hudson.instance.getJob("${job_name}")
def params = new StringParameterValue('', "")  
def paramsAction = new ParametersAction(params)
hudson.model.Hudson.instance.queue.schedule(job, 0, paramsAction)
