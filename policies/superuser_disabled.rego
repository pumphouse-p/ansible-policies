package aap_policy

import rego.v1

default superuser_disabled := {
	"allowed": true,
	"violations": [],
}

superuser_disabled := {
	"allowed": false,
	"violations": ["SuperUser is not allow to launch jobs"],
} if {
	input.created_by.is_superuser
}
