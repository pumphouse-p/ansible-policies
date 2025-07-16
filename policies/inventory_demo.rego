package aap_policy

import rego.v1

# Default policy response indicating allowed status with no violations
default inventory_demo := {
	"allowed": true,
	"violations": [],
}

# Validate that only "Default" can use "Demo Inventory"
inventory_demo := result if {
	# Extract values from input
	inventory_name := object.get(input, ["inventory", "name"], "")
	org_name := object.get(input, ["organization", "name"], "")

	# Check if inventory is "Demo Inventory"
	inventory_name == "Demo Inventory"

	# Check if organization is not "Default"
	org_name != "Default"

	result := {
		"allowed": false,
		"violations": ["Only the 'Default' organization should use the 'Demo Inventory' inventory"],
	}
}
