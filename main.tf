module "kubernetes" {
  source = "github.com/bennu/terraform-kubernetes-yagan.git?ref=v1.20.2"
  # source  = "bennu/yagan/kubernetes"
  # version = "1.20.2"

  addon_job_timeout                    = var.addon_job_timeout
  addons_include                       = var.addons_include
  always_pull_images                   = var.always_pull_images
  api_server_lb                        = var.api_server_lb
  cgroup_driver                        = var.cgroup_driver
  cilium_allocate_bpf                  = var.cilium_allocate_bpf
  cilium_debug                         = var.cilium_debug
  cilium_ipam                          = var.cilium_ipam
  cilium_monitor                       = var.cilium_monitor
  cilium_node_init                     = var.cilium_node_init
  cilium_node_init_restart_pods        = var.cilium_node_init_restart_pods
  cilium_operator_prometheus_enabled   = var.cilium_operator_prometheus_enabled
  cilium_operator_replicas             = var.cilium_operator_replicas
  cilium_prometheus_enabled            = var.cilium_prometheus_enabled
  cilium_psp_enabled                   = var.cilium_psp_enabled
  cilium_require_ipv4_pod_cidr         = var.cilium_require_ipv4_pod_cidr
  cilium_service_monitor_enabled       = var.cilium_service_monitor_enabled
  cilium_tunnel                        = var.cilium_tunnel
  cilium_wait_bfp                      = var.cilium_wait_bfp
  cloud_provider                       = local.cloud_provider
  cluster_cidr                         = var.cluster_cidr
  cluster_domain                       = var.cluster_domain
  delete_local_data_on_drain           = var.delete_local_data_on_drain
  dns_provider                         = var.dns_provider
  drain_grace_period                   = var.drain_grace_period
  drain_on_upgrade                     = var.drain_on_upgrade
  drain_timeout                        = var.drain_timeout
  enforce_node_allocatable             = var.enforce_node_allocatable
  etcd_backup_interval_hours           = var.etcd_backup_interval_hours
  etcd_backup_retention                = var.etcd_backup_retention
  etcd_extra_args                      = var.etcd_extra_args
  etcd_extra_binds                     = var.etcd_extra_binds
  etcd_extra_env                       = var.etcd_extra_env
  etcd_s3_access_key                   = var.etcd_s3_access_key
  etcd_s3_bucket_name                  = var.etcd_s3_bucket_name
  etcd_s3_endpoint                     = var.etcd_s3_endpoint
  etcd_s3_folder                       = var.etcd_s3_folder
  etcd_s3_region                       = var.etcd_s3_region
  etcd_s3_secret_key                   = var.etcd_s3_secret_key
  eviction_hard                        = var.eviction_hard
  fail_swap_on                         = var.fail_swap_on
  force_drain                          = var.force_drain
  generate_serving_certificate         = var.generate_serving_certificate
  hubble_enabled                       = var.hubble_enabled
  hubble_metrics                       = var.hubble_metrics
  hubble_relay_enabled                 = var.hubble_relay_enabled
  hubble_ui_enabled                    = var.hubble_ui_enabled
  ignore_daemon_sets_on_drain          = var.ignore_daemon_sets_on_drain
  ignore_docker_version                = var.ignore_docker_version
  ingress_provider                     = var.ingress_provider
  kube_api_extra_args                  = local.kube_api_extra_args
  kube_api_extra_binds                 = var.kube_api_extra_binds
  kube_api_extra_env                   = var.kube_api_extra_env
  kube_controller_extra_args           = var.kube_controller_extra_args
  kube_controller_extra_binds          = var.kube_controller_extra_binds
  kube_controller_extra_env            = var.kube_controller_extra_env
  kube_reserved                        = var.kube_reserved
  kube_reserved_cgroup                 = var.kube_reserved_cgroup
  kubelet_extra_args                   = var.kubelet_extra_args
  kubelet_extra_binds                  = var.kubelet_extra_binds
  kubelet_extra_env                    = var.kubelet_extra_env
  kubeproxy_extra_args                 = var.kubeproxy_extra_args
  kubeproxy_extra_binds                = var.kubeproxy_extra_binds
  kubeproxy_extra_env                  = var.kubeproxy_extra_env
  kubernetes_version                   = var.kubernetes_version
  max_pods                             = var.max_pods
  monitoring                           = var.monitoring
  node_cidr_mask_size                  = var.node_cidr_mask_size
  node_monitor_grace_period            = var.node_monitor_grace_period
  node_monitor_period                  = var.node_monitor_period
  node_status_update_frequency         = var.node_status_update_frequency
  node_user                            = var.node_user
  nodes                                = var.nodes
  pod_eviction_timeout                 = var.pod_eviction_timeout
  pod_security_policy                  = var.pod_security_policy
  private_key                          = var.private_key
  registry_url                         = var.registry_url
  registry_username                    = var.registry_username
  registry_password                    = var.registry_password
  registry_activate                    = var.registry_activate
  resource_naming                      = var.resource_naming
  rke_authorization                    = var.rke_authorization
  sans                                 = var.sans
  scheduler_extra_args                 = var.scheduler_extra_args
  scheduler_extra_binds                = var.scheduler_extra_binds
  scheduler_extra_env                  = var.scheduler_extra_env
  service_cluster_ip_range             = var.service_cluster_ip_range
  service_node_port_range              = var.service_node_port_range
  system_reserved                      = var.system_reserved
  system_reserved_cgroup               = var.system_reserved_cgroup
  upgrade_max_unavailable_controlplane = var.upgrade_max_unavailable_controlplane
  upgrade_max_unavailable_worker       = var.upgrade_max_unavailable_worker

  # vsphere cloud provider in-tree
  cloud_provider_vsphere_in_tree = var.cloud_provider_vsphere_in_tree

  # vsphere cloud provider out-tree
  vsphere_cluster_id    = var.vsphere_cluster_id
  vsphere_datacenter    = var.vsphere_datacenter
  vsphere_insecure_flag = var.vsphere_insecure_flag
  vsphere_password      = var.vsphere_password
  vsphere_port          = var.vsphere_port
  vsphere_server        = var.vsphere_server
  vsphere_username      = var.vsphere_username
  write_cluster_yaml    = var.write_cluster_yaml
  write_kubeconfig      = var.write_kubeconfig
}

