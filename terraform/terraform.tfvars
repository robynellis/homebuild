// ID identifying the cluster to create. Use your username so that resources created can be tracked back to you.
cluster_id = "hub"

// Domain of the cluster. This should be "${cluster_id}.${base_domain}".
cluster_domain = "hub.foo.bar"

// Base domain from which the cluster domain is a subdomain.
base_domain = "hub.foo.bar"

// Name of the vSphere server. The dev cluster is on "vcsa.vmware.devcluster.openshift.com".
vsphere_server = "photon-machine.foo.bar"

// User on the vSphere server.
vsphere_user = "administrator@foo.bar"

// Password of the user on the vSphere server.
// this comes from profile.env which uses the env var VMWARE_PASSWORD
// vsphere_password = 

// Name of the vSphere cluster. The dev cluster is "devel".
vsphere_cluster = "clayton"

// Name of the vSphere data center. The dev cluster is "dc1".
vsphere_datacenter = "DC1"

// Name of the vSphere data store to use for the VMs. The dev cluster uses "nvme-ds1".
vsphere_datastore = "QNAP-VMDATA"

// Name of the vSphere folder that will be created and used to store all created objects.
vsphere_folder = "Hub"

// Defaults to 'VM Network' ,  update with appropriate network as needed.
vm_network = "VM Network"

// Name of the VM template to clone to create VMs for the cluster. The dev cluster has a template named "rhcos-latest".
vm_template = "coreos"

// The machine_cidr where IP addresses will be assigned for cluster nodes.
// Additionally, IPAM will assign IPs based on the network ID. 
machine_cidr = "192.168.7.0/24" # where your VMs will live , the same as in the install-config.yaml

