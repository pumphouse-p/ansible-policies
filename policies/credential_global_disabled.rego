package aap_policy

# Find credentials with no organization
violating_credentials := {cred.name | cred := input.credentials[_]; cred.organization == null}

default credential_global_disabled := {
	"allowed": true,
	"violations": [],
}

# If any credential is violating, deny access and return violations
credential_global_disabled := {
	"allowed": false,
	"violations": [sprintf("Credential used in job execution does not belong to any org. Violating credentials: [%s]", [concat(", ", violating_credentials)])],
}

if {
	count(violating_credentials) > 0
}