module "addons" {
  source     = "bennu/yagan/addons"
  version    = "1.1.1"
  depends_on = [module.kubernetes]

  acme_email                             = var.acme_email
  acme_server                            = var.acme_server
  addons                                 = var.addons
  cert_manager_access_key                = var.cert_manager_access_key
  cert_manager_aws_region                = var.cert_manager_aws_region
  cert_manager_provider                  = var.cert_manager_provider
  cert_manager_rfc_alg                   = var.cert_manager_rfc_alg
  cert_manager_rfc_key_name              = var.cert_manager_rfc_key_name
  cert_manager_rfc_nameserver            = var.cert_manager_rfc_nameserver
  cert_manager_secret_key                = var.cert_manager_secret_key
  cert_manager_zone                      = var.cert_manager_zone
  create_default_cert                    = var.create_default_cert
  descheduler_low_node_utilization       = var.descheduler_low_node_utilization
  descheduler_rm_duplicates              = var.descheduler_rm_duplicates
  descheduler_rm_node_affinity_violation = var.descheduler_rm_node_affinity_violation
  descheduler_rm_pods_affinity_violation = var.descheduler_rm_pods_affinity_violation
  descheduler_rm_taint_violation         = var.descheduler_rm_taint_violation
  dex_expiry_device_requests             = var.dex_expiry_device_requests
  dex_expiry_id_tokens                   = var.dex_expiry_id_tokens
  dex_expiry_signing_keys                = var.dex_expiry_signing_keys
  dex_ldap_bind_dn                       = var.dex_ldap_bind_dn
  dex_ldap_bind_pw                       = var.dex_ldap_bind_pw
  dex_ldap_endpoint                      = var.dex_ldap_endpoint
  dex_ldap_groupsearch                   = var.dex_ldap_groupsearch
  dex_ldap_groupsearch_basedn            = var.dex_ldap_groupsearch_basedn
  dex_ldap_groupsearch_filter            = var.dex_ldap_groupsearch_filter
  dex_ldap_groupsearch_groupattr         = var.dex_ldap_groupsearch_groupattr
  dex_ldap_groupsearch_nameattr          = var.dex_ldap_groupsearch_nameattr
  dex_ldap_groupsearch_userattr          = var.dex_ldap_groupsearch_userattr
  dex_ldap_insecure_no_ssl               = var.dex_ldap_insecure_no_ssl
  dex_ldap_ssl_skip_verify               = var.dex_ldap_ssl_skip_verify
  dex_ldap_start_tls                     = var.dex_ldap_start_tls
  dex_ldap_username_prompt               = var.dex_ldap_username_prompt
  dex_ldap_usersearch                    = var.dex_ldap_usersearch
  dex_ldap_usersearch_basedn             = var.dex_ldap_usersearch_basedn
  dex_ldap_usersearch_emailattr          = var.dex_ldap_usersearch_emailattr
  dex_ldap_usersearch_filter             = var.dex_ldap_usersearch_filter
  dex_ldap_usersearch_idattr             = var.dex_ldap_usersearch_idattr
  dex_ldap_usersearch_nameattr           = var.dex_ldap_usersearch_nameattr
  dex_ldap_usersearch_username           = var.dex_ldap_usersearch_username
  dex_oauth_skip_approval_screen         = var.dex_oauth_skip_approval_screen
  dex_url                                = local.dex_url
  dns_zone                               = var.dns_zone
  external_dns_aws_access_key            = var.external_dns_aws_access_key
  external_dns_aws_prefer_cname          = var.external_dns_aws_prefer_cname
  external_dns_aws_region                = var.external_dns_aws_region
  external_dns_aws_secret_key            = var.external_dns_aws_secret_key
  external_dns_interval                  = var.external_dns_interval
  external_dns_provider                  = var.external_dns_provider
  external_dns_rfc_alg                   = var.external_dns_rfc_alg
  external_dns_rfc_axfr                  = var.external_dns_rfc_axfr
  external_dns_rfc_host                  = var.external_dns_rfc_host
  external_dns_rfc_key                   = var.external_dns_rfc_key
  external_dns_rfc_port                  = var.external_dns_rfc_port
  external_dns_rfc_secret                = var.external_dns_rfc_secret
  external_dns_rfc_ttl                   = var.external_dns_rfc_ttl
  external_dns_rfc_zone                  = var.external_dns_rfc_zone
  external_dns_txt_owner_id              = var.external_dns_txt_owner_id
  gangway_api_server_url                 = module.kubernetes.api_server_url
  gangway_cluster_name                   = module.kubernetes.cluster_name
  gangway_url                            = local.gangway_url
  grafana_url                            = var.grafana_url
  ingress_extra_args                     = var.ingress_extra_args
  ingress_max_replicas                   = var.ingress_max_replicas
  ingress_min_replicas                   = var.ingress_min_replicas
  ingress_service_type                   = var.ingress_service_type
  klum_api_server_url                    = module.kubernetes.api_server_url
  kured_timezone                         = var.kured_timezone
  metallb_addresses                      = var.metallb_addresses
  target_treshold_cpu                    = var.target_treshold_cpu
  target_treshold_mem                    = var.target_treshold_mem
  target_treshold_pods                   = var.target_treshold_pods
  treshold_cpu                           = var.treshold_cpu
  treshold_mem                           = var.treshold_mem
  treshold_pods                          = var.treshold_pods
  zone_id                                = var.zone_id
}