// URL of the bootstrap ignition. This needs to be publicly accessible so that the bootstrap machine can pull the ignition.
bootstrap_ignition_url = "http://util.foo.bar:8080/ignition/bootstrap.ign"
// Ignition config for the control plane machines. You should copy the contents of the master.ign generated by the installer.
control_plane_ignition = <<END_OF_MASTER_IGNITION
{"ignition":{"config":{"append":[{"source":"https://api-int.managed.foo.bar:22623/config/master","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJWnNFWXJyN0ZQOE13RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEl3TURneE1USXdNRFl4T1ZvWApEVE13TURnd09USXdNRFl4T1Zvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUEwbUlTQTA0T1BMb0IKMlRNajEwU2lEUTBuUGRKNXRYczBpaEd4VElycGZ5Q3UycjNPMHRWWU9LRU9Mb1A0U0pDTmFOMVJ5QXhCQStoYwplTzhkLys4allYNWRwajZ5bHAwSmxkUm9HK1M1c21zSjF6RkRSNlBZZWFFVVhzWHZYTFdvTDBqQ0VLU25PK0NqCk9EWDdIUEcxaktvRlFwQVZ1Tk1OeW1jVGR4VzdRNG1sZ0tINFdqa3VXemlPQlVjNmlHUStIS2JvRXdKOTQrNnIKd0ptdlF4d0V0MjdmNmlyTXBLNXNDeXpqcm5rZEtWb29Ta0prUFhQZmNNL1RiT29YOXhodzB2d3cxSlNNREtuWQpMVUY3SEdldWZvczN1d3ZNRFMwRW5TYmVjMVhKL1JUUFRvTndwN09qS0lQVjQ1Q1B0aDNSRkUzN0tueTdoQ2U5CnYrc0Jra01pSlFJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVTM1SUF5YmFzcVB1eTdJQUt5bnRUMXVqNk1Wd3dEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQUVVdkJOVHBlSjhjZEdlVUk0dFQraFN2TW5pci96Mm95SUxuVUo4SDVKaXdIczNwVTNRbHdxSW9nczcxClhsRllpWUV4eEx3ekt4TVpyV0J0WGJDNjdUMDJwejhCZTI1N1VsT1pIQ3RIRWhrRGZQSEpIOTBLVFc2ZnM5MEwKRE5ycWZiSFhOZUl0YnVBMFdZeEI4TE1vdHYrOWtjWjlDYWJseTR0SU5tbUpNOVNFYno4ZnJyOGdLdFVyV2JKcQp2dC9aNHlPL1VhWjM3R0IyMlVyUlgxVDdMOXFWMnFHWm4xY2wrMnp5dmNYK1RZSW1UYS9xZENiM1FhLy9QbmFlClAvSVh6eGM0clRRSXRhUUlMY2w3TndydW4vTTE1bHFUd2NicXhRU1JseVNDYXdxU1c5b2s1M1QvQlFkdXUzT1YKSGN2bW0wOVlIN1FHMFFQZXlNUUJjZG13VTM0PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_MASTER_IGNITION

// Ignition config for the compute machines. You should copy the contents of the worker.ign generated by the installer.
compute_ignition = <<END_OF_WORKER_IGNITION
{"ignition":{"config":{"append":[{"source":"https://api-int.managed.foo.bar:22623/config/worker","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJWnNFWXJyN0ZQOE13RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEl3TURneE1USXdNRFl4T1ZvWApEVE13TURnd09USXdNRFl4T1Zvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUEwbUlTQTA0T1BMb0IKMlRNajEwU2lEUTBuUGRKNXRYczBpaEd4VElycGZ5Q3UycjNPMHRWWU9LRU9Mb1A0U0pDTmFOMVJ5QXhCQStoYwplTzhkLys4allYNWRwajZ5bHAwSmxkUm9HK1M1c21zSjF6RkRSNlBZZWFFVVhzWHZYTFdvTDBqQ0VLU25PK0NqCk9EWDdIUEcxaktvRlFwQVZ1Tk1OeW1jVGR4VzdRNG1sZ0tINFdqa3VXemlPQlVjNmlHUStIS2JvRXdKOTQrNnIKd0ptdlF4d0V0MjdmNmlyTXBLNXNDeXpqcm5rZEtWb29Ta0prUFhQZmNNL1RiT29YOXhodzB2d3cxSlNNREtuWQpMVUY3SEdldWZvczN1d3ZNRFMwRW5TYmVjMVhKL1JUUFRvTndwN09qS0lQVjQ1Q1B0aDNSRkUzN0tueTdoQ2U5CnYrc0Jra01pSlFJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVTM1SUF5YmFzcVB1eTdJQUt5bnRUMXVqNk1Wd3dEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQUVVdkJOVHBlSjhjZEdlVUk0dFQraFN2TW5pci96Mm95SUxuVUo4SDVKaXdIczNwVTNRbHdxSW9nczcxClhsRllpWUV4eEx3ekt4TVpyV0J0WGJDNjdUMDJwejhCZTI1N1VsT1pIQ3RIRWhrRGZQSEpIOTBLVFc2ZnM5MEwKRE5ycWZiSFhOZUl0YnVBMFdZeEI4TE1vdHYrOWtjWjlDYWJseTR0SU5tbUpNOVNFYno4ZnJyOGdLdFVyV2JKcQp2dC9aNHlPL1VhWjM3R0IyMlVyUlgxVDdMOXFWMnFHWm4xY2wrMnp5dmNYK1RZSW1UYS9xZENiM1FhLy9QbmFlClAvSVh6eGM0clRRSXRhUUlMY2w3TndydW4vTTE1bHFUd2NicXhRU1JseVNDYXdxU1c5b2s1M1QvQlFkdXUzT1YKSGN2bW0wOVlIN1FHMFFQZXlNUUJjZG13VTM0PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_WORKER_IGNITION

// BEGIN IPAM Optional
// Set ipam and ipam_token if you want to use the IPAM server to reserve IP
// addresses for the VMs.

// Address or hostname of the IPAM server from which to reserve IP addresses for the cluster machines.
//ipam = "139.178.89.254"

// Token to use to authenticate with the IPAM server.
//ipam_token = "TOKEN_FOR_THE_IPAM_SERVER"
// END IPAM

// Set bootstrap_ip, control_plane_ip, and compute_ip if you want to use static
// IPs reserved someone else, rather than the IPAM server.

// The number of control plane VMs to create. Default is 3.
control_plane_count = 3

// The number of compute VMs to create. Default is 3.
compute_count = 2

// Compute  cpu / memory
compute_memory = "8192"
compute_cpu = "2"

// Use Static Macs
use_static_mac = "true"

// Set GW
gw = "192.168.7.1"

// Set DNS1
dns1 = "192.168.1.1"

//    mac_address = "${var.static_mac}"
// False is default and will create the bootstrap VM
// True is used when scaling up compute nodes after installation.
bootstrap_complete = "False"

// The IP address to assign to the bootstrap VM.
bootstrap_ip = "192.168.7.50"
bootstrap_mac = "00:50:56:AB:4B:27"

// The IP addresses to assign to the control plane VMs. The length of this list
// must match the value of control_plane_count.
control_plane_ips = ["192.168.7.51", "192.168.7.52", "192.168.7.53"]
control_plane_macs = ["00:50:56:AB:5E:FF","00:50:56:AB:FA:D3", "00:50:56:AB:93:DC"]

// The IP addresses to assign to the compute VMs. The length of this list must
// match the value of compute_count.
compute_ips = ["192.168.7.54" , "192.168.7.55" , "192.168.7.56" ] // , "192.168.7.57" , "192.168.7.58", "192.168.7.59" ]
compute_macs = ["00:50:56:AB:F5:7E" , "00:50:56:AB:4D:EA"  , "00:50:56:AB:D7:CF" ] // #, "00:50:56:AB:D7:EA", "00:50:56:AB:D7:7E", "00:50:56:AB:4D:CF"]
