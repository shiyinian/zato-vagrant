# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'getoptlong'

opts = GetoptLong.new(
  [ '--ssh-password',            GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--dashboard-password',      GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--ide-password',            GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--python-reqs',             GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--hot-deploy-dir',          GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--user-conf-dir',           GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--extlib-dir',              GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--cluster-name',            GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--enmasse-file',            GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--odb-type',                GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--odb-hostname',            GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--odb-port',                GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--odb-name',                GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--odb-username',            GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--odb-password',            GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--ip-address',              GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--host-dashboard-port',     GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--host-server-port',        GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--host-lb-port',            GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--host-database-port',      GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--host-ssh-port',           GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--run-internal-tests',      GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--run-internal-qs-step-01', GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--run-internal-qs-step-02', GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--help',                    GetoptLong::OPTIONAL_ARGUMENT ], # This one is needed for vagrant --help to continue to work
)

Zato_SSH_Password           = ENV['Zato_SSH_Password']
Zato_Dashboard_Password     = ENV['Zato_Dashboard_Password']
Zato_IDE_Password           = ENV['Zato_IDE_Password']
Zato_Python_Reqs            = ENV['Zato_Python_Reqs']
Zato_Hot_Deploy_Dir         = ENV['Zato_Hot_Deploy_Dir']
Zato_User_Conf_Dir          = ENV['Zato_User_Conf_Dir']
Zato_Extlib_Dir             = ENV['Zato_Extlib_Dir']
Zato_Cluster_Name           = ENV['Zato_Cluster_Name']
Zato_Enmasse_File           = ENV['Zato_Enmasse_File']
Zato_ODB_Type               = ENV['Zato_ODB_Type']
Zato_ODB_Hostname           = ENV['Zato_ODB_Hostname']
Zato_ODB_Port               = ENV['Zato_ODB_Port']
Zato_ODB_Name               = ENV['Zato_ODB_Name']
Zato_ODB_Username           = ENV['Zato_ODB_Username']
Zato_ODB_Password           = ENV['Zato_ODB_Password']
Zato_IP_Address             = ENV['Zato_IP_Address']
Zato_Host_Dashboard_Port    = ENV['Zato_Host_Dashboard_Port']
Zato_Host_Server_Port       = ENV['Zato_Host_Server_Port']
Zato_Host_LB_Port           = ENV['Zato_Host_LB_Port']
Zato_Host_Database_Port     = ENV['Zato_Host_Database_Port']
Zato_Host_SSH_Port          = ENV['Zato_Host_SSH_Port']
Zato_Run_Internal_Tests     = ENV['Zato_Run_Internal_Tests']
Zato_Run_Quickstart_Step_01 = ENV['Zato_Run_Quickstart_Step_01']
Zato_Run_Quickstart_Step_02 = ENV['Zato_Run_Quickstart_Step_02']

opts.ordering=(GetoptLong::REQUIRE_ORDER)

opts.each do |opt, arg|
  case opt
    when '--ssh-password';            Zato_SSH_Password         = arg.to_s()
    when '--dashboard-password';      Zato_Dashboard_Password   = arg.to_s()
    when '--ide-password';            Zato_IDE_Password         = arg.to_s()
    when '--python-reqs';             Zato_Python_Reqs          = arg.to_s()
    when '--hot-deploy-dir';          Zato_Hot_Deploy_Dir       = arg.to_s()
    when '--user-conf-dir';           Zato_User_Conf_Dir        = arg.to_s()
    when '--extlib-dir';              Zato_Extlib_Dir           = arg.to_s()
    when '--cluster-name';            Zato_Cluster_Name         = arg.to_s()
    when '--enmasse-file';            Zato_Enmasse_File         = arg.to_s()
    when '--odb-type';                Zato_ODB_Type             = arg.to_s()
    when '--odb-hostname';            Zato_ODB_Hostname         = arg.to_s()
    when '--odb-port';                Zato_ODB_Port             = arg.to_s()
    when '--odb-name';                Zato_ODB_Name             = arg.to_s()
    when '--odb-username';            Zato_ODB_Username         = arg.to_s()
    when '--odb-password';            Zato_ODB_Password         = arg.to_s()
    when '--ip-address';              Zato_IP_Address           = arg.to_s()
    when '--host-dashboard-port';     Zato_Host_Dashboard_Port  = arg.to_s()
    when '--host-server-port';        Zato_Host_Server_Port     = arg.to_s()
    when '--host-lb-port';            Zato_Host_LB_Port         = arg.to_s()
    when '--host-database-port';      Zato_Host_Database_Port   = arg.to_s()
    when '--host-ssh-port';           Zato_Host_SSH_Port        = arg.to_s()
    when '--run-internal-tests';      Zato_Run_Internal_Tests   = arg.to_s()
    when '--run-internal-qs-step-01'; Zato_Run_Quickstart_Step_01 = arg.to_s()
    when '--run-internal-qs-step-02'; Zato_Run_Quickstart_Step_02 = arg.to_s()
  end
