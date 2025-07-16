package aap_policy

import rego.v1

job_execution_disabled := {
	"allowed": false,
	"violations": ["No job execution is allowed."],
}