end

# An IP address for the VM is always required - use the default one if none was given on input.
Zato_Default_IP_Address = "192.168.56.177"
Zato_IP_Address = Zato_IP_Address || Zato_Default_IP_Address

Zato_Host_Dashboard_Port = Zato_Host_Dashboard_Port || 8183
Zato_Host_Server_Port    = Zato_Host_Server_Port    || 17010
Zato_Host_LB_Port        = Zato_Host_LB_Port        || 11223
Zato_Host_Database_Port  = Zato_Host_Database_Port  || 5435
Zato_Host_SSH_Port       = Zato_Host_SSH_Port       || 2255

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network :private_network, ip: Zato_IP_Address
  config.ssh.forward_agent = true

  config.vm.hostname = "zato.localhost"
  config.vm.network :forwarded_port, guest: 8183,  host: Zato_Host_Dashboard_Port
  config.vm.network :forwarded_port, guest: 17010, host: Zato_Host_Server_Port
  config.vm.network :forwarded_port, guest: 11223, host: Zato_Host_LB_Port
  config.vm.network :forwarded_port, guest: 5432,  host: Zato_Host_Database_Port
  config.vm.network :forwarded_port, guest: 22,    host: Zato_Host_SSH_Port

  config.vm.provider :virtualbox do |v|
    v.name = "zato.localhost"
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # We mount it in a well-known temporary directory and let the provisioner find it there.
  if Zato_Python_Reqs
    config.vm.provision("file", source: Zato_Python_Reqs, destination: "/tmp/zato-user-reqs/requirements.txt")
    Zato_Has_Python_Reqs_In_Tmp = true
  else
    Zato_Has_Python_Reqs_In_Tmp = false
  end

  # Note that we mount the directories by numeric UID and GID. This is needed because,
  # if we were to use a username and group, Vagrant would return an error saying
  # that such a username and group do not exist. It would do it because it tries
  # to mount directories prior to the zato user's creation, i.e. prior to the actual provisioning.

  if Zato_Hot_Deploy_Dir
    config.vm.synced_folder(Zato_Hot_Deploy_Dir, "/opt/hot-deploy/services", mount_options: ["uid=1002", "gid=1002"])
  end

  if Zato_User_Conf_Dir
    config.vm.synced_folder(Zato_User_Conf_Dir, "/opt/hot-deploy/user-conf", mount_options: ["uid=1002", "gid=1002"])
  end

  # Use Ansible for provisioning.
  config.vm.provision 'ansible_local' do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.verbose = true
    ansible.playbook = "zato-quickstart.yaml"
    ansible.extra_vars = {
      Zato_SSH_Password:       Zato_SSH_Password,
      Zato_Dashboard_Password: Zato_Dashboard_Password,
      Zato_IDE_Password:       Zato_IDE_Password,
      Zato_User_Conf_Dir:      Zato_User_Conf_Dir,
      Zato_Hot_Deploy_Dir:     Zato_Hot_Deploy_Dir,
      Zato_Extlib_Dir:         Zato_Extlib_Dir,
      Zato_Cluster_Name:       Zato_Cluster_Name,
      Zato_Enmasse_File:       Zato_Enmasse_File,
      Zato_ODB_Type:           Zato_ODB_Type,
      Zato_ODB_Hostname:       Zato_ODB_Hostname,
      Zato_ODB_Port:           Zato_ODB_Port,
      Zato_ODB_Name:           Zato_ODB_Name,
      Zato_ODB_Username:       Zato_ODB_Username,
      Zato_ODB_Password:       Zato_ODB_Password,
      Zato_Save_Credentials: true,
      Zato_Root_Level_User: "vagrant",
      Zato_Has_Python_Reqs_In_Tmp: Zato_Has_Python_Reqs_In_Tmp,
      Zato_Hot_Deploy_Prefer_Snapshots: true,
      Zato_Firewall_Limit_To_Local_Connections: true,
      Zato_Run_Internal_Tests: Zato_Run_Internal_Tests,
      Zato_Run_Quickstart_Step_01: Zato_Run_Quickstart_Step_01,
      Zato_Run_Quickstart_Step_02: Zato_Run_Quickstart_Step_02,
    }
  end

end
